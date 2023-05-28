class Public::PostCommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
  end
  
  def destroy
    comment = PostComment.find_by(id:params[:id], post_id: params[:post_id])
    comment.destroy
    redirect_to post_path(params[:post_id])
  end
  
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:post_comment)
  end
  
  # ユーザ特定用
  def ensure_correct_post_customer
    post = Post.find(params[:id])
    if current_customer.id != post.customer_id
      flash[:notice] = "権限がありません"
      redirect_to post_path(post)
    end
  end
  
end
