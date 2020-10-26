class RelationshipsController < ApplicationController
     before_action :set_user

  def create
    current_user.follow(@user)
    flash[:success] = 'ユーザーをフォローしました'
  end

  def destroy
    current_user.unfollow(@user)
    flash[:success] = 'ユーザーのフォローを解除しました'
  end


  private
      
      def set_user
        @user = User.find_by(name: params[:user_name])
      end
end
