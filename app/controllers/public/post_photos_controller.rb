class Public::PostPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post_photo = PostPhoto.new
  end

  def create
    @post_photo = PostPhoto.new(post_photo_params)
    @post_photo.user_id = current_user.id
    if @post_photo.save
      flash[:notice] = "投稿しました。"
      redirect_to post_photo_path(@post_photo.id)
    else
      flash.now[:alert] = "投稿に失敗しました。入力内容を確認してください"
      render :new
    end
  end

  def index
    @post_photos = PostPhoto.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
    @post_photo = PostPhoto.find(params[:id])
  end

  def destroy
    post_photo = PostPhoto.find(params[:id])
    post_photo.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to user_path(current_user.id)
  end

  private

  def post_photo_params
    params.require(:post_photo).permit(:photo_image, :type_name, :introduction)
  end
end
