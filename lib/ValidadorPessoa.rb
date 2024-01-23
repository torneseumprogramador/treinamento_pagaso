module ValidadorPessoa
    def self.valida_cpf(cpf)
        cpf = cpf.scan(/[0-9]/).map(&:to_i)
        return false if cpf.length != 11 || cpf.uniq.length == 1
      
        soma = 10*cpf[0] + 9*cpf[1] + 8*cpf[2] + 7*cpf[3] + 6*cpf[4] + 5*cpf[5] + 4*cpf[6] + 3*cpf[7] + 2*cpf[8]
        soma = soma % 11
        soma = (soma < 2) ? 0 : 11 - soma
        return false unless soma == cpf[9]
      
        soma = 11*cpf[0] + 10*cpf[1] + 9*cpf[2] + 8*cpf[3] + 7*cpf[4] + 6*cpf[5] + 5*cpf[6] + 4*cpf[7] + 3*cpf[8] + 2*cpf[9]
        soma = soma % 11
        soma = (soma < 2) ? 0 : 11 - soma
      
        soma == cpf[10]
    end

    def self.valida_cnpj(cnpj)
        cnpj = cnpj.scan(/[0-9]/).map(&:to_i)
        return false if cnpj.length != 14 || cnpj.uniq.length == 1
      
        multiplicadores = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
        soma = cnpj[0..11].each_with_index.sum { |numero, i| numero * multiplicadores[i] }
        soma = soma % 11
        soma = (soma < 2) ? 0 : 11 - soma
        return false unless soma == cnpj[12]
      
        multiplicadores.unshift(6)
        soma = cnpj[0..12].each_with_index.sum { |numero, i| numero * multiplicadores[i] }
        soma = soma % 11
        soma = (soma < 2) ? 0 : 11 - soma
      
        soma == cnpj[13]
    end
end