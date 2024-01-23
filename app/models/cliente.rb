class Cliente < ApplicationRecord
    has_many :pedidos #, dependent: :destroy

    validates :nome, :telefone, presence: true

    validates :telefone, format: { with: /\A\(\d{2}\) \d{5}-\d{4}\z/, message: "deve ter o formato (99) 99999-9999" }

    validates :nome, length: { minimum: 5, maximum: 20 }

    validates :cpf, uniqueness: { allow_nil: true, allow_blank: true }

    validates :cnpj, uniqueness: { allow_nil: true, allow_blank: true }

    validates :cpf, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, allow_blank: true, message: "deve ter o formato XXX.XXX.XXX-XX" }

    validates :cnpj, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, allow_blank: true, message: "deve ter o formato XX.XXX.XXX/XXXX-XX" }

    # validates :endereco, numericality: true
    # validates :endereco, numericality: { greater_than: 0 }
    # validates :endereco, numericality: { greater_than_or_equal_to: 0 }
    # validates :endereco, numericality: { less_than: 0 }
    # validates :endereco, numericality: { less_than_or_equal_to: 0 }

    # validates :endereco, inclusion: { in: ["São Paulo", "Rio de Janeiro", "Belo Horizonte"] }
    # validates :endereco, exclusion: { in: ["Otário", "otário", "otario", "otário", "filho da puta"] }
    validate :nao_pode_palavras_de_baixo_calao, :palavras_maiusculas

    def nao_pode_palavras_de_baixo_calao
        if self.endereco.downcase.scan(/otário|otario|filho da puta/).present?
            self.errors.add(:base, "não pode palavras de baixo calão")
        end
    end

    def palavras_maiusculas
        if self.endereco.upcase != self.endereco
            self.errors.add(:base, "Não está tudo maiúsculo")
        end
    end

    def self.find(id)
        obj = super(id)
        return obj if obj.ativo

        raise "Cliente Inativo"
    end

    def destroy
        Cliente.where(id: self.id).update_all(ativo: false)
    end

    def delete
        self.destroy
    end
end
