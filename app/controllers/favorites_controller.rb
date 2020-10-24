class FavoritesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_book
    
     # お気に入り登録
  def create
      favorite = current_user.favorites.build(book_id: @book.id)
      favorite.save
  end
  # お気に入り削除
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    favorite.destroy
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end
end
