class CommentsController < ApplicationController
  before_action :set_id, only: [:destroy, :update]
  def create
    @comment = Comment.new(comment_params)
    last = Comment.where(blog_id: params[:blog_id]).last
    if last
      @comment.serial = last.serial + 1
    end
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
    else
      flash[:notice] = "コメントの投稿に失敗しました"
    end
    redirect_to blog_path(params[:blog_id])
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      flash[:notice] = "コメントを編集しました"
    else
      flash[:notice] = "コメント編集に失敗しました"
    end
    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
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
