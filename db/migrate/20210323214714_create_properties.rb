class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.decimal :rental_price
      t.string :status
      t.string :tenant_name
      t.string :tenant_email
      t.string :tenant_phone
      t.string :tenant_availability

      t.timestamps
    end
  end
end
