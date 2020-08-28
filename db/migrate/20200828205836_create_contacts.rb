class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :comercial_phone
      t.string :email
      t.string :secondary_email
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
