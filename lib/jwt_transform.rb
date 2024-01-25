module JwtTransform
    def self.encode(payload)
        token = JWT.encode(payload, JWT_KEY, 'HS256')
    end
    
    def self.decode(token)
        decoded_token = JWT.decode(token, JWT_KEY, true, { algorithm: 'HS256' })
        decoded_payload = decoded_token[0]
        decoded_payload
    rescue JWT::DecodeError => e
        puts "Erro ao decodificar o token: #{e.message}"
        nil
    end
end