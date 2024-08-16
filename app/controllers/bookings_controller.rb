class BookingsController < ApplicationController
  def index
    @requests = current_user.requests
    @bookings = current_user.bookings
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @user = @offer.user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = Offer.find(params[:offer_id])
    if @booking.save
      redirect_to offer_path(Offer.find(params[:offer_id]))
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
    params.require(:booking).permit(:user_id, :offer_id, :booked_on, :message)
  end
end
