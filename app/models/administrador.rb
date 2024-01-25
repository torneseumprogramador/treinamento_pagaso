class Administrador < ApplicationRecord
    before_save :crypto_senha

    private
    def crypto_senha
        unless CryptoTransform::foi_criptografada?(self.senha)
            self.senha = CryptoTransform::encode(self.senha)
        end
    end
end
