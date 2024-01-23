class CreateAdministradors < ActiveRecord::Migration[7.1]
  def change
    create_table :administradors do |t|
      t.string :nome, limit: 150
      t.string :senha, limit: 100
      t.string :email, limit: 150

      t.timestamps
    end
  end
end
