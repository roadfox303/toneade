class OwndsController < ApplicationController
  def create
    
    # nice = current_user.nices.find_or_create_by(blog_id: params[:blog_id])
    # redirect_to blog_path(params[:blog_id]), notice: 'Nice!しました'
  end

  def destroy

  end
end
