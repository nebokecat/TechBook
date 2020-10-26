class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow,class_name: 'User',foreign_key: :follow_id
  
  validates :user_id,presence: true
  validates :follow_id,presence: true
end
