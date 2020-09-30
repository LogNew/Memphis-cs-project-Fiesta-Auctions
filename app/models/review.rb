# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  description   :string
#  rating        :float
#  reviewer      :string
#  title         :string
#  user_reviewed :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

#  description   :string
#  rating        :float
#  reviewer      :string
#  title         :string
#  user_reviewed :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_reviews_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)

#
class Review < ApplicationRecord

    belongs_to :user

end
