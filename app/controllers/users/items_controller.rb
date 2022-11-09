class Users::ItemsController < ApplicationController
  before_action :authenticate_user!

  def index

    render json: current_cart.items
  end

  def new
    render json: current_cart.items.new
  end

  def create
    item = current_cart.items.new(item_params)

    if item.save
      render status: 201, body: item.to_json
    else
      render status: 406, body: item.errors.full_messages.join(', ')
    end
  end

  def edit
    render json: current_cart.items.find(params[:id])
  end

  def update
    item = current_cart.items.find(params[:id])
    if item.update(item_params)
      render status: 200, body: item.to_json
    else
      render status: 406, body: item.errors.full_messages.join(', ')
    end
  end

  def place_order
    new_order = Order.place_order(cart: current_cart, user: current_user)

    render json: new_order
  end

  private

  def item_params
    params.require(:item).permit(:parent_product_id, :parent_product_type, :quantity)
  end
end
