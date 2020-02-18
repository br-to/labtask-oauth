class JsonWebToken
  def self.encode(payload, exp = 24.hours.from_now, iat = Time.now, iss = 'LabTaskOauth')
    payload[:exp] = exp.to_i
    payload[:iat] = iat.to_i
    payload[:iss] = iss
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end