# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


itens_possiveis = ["Maçã", "Banana", "Uva", "Abacaxi", "Laranja", "Morango", "Kiwi", "Manga", "Pera", "Melancia", "Pêssego", "Amora", "Cereja", "Figo", "Goiaba", "Jaca", "Limão", "Maracujá", "Nectarina", "Pitanga", "Romã", "Tangerina", "Acerola", "Cajá", "Damasco", "Graviola", "Ingá", "Jamelão", "Kinkan", "Lichia", "Mamão", "Nêspera", "Pitaya", "Sapoti", "Tamarindo", "Ameixa", "Caqui", "Framboesa", "Guaraná", "Jabuticaba", "Lima", "Melão", "Noni", "Pupunha", "Seriguela", "Toranja"]
50.times do
    cliente_id = rand(1..1000) # Escolhe um cliente aleatório entre 1 e 1000
    valor_total = rand(10.0..1000.0).round(2) # Gera um valor total aleatório para o pedido
  
    # Seleciona aleatoriamente entre 1 e 10 itens e os junta em uma string, separados por vírgula
    itens = itens_possiveis.sample(rand(1..10)).join(", ")
  
    Pedido.create!(
      cliente_id: cliente_id,
      valor_total: valor_total,
      itens: itens
    )
end
  