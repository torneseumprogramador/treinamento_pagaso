class CreateTokenAcessos < ActiveRecord::Migration[7.1]
  def change
    create_table :token_acessos do |t|
      t.string :token
      t.string :key

      t.timestamps
    end
  end
end
