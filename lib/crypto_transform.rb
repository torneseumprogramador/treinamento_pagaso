require 'bcrypt'
module CryptoTransform
    def self.encode(password)
        BCrypt::Password.create(password)
    end

    def self.foi_criptografada?(password)
        /\A\$2[aby]\$\d{2}\$[.\/A-Za-z0-9]{53}\z/.match?(password)
    end

    def self.senha_igual?(senha_sem_criptografar, senha_criptografada)
        BCrypt::Password.new(senha_criptografada) == senha_sem_criptografar
    end

    def self.encode_do_csharp(password)
        `SENHA="#{password}" /Users/danilo/projetos/pagaso/crypto/publicado/crypto`
    end
end