class ShoesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @shoes = policy_scope(Shoe).order(created_at: :desc)
  end

  def show
    @shoe = Shoe.find(params[:id])
    authorize @shoe
    @rental = Rental.new
  end

end
