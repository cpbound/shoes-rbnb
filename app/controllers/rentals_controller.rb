class RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental)
  end

  def create
    @rental = Rental.new(rental_params)
    @shoe = Shoe.find(params[:shoe_id])
    @rental.user = current_user
    @rental.shoe = @shoe
    authorize @rental
    if @rental.save
      redirect_to rentals_path
    else
      raise
      render :new
    end
  end


  private
  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :shoe_id)

  end
end
