class CreateMyPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :my_payments do |t|
      t.string :name
      t.string :card_number
      t.string :exp_date
      t.string :security_number

      t.timestamps
    end
  end
end
