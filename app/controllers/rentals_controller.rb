class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    @shoe = Shoe.find(params[:shoe_id])
    # @user = User.find(params[:user_id])
  end

  def create
    @rental = Rental.new(rental_params)
    @shoe = Shoe.find(params[:shoe_id])
    @rental.shoe = @shoe
    if @rental.save
      redirect_to shoe_rentals_path(@rental.shoe)
    else
      render :new
    end
  end


  private
  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :shoe_id)

  end
end
