class ProductsController < ApplicationController

  def buy
    @proposal = Proposal.find( params[:proposal_id] )
    @product = @proposal.products.find(params[:id])
  end

end
