# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :sign_in_required
  before_action :set_user

  def rank
    # ランキング機能想定
  end

  def followers
    @users = @user.followers.includes(:followings, :followers).page(params[:page]).per(20)
  end

  def followings
    @users = @user.followings.includes(:followings, :followers).page(params[:page]).per(20)
  end

  def show
    @books = @user.books.includes(:favorites).order(created_at: :desc).page(params[:page]).per(20)
  end

  def edit
    # set_userのみ
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.name)
    else
      @user.name = params[:user_name]
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
