class UsersController < ApplicationController
    before_action :sign_in_required
    before_action :set_user
    
    def rank
    end
    
    def followers
    end
    
    def followings
    end

    def show
        @books = @user.books
    end
    
    def edit
    end
    
    def update
        if @user.update(user_params)
          redirect_to user_path(@user)
        else
          render 'edit'
        end
    end

  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
    
    def set_user
        @user = User.find_by(name: params[:user_name])
    end
end
