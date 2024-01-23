namespace :cadastrar_cliente do
    desc "Cadastra um novo cliente passando parametros externos"
    task :cadastrar, [:nome, :telefone, :endereco, :cpf, :cnpj] => :environment do |t, args|
        args.with_defaults(nome: "Nome Padrão", telefone: "Telefone padrão")

        # nome, telefone, endereco, cpf, cnpj = args.to_a
        # cliente = Cliente.new(nome: nome, telefone: telefone, endereco: endereco, cpf: cpf, cnpj: cnpj)
  
        cliente = Cliente.new(args.to_h)
        if cliente.save
            puts "Cliente cadastrado com sucesso: #{cliente.nome}"
        else
            puts "Erro ao cadastrar cliente"
        end
    end


    desc "Cadastra 1000 clientes"
    task :um_mil => :environment do |t|
        Faker::Config.locale = 'pt-BR'

        1000.times do
            cliente = Cliente.new(
                {
                    nome: Faker::Name.name,
                    telefone: Faker::PhoneNumber.phone_number,
                    endereco: Faker::Address.full_address,
                    cpf: Faker::IDNumber.brazilian_citizen_number(formatted: true),
                    cnpj: Faker::IDNumber.brazilian_id
                }
            )

            if cliente.save
                puts "."
            else
                puts "E"
            end
        end
    end


    desc "Cadastra 1000 clientes"
    task :atualiza_sobrado_65 => :environment do |t|
        clientes = Cliente.where("endereco like '%Sobrado 65 s/n%'")
        clientes.each do |cliente|
            cliente.endereco = cliente.endereco.gsub("Sobrado 65 s/n", "Sobrado 85 número 300,")
            if cliente.save
                puts "."
            else
                puts "E"
            end
        end
    end
end
  