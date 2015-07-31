class ProposalsController < ApplicationController

  before_action :set_proposal, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show,:favorite]

  def index
    @proposals = Proposal.all
  end

  def create

    @proposal = current_user.proposals.build(proposal_params)
    @proposal.progress = 0
    if @proposal.save
      # TODO: extract to @proposal.setup_default_products or use after_create callback
      @proposal.products.create!( :title => "方案ㄧ", :price => "100", :description => "....", :proposal_id => @proposal.id )
      @proposal.products.create!( :title => "方案二", :price => "500", :description => "真是相當優秀", :proposal_id => @proposal.id)
      @proposal.products.create!( :title => "方案三", :price => "1000", :description => "根本好棒棒", :proposal_id => @proposal.id)

      redirect_to @proposal
    else
      render 'new'
    end

  end

  def show

    @comments = @proposal.comments
    @newcomment = Comment.new

    # TODO: extract to @proposal.percent
    @percent = @proposal.progress.to_f/@proposal.target.to_f*100
    @proposal_orders = @proposal.orders.last(9).reverse
    @proposal_author_url = @proposal.user.check_avatar
    if  @proposal.progress >= @proposal.target
      @percent = 100
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
      redirect_to @proposal
    else
      flash[:notice] = "Update fail"
      render 'edit'
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
    params.require(:proposal).permit(:name, :email, :phone, :youtube_url, :target, :self_intro, :title_graph_url, :title, :content, :category_id, user_attributes:[:avatar_url])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
