class CommentsController < ApplicationController

  before_action :find_comments, only: [:show, :destroy, :update]

  def create
    @proposal = Proposal.find_by_id( params[:proposal_id] )
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

  def find_comments
    @comment=Comment.find_by_id(params[:id])
  end


  def comment_params
    params.require(:comment).permit(:content, :proposal_id, :user_id)
  end

end
