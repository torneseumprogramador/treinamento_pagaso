class FlagDeleteCliente < ActiveRecord::Migration[7.1]
  def change
    add_column :clientes, :ativo, :boolean, default: true
  end
end
