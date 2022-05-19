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

  def new
    @shoe = Shoe.new
    authorize @shoe
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.user = current_user
    authorize @shoe
    @shoe.save
    redirect_to shoes_path
  end

  private
  def shoe_params
    params.require(:shoe).permit(:name, :color, :price, :size, :category, :photo)
  end
end
