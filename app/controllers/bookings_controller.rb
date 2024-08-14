class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @offer = Offer.find(params[:offer_id])
    # @user = User.find(params[:user_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.find(params[:user_id])
    @booking.offer = Offer.find(params[:offer_id])
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :offer_id, :occurs_on, :message)
  end
end
