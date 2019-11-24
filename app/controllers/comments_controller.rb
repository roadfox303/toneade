class CommentsController < ApplicationController
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

  private
  # ストロングパラメーター
  def comment_params
    params.permit(:blog_id, :user_id, :content)
  end
end
