class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def create
    @proposal = Proposal.new(proposal_params)
  end

  def show
    @comments = Comment.find_by_id(params[:id])
  end

  def edit

  end

  def update
    if @proposal.update(proposal_params)
      flash[:notice] = "Update success"
    else
      flash[:notice] = "Update fail"
    end
  end

  def destory
    @proposal.destory
    flash[:alert] = "Delete Success"
  end

  private

  def set_proposal
    @proposal = Proposal.find_by_id( params[:id] )
  end

  def proposal_params
    params.require(:proposal).permit(:name, :email, :phone, :self_intro, :title, :content, :category_id)
  end

end
