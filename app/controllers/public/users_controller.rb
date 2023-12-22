class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @post_photos = @user.post_photos
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "ユーザー名、メールアドレスは必須です。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email, :introduction)
  end
end
