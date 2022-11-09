class Users::LensesController < ApplicationController
  before_action :authenticate_user!

  def index
    lenses = Lense.all

    render json: lenses.to_json(include: :prices)
  end
end
