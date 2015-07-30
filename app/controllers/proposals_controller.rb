class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show]
  before_action :authenticate_user!, except: [:index, :show,:favorite]

  def index
    @proposals = Proposal.all
  end

  def create
    @proposal = current_user.proposals.build(proposal_params)
    @proposal.progress = 0
    @proposal.target = 0
    if @proposal.save
      @proposal.products.create!( :title => "Basic", :price => "100", :description => "....", :proposal_id => @proposal.id )
      @proposal.products.create!( :title => "standard", :price => "500", :description => "真是相當優秀", :proposal_id => @proposal.id)
      @proposal.products.create!( :title => "Premium", :price => "1000", :description => "根本好棒棒", :proposal_id => @proposal.id)
      redirect_to @proposal
    else
      render 'new'
    end
  end

  def show

    @comments = @proposal.comments
    @newcomment = Comment.new
    @percent = @proposal.progress.to_f/@proposal.target.to_f*100
    @proposal_orders = @proposal.orders
    if  @proposal.progress > @proposal.target
    end

    if current_user
      @user_favor = current_user.userproposalships.find_by_proposal_id(@proposal.id)
    end

  end

  def new
    @proposal = current_user.proposals.build
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
    @proposal = Proposal.find(params[:id])
    @products = @proposal.products
  end

  def favorite
    if current_user
      @proposal = Proposal.find(params[:id])
      @like = current_user.toggle_like_proposal(@proposal)

      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render :js => "window.location.pathname='#{new_user_session_path}'" }
      end
    end
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
    @user = User.find_by_id(@proposal.user_id)
  end

  def proposal_params
    params.require(:proposal).permit(:name, :email, :phone, :youtube_url, :self_intro, :title_graph_url, :title, :content, :category_id, user_attributes:[:avatar_url])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
