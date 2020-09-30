class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.float :rating
      t.string :description
      t.string :reviewer
      t.string :user_reviewed

      t.timestamps
    end
  end
end
