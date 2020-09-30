# == Schema Information
#
# Table name: my_payments
#
#  id              :bigint           not null, primary key
#  card_number     :string
#  exp_date        :string
#  name            :string
#  security_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint
#
# Indexes
#
#  index_my_payments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class MyPayments < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :my_payments 
      )
end
