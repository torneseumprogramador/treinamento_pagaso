json.extract! administrador, :id, :nome, :senha, :email, :created_at, :updated_at
json.url administrador_url(administrador, format: :json)
