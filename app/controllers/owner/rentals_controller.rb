class Owner::RentalsController < ApplicationController
  def index
    @rentals = policy_scope([:owner, Rental]).order(created_at: :desc)
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :shoe_id, :user_id, :status)
  end
end
