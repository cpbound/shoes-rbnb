class ShoesController < ApplicationController
  def index
    @shoes = policy_scope(Shoe).order(created_at: :desc)
  end
end
