class WelcomeController < ApplicationController
  def index
  end

  def form
    @wishlist = current_user.wishlist
    @id = current_user.id
    @dummyUser = User.new
  end
end
