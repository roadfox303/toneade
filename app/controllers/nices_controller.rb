# frozen_string_literal: true

class NicesController < ApplicationController
  def create
    nice = current_user.nices.find_or_create_by(blog_id: params[:blog_id])
    redirect_to blog_path(params[:blog_id]), notice: 'Nice!しました'
  end

  def destroy
    back = Nice.find(params[:id]).blog_id
    nice = current_user.nices.find_by(id: params[:id]).destroy
    redirect_to blog_path(back), notice: 'Nice!を取り消しました'
  end
end
