class ReservationsController < ApplicationController
  def create
  	@reservation = current_user.reservations.create(reservation_params)
  	flash[:notice] = "予約が完了しました"
  	redirect_to books_path
  end

  private

  def reservation_params
  	params.require(:reservation).permit(:start_date, :end_date, :book_id)
  end
end
