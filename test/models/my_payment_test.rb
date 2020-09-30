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
#
require 'test_helper'

class MyPaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
