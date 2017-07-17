class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.status = "submitted"
    @cart.subtract
    @cart.save
    @user = @cart.user
    @user.current_cart = nil
    @user.save
    redirect_to @cart
  end

end
