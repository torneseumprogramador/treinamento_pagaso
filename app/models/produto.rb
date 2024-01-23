class Produto < ApplicationRecord
  self.table_name = "tbl_produtos"
  belongs_to :pedido, foreign_key: "id_do_pedido", optional: true
end
