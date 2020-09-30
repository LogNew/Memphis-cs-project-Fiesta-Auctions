# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  location               :string
#  name                   :string
#  rating                 :float
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :avatar

  has_many(
          :my_payments, 
          class_name: 'MyPayments', 
          foreign_key: 'user_id', 
          inverse_of: :user, 
          dependent: :destroy 
        )

  #<-- association to bid -->
  has_many(
  :bids, 
  foreign_key: 'user_id',

  # <-- Need to create the destroy action -->
    dependent: :destroy 
  )

# <-- 
#  association to auction         
#  This could cause a problem with our code against the "has_man(auctions"
#  below. im going to leave it for now but we may need a work around 
# -->
  has_many(
  :auctions,
  foreign_key: 'user_id',
  dependent: :destroy

  )


    #<-- association to reviews -->
  has_many :reviews, dependent: :destroy

  
  
  
  
  # <-- assocaition to auctions 
  # My code may interfear with this 
  # might need to modify the code above
  # -->
  has_many(
    :auctions,
    class_name: 'Auction',
    foreign_key: 'user_id',
    inverse_of: :seller
  )

 # has_many :auctions, dependent: :destroy
  

end
