# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_id, only: %i[destroy update]
  def create
    @comment = Comment.new(comment_params)
    last = Comment.where(blog_id: params[:blog_id]).last
    @comment.serial = last.serial + 1 if last
    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
    else
      error_num = @comment.errors.count
      error_msg = ''
      @comment.errors.full_messages.each do |msg|
        error_msg << msg
      end
      flash[:notice] = error_msg
    end
    redirect_to blog_path(params[:blog_id])
  end

  def update
    @comment.update(comment_params)
    flash[:notice] = if @comment.save
                       'コメントを編集しました'
                     else
                       'コメント編集に失敗しました'
                     end
    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to blog_path(params[:blog_id])
  end

  private

  # ストロングパラメーター
  def comment_params
    params.permit(:id, :blog_id, :user_id, :content)
  end

  def set_id
    @comment = Comment.find(params[:id])
  end
end
