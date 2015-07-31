class CommentsController < ApplicationController

  before_action :find_comment, only: [:show, :destroy, :update]

  def create
    @proposal = Proposal.find( params[:proposal_id] )
    @comment= @proposal.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Done!"
          redirect_to :back
        }
        format.js
      end
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:alert] = "Update Success"
    else
      flash[:alert] = "Update Failed"
    end
  end

  def destroy
    @comment.destroy
    flash[:alert] = "Delete Success"
  end

  protected

  def find_comment
    @comment = Comment.find(params[:id]) # raise ActiveRecord::RecordNotFound exception, it means 404

    # find_by_id will return nil if not found, then it may cause NoMethodError later, it means 500 server error
  end


  def comment_params
    params.require(:comment).permit(:content, :proposal_id, :user_id)
  end

end
