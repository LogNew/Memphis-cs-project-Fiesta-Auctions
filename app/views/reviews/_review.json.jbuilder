json.extract! review, :id, :title, :rating, :description, :reviewer, :user_reviewed, :created_at, :updated_at
json.url review_url(review, format: :json)
