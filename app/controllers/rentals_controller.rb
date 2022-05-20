class RentalsController < ApplicationController
  def index
    @rentals = policy_scope(Rental).order(created_at: :desc)
    @pending_rentals = @rentals.pending
    @confirmed_rentals = @rentals.confirmed
    @declined_rentals = @rentals.declined
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
      render :index
    end
  end

  def update
    @rental = Rental.find(params[:id])
    authorize @rental
    if @rental.update(rental_params)
      redirect_to owner_rentals_path
    else
      render "owner/rentals/index"
    end
  end

  private
  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :shoe_id, :status)
  end
end
