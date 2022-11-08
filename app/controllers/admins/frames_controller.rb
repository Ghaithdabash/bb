class Admins::FramesController < ApplicationController
  before_action :authenticate_admin!

  def create
    frame = Frame.new(frame_params)

    resp = if frame.save
      render status: 201, body: frame.to_json
    else
      render status: 406, body: frame.errors.full_messages.join(', ')
    end
  end

  private

  def frame_params
    params.require(:frame).permit(:name,
                                  :status,
                                  :stock,
                                  :description,
                                  prices_attributes: [:id, :price, :currency])
  end
end
