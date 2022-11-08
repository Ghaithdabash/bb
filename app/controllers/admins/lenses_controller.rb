class Admins::LensesController < ApplicationController
  before_action :authenticate_admin!

  def create
    lense = Lense.new(lense_params)

    resp = if lense.save
      render status: 201, body: lense.to_json
    else
      render status: 406, body: lense.errors.full_messages.join(', ')
    end
  end

  private

  def lense_params
    params.require(:lense).permit(:color,
                                  :prescription_type,
                                  :lens_type,
                                  :stock,
                                  :description,
                                  prices_attributes: [:id, :price, :currency])
  end
end
