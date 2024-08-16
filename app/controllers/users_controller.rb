class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @offers = Offer.with_attached_photos.where(user: @user)
  end
end
