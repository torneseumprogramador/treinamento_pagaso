class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.references :cliente, null: false, foreign_key: true
      t.float :valor_total
      t.text :itens

      t.timestamps
    end
  end
end
