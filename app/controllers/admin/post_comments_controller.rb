class Admin::PostCommentsController < ApplicationController
  
  def destroy
    comment = PostComment.find_by(id:params[:id], post_id: params[:post_id])
    comment.destroy
    redirect_to admin_post_path(params[:post_id])
  end
  
end
