class Public::HomesController < ApplicationController
  def top
    @post_photos = PostPhoto.page(params[:page]).per(3).order("created_at DESC")
  end

  def about
  end
end
