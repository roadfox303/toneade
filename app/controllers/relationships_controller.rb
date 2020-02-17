# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    if user_signed_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
    end
    flash[:notice] = "#{@user.name} をフォローしました"
    redirect_to params[:relationship][:return]
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    flash[:notice] = "#{@user.name} のフォローを解除しました"
    redirect_to params[:relationship][:return]
  end
end
