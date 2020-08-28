class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :secondary_email
      t.string :phone
      t.string :comercial_phone

      t.timestamps
    end
  end
end
