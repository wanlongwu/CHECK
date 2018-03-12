class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @user.assessments << session[:assessment]

     guest = User.find(session[:guest_user_id])
     guest_assessments = guest.assessments
      guest_assessments.each do |assessment|
      assessment.user_id = current_user.id
      assessment.save!
    end
  end
end
