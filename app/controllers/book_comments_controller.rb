class BookCommentsController < ApplicationController
    before_action :authenticate_user!
  def create
    @comment = current_user.book_comments.build(comment_params)
    @comment.book_id = params[:book_id]
    @comment.save
    @book = Book.find(params[:book_id])
    redirect_to books_path
  end

  def destroy
    @comment = BookComment.find(params[:book_id])
    @book = @comment.book
    @comment.destroy
    redirect_to books_path
  end

  private
    def comment_params
        params.require(:book_comment).permit(:comment)
    end
end