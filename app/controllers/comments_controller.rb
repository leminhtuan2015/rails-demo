class CommentsController < ApplicationController
	def create	
    @entry = Entry.find(params[:entry_id])
    #We use the create method on @article.comments to create and save the comment.
    #This will automatically link the comment so that it belongs to that particular article.
    params[:comment][:user_id] = current_user.id
    @comment = @entry.comments.create(comment_params)
    redirect_to user_path(@entry.user_id)
  end

  def destroy
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.find(params[:id])
    @comment.destroy
    redirect_to user_path(@entry.user_id)
  end
 
  private
    def comment_params	
      params.require(:comment).permit(:body,:user_id)
    end
end

