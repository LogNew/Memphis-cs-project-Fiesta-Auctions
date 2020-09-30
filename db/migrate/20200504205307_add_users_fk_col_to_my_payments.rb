class AddUsersFkColToMyPayments < ActiveRecord::Migration[6.0]
  def change
    add_reference :my_payments, :user, foreign_key: true
  end
end
