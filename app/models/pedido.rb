class Pedido < ApplicationRecord
  # self.table_name = "tbl_pedidos"
  # self.primary_key = 'id_pedido'
  belongs_to :cliente

  has_many :produtos, foreign_key: "id_do_pedido"

end
