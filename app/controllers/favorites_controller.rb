class FavoritesController < ApplicationController
  before_action :sign_in_required
  before_action :set_book, except: [:index]

  def index
    user = User.find_by(name: params[:user_name])
    @books = user.favorite_books.includes(:user, :favorites).page(params[:page]).per(20)
  end

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
