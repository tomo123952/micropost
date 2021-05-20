class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'マイクロポストをお気に入りにしました。'
    redirect_to root_url
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] =  'マイクロポストをお気に入りから解除しました。'
    redirect_to root_url
  end
end
