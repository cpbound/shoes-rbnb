class ShoesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    if params[:query].present?
      sql_query = "color ILIKE :query OR category ILIKE :query OR size ILIKE :query"
      @shoes = policy_scope(Shoe).search_by_color_and_category_and_size(params[:query])
    else
      @shoes = policy_scope(Shoe).order(created_at: :desc)
    end
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
