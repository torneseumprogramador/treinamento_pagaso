json.extract! pedido, :id, :cliente_id, :valor_total, :itens, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
