class Users::FramesController < ApplicationController
  before_action :authenticate_user!

  def index
    frames = Frame.active.includes(:prices).where("prices.currency = ?", current_user.currency).references(:prices)

    render json: frames.to_json(include: :prices)
  end
end
