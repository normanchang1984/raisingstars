class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show,]
  before_action :find_my_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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

  def pay

  end

  def favorite
    @proposal = Proposal.find(params[:id])
    user_favor = current_user.userproposalships.find_by_proposal_id(@proposal.id)
    if user_favor
      user_favor.destroy
    else
      current_user.add_proposal_relationship(current_user, @proposal)
    end
    redirect_to @proposal
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
    @user = User.find_by_id(@proposal.user_id)
  end

  def proposal_params
    params.require(:proposal).permit(:name, :email, :phone, :self_intro, :title, :content, :category_id)
  end

end
