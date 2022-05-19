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
end
