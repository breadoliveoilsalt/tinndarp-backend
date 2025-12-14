# Manual Deployment Guide for TINNDARP Backend

This guide walks through manually deploying the TINNDARP Rails backend to an EC2 instance from scratch.

## Prerequisites

-   EC2 instance running Amazon Linux 2023 (or similar)
-   Access to the EC2 instance via AWS Session Manager (SSM)
-   RDS PostgreSQL database already created and accessible
-   Terraform outputs available (for database connection details)

## Step 1: Connect to EC2 Instance

Connect to your EC2 instance using AWS Session Manager:

```bash
aws ssm start-session --target <ec2_instance_id>
```

Get the instance ID from Terraform outputs:

```bash
cd tinndarp-terraform
terraform output ec2_instance_id
```

## Step 2: Install Ruby 3.4.6

The backend requires Ruby 3.4.6. We'll use `ruby-install` to install it (compiling from source can be resource-intensive on small instances, so this method is preferred).

### Install ruby-install

```bash
cd /tmp
wget -O ruby-install-0.9.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.9.3.tar.gz
tar -xzf ruby-install-0.9.3.tar.gz
cd ruby-install-0.9.3
sudo make install
```

### Install Ruby 3.4.6

```bash
ruby-install --latest --no-install-deps ruby 3.4.6
```

This will install Ruby to `~/.rubies/ruby-3.4.6/`.

### Add Ruby to PATH

```bash
echo 'export PATH="$HOME/.rubies/ruby-3.4.6/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.rubies/ruby-3.4.6/bin:$PATH"
```

### Verify Ruby Installation

```bash
ruby --version
# Should output: ruby 3.4.6p...
```

## Step 3: Install Bundler

```bash
gem install bundler
```

## Step 4: Set Up Application Directory

```bash
sudo mkdir -p /opt/tinndarp-backend
sudo chown $(whoami):$(whoami) /opt/tinndarp-backend
cd /opt/tinndarp-backend
```

**Note**: Replace `$(whoami)` with your actual username (e.g., `ssm-user` or `ec2-user`) if needed.

## Step 5: Clone the Repository

```bash
git clone https://gitlab.com/breadoliveoilsalt/tinndarp-backend.git .
```

**Important**: The `.` at the end clones directly into the current directory. If you accidentally clone into a subdirectory, you can fix it with:

```bash
cd /opt/tinndarp-backend
mv tinndarp-backend/* tinndarp-backend/.* . 2>/dev/null || true
rmdir tinndarp-backend
```

## Step 6: Install Dependencies

```bash
bundle install --deployment --without development test
```

The `--deployment` flag installs gems to `vendor/bundle` for production, and `--without development test` skips development/test gems.

## Step 7: Generate Rails Secret Key

```bash
RAILS_ENV=production bundle exec rails secret
```

**Save this secret key** - you'll need it for the next step.

## Step 8: Set Up Environment Variables

You'll need the following information from your Terraform outputs:

-   Database host (RDS endpoint)
-   Database password
-   Database name (usually `tinndarp_backend_production`)
-   Database username (usually `tinndarp_backend`)
-   Secret key base (from Step 7)

Get Terraform outputs:

```bash
cd tinndarp-terraform
terraform output
```

### Create System Environment File

**Replace the placeholders** with your actual values.

```bash
sudo tee /etc/environment.d/tinndarp-backend.conf > /dev/null <<EOF
RAILS_ENV=production
PORT=3000
RAILS_LOG_TO_STDOUT=true
TINNDARP_BACKEND_DATABASE_PASSWORD=<your-db-password>
DATABASE_URL=postgresql://<db-username>:<db-password>@<db-host>:5432/<db-name>
SECRET_KEY_BASE=<your-secret-key-from-step-7>
EOF
```

### Add to User's .bashrc (for manual commands)

**Replace the placeholders** with your actual values.

```bash
cat >> ~/.bashrc <<'EOF'
export RAILS_ENV=production
export PORT=3000
export RAILS_LOG_TO_STDOUT=true
export TINNDARP_BACKEND_DATABASE_PASSWORD=<your-db-password>
export DATABASE_URL=postgresql://<db-username>:<db-password>@<db-host>:5432/<db-name>
export SECRET_KEY_BASE=<your-secret-key-from-step-7>
EOF
```

### Load Environment Variables

```bash
source ~/.bashrc
```

### Verify Environment Variables

```bash
echo $RAILS_ENV
echo $DATABASE_URL
```

## Step 9: Set Up Database

### Check Database Connection

```bash
cd /opt/tinndarp-backend
RAILS_ENV=production bundle exec rails db:version
```

If you see `Current version: 0`, the database exists but hasn't been migrated yet (this is expected for a fresh setup).

### Create, Migrate, and Seed Database

```bash
RAILS_ENV=production bundle exec rails db:create db:migrate db:seed
```

### Verify Database Version

```bash
RAILS_ENV=production bundle exec rails db:version
```

You should now see a version number > 0 (e.g., `Current version: 20200316142157`).

## Step 10: Precompile Assets (if needed - generally, it is not for an api-only app like this)

```bash
RAILS_ENV=production bundle exec rails assets:precompile
```

## Step 11: Test Rails Application

### Test that Rails can load

```bash
RAILS_ENV=production bundle exec rails runner "puts 'Rails loaded successfully'"
```

### Create PIDs Directory (required for Puma)

```bash
mkdir -p tmp/pids
```

## Step 12: Test Puma Server (Manual Start)

Start Puma manually to verify everything works:

```bash
cd /opt/tinndarp-backend
RAILS_ENV=production bundle exec puma -C config/puma.rb
```

You should see output like:

```
Puma starting in single mode...
* Puma version: 5.6.9 (ruby 3.4.6-p54)
*  Min threads: 5
*  Max threads: 5
*  Environment: production
*          PID: <pid>
* Listening on http://0.0.0.0:3000
```

**Press Ctrl+C to stop** the server after verifying it starts successfully.

## Step 13: Set Up Systemd Service

Create a systemd service so the backend runs automatically in the background and restarts on failure.

### Create Service File

```bash
sudo tee /etc/systemd/system/tinndarp-backend.service > /dev/null <<'EOF'
[Unit]
Description=Tinndarp Rails Backend
After=network.target

[Service]
Type=simple
User=<your-username>
WorkingDirectory=/opt/tinndarp-backend
Environment="RAILS_ENV=production"
Environment="PORT=3000"
Environment="RAILS_LOG_TO_STDOUT=true"
Environment="TINNDARP_BACKEND_DATABASE_PASSWORD=<your-db-password>"
Environment="DATABASE_URL=postgresql://<db-username>:<db-password>@<db-host>:5432/<db-name>"
Environment="SECRET_KEY_BASE=<your-secret-key>"
Environment="PATH=/home/<your-username>/.rubies/ruby-3.4.6/bin:/usr/local/bin:/usr/bin:/bin"
ExecStart=/home/<your-username>/.rubies/ruby-3.4.6/bin/bundle exec puma -C config/puma.rb
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF
```

**Replace placeholders**:

-   `<your-username>` - Your EC2 username (e.g., `ssm-user` or `ec2-user`)
-   `<your-db-password>` - Your database password
-   `<db-username>` - Database username
-   `<db-password>` - Database password
-   `<db-host>` - RDS endpoint hostname
-   `<db-name>` - Database name
-   `<your-secret-key>` - Secret key from Step 7

**Example** (replace all placeholders with your actual values):

```bash
sudo tee /etc/systemd/system/tinndarp-backend.service > /dev/null <<'EOF'
[Unit]
Description=Tinndarp Rails Backend
After=network.target

[Service]
Type=simple
User=<your-username>
WorkingDirectory=/opt/tinndarp-backend
Environment="RAILS_ENV=production"
Environment="PORT=3000"
Environment="RAILS_LOG_TO_STDOUT=true"
Environment="TINNDARP_BACKEND_DATABASE_PASSWORD=<your-db-password>"
Environment="DATABASE_URL=postgresql://<db-username>:<db-password>@<db-host>:5432/<db-name>"
Environment="SECRET_KEY_BASE=<your-secret-key>"
Environment="PATH=/home/<your-username>/.rubies/ruby-3.4.6/bin:/usr/local/bin:/usr/bin:/bin"
ExecStart=/home/<your-username>/.rubies/ruby-3.4.6/bin/bundle exec puma -C config/puma.rb
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF
```

### Reload Systemd and Enable Service

```bash
sudo systemctl daemon-reload
sudo systemctl enable tinndarp-backend
```

### Stop Any Running Puma Processes

If you started Puma manually in Step 12, stop it:

```bash
pkill -f puma
```

Or press `Ctrl+C` if it's running in your current terminal.

### Start the Service

```bash
sudo systemctl start tinndarp-backend
```

### Check Service Status

```bash
sudo systemctl status tinndarp-backend
```

You should see `Active: active (running)`.

### View Service Logs

```bash
sudo journalctl -u tinndarp-backend -f
```

Press `Ctrl+C` to exit log viewing.

## Step 14: Verify Deployment

### Test Backend API via CloudFront

Get the CloudFront backend API URL from Terraform outputs:

```bash
cd tinndarp-terraform
terraform output backend_api_url_https
```

Then test from your local machine:

```bash
curl https://<cloudfront-backend-api-domain>/api
```

You should get a response from the backend API.

**Note**: The backend runs on port 3000 internally, but it's accessed via CloudFront HTTPS in production. The CloudFront distribution provides HTTPS termination and proxies requests to the EC2 instance.

## Service Management

### Start Service

```bash
sudo systemctl start tinndarp-backend
```

### Stop Service

```bash
sudo systemctl stop tinndarp-backend
```

### Restart Service

```bash
sudo systemctl restart tinndarp-backend
```

### Check Status

```bash
sudo systemctl status tinndarp-backend
```

### View Logs

```bash
sudo journalctl -u tinndarp-backend -n 50  # Last 50 lines
sudo journalctl -u tinndarp-backend -f      # Follow logs
```

### Disable Auto-Start on Boot

```bash
sudo systemctl disable tinndarp-backend
```

### Enable Auto-Start on Boot

```bash
sudo systemctl enable tinndarp-backend
```

## Troubleshooting

### Service Won't Start

1. Check service status:

    ```bash
    sudo systemctl status tinndarp-backend
    ```

2. Check logs:

    ```bash
    sudo journalctl -u tinndarp-backend -n 100
    ```

3. Verify environment variables are set correctly in the service file.

4. Test running Puma manually:
    ```bash
    cd /opt/tinndarp-backend
    RAILS_ENV=production bundle exec puma -C config/puma.rb
    ```

### Database Connection Issues

1. Verify RDS security group allows connections from EC2 security group.
2. Check database credentials in environment variables.
3. Test connection:
    ```bash
    RAILS_ENV=production bundle exec rails db:version
    ```

### Ruby Not Found

If you get "ruby: command not found":

```bash
export PATH="$HOME/.rubies/ruby-3.4.6/bin:$PATH"
source ~/.bashrc
```

### Permission Denied Errors

Make sure the application directory is owned by your user:

```bash
sudo chown -R $(whoami):$(whoami) /opt/tinndarp-backend
```

## Notes

-   The systemd service will automatically restart the backend if it crashes (after 10 seconds).
-   The service starts automatically on system boot.
-   Logs are sent to stdout and can be viewed with `journalctl`.
-   Environment variables are set in both `/etc/environment.d/` and the systemd service file for redundancy.
