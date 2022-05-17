class Owner::RentalsController < ApplicationController
  def index
    @rentals = policy_scope([:owner, Rental])
  end
end
