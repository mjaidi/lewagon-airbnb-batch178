class ApptReviewsController < ApplicationController

  def create
    @appt_review = ApptReview.new(appt_review_params)
    @appt_review.booking_id = params[:booking_id]
    
    if @appt_review.save
      redirect_to apartment_path(Apartment.find(params[:apartment_id]))
    else
    redirect_to booking_trips_path(current_user.id)
    end
    authorize @appt_review
  end

  private
  def appt_review_params
    params.require(:appt_review).permit(:rating, :comment)
  end

end
