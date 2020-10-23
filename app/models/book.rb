class Book < ApplicationRecord
    belongs_to :user
    has_many :favorites,dependent: :destroy
    has_many :book_comments,dependent: :destroy
    
    def favorited_by?(user)
        Favorite.where(user_id: user.id, book_id: self.id).exists?
    end
end
