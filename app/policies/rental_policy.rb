class RentalPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.rentals
    end
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
