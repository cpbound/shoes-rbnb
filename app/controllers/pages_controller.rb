class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @shoe = policy_scope(Shoe)
  end
end
