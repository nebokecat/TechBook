class FavoritesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_book
    
     # お気に入り登録
  def create
    if @book.user_id != current_user.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(user_id: current_user.id, book_id: @book.id)
    end
    redirect_to books_path
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    @favorite.destroy
    redirect_to books_path
  end

  private
  def set_book
    @book = Book.find(params[:book_id])
  end
end
