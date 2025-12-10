# Ruby 3.4.6 compatibility: Enable YAML aliases for Psych
# In Ruby 3.4, Psych requires explicit enabling of aliases for security reasons
# This is needed for database.yml and other YAML config files that use aliases

if defined?(Psych) && Psych::VERSION >= "5.0"
  # Monkey patch YAML.load to enable aliases by default for Rails compatibility
  module YAML
    class << self
      alias_method :load_without_aliases, :load

      def load(yaml, **kwargs)
        kwargs[:aliases] = true unless kwargs.key?(:aliases)
        load_without_aliases(yaml, **kwargs)
      end
    end
  end
end

