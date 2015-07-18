class ProposalcommentsController < ApplicationController

  def create
    @comment=Comment.new(comment_params)
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
    params.require(:comment).permit(:content)
  end

end
