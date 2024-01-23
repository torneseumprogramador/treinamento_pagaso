namespace :atualiza_cliente do
    desc "Muda o nome do primeiro cliente para Zacarias"
    task :fazer, [:nome, :telefone, :endereco, :cpf, :cnpj] => :environment do |t, args|
        cliente = Cliente.first
        cliente.nome = "Zacarias"
        cliente.save
    end
end
  