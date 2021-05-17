class RelationshipsController < ApplicationController
  before_action :require_user_logged_in

  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    redirect_to user, notice:'ユーザをフォローしました。'
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    redirect_to user, notice:'ユーザのフォローを解除しました。'
  end
end
