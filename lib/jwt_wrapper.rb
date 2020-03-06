module JWTWrapper

  def encode(payload, expiration = 24.hours.from_now)
    payload[:expiration] = expiration
    JWT.encode payload, Rails.application.secrets.secret_key_base, "HS256"
  end

  def decode(token)
    JWT.decode token, Rails.application.secrets.secret_key_base, true, { algorithm: "HS256" }
  end

end
