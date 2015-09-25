class AuctionsController < ApplicationController

  def create
    product = Product.find_by_id params[:product_id]
    auction = Auction.new auction_params.merge! product_id: product.id
    if auction.save
      redirect_to product, notice: 'Product was put to auction.'
    else
      redirect_to product, notice: 'Something went wrong!'
    end
  end

  def auction_params
    params.require(:auction).permit(:value, :ends_at)
  end

end
