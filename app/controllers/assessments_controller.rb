class AssessmentsController < ApplicationController



  skip_before_action :authenticate_user!, only: [:new, :create,:show]


  def new
    @assessment = Assessment.new
    respond_to do |format|
      format.html
      format.json
    end
  end
  def create

    @assessment = Assessment.new(assessment_params)
    @assessment.user = current_or_guest_user

    @assessment.save!
    @exercise = Exercise.all.sample
    @program  = Program.new
    @program.assessment = @assessment
    @program.exercise = @exercise
    @program.save!
    redirect_to assessment_path(@assessment)
  end
  def show
    @assessment = Assessment.find(params[:id])
  end

  private

  def assessment_params
    params.require(:assessment).permit(:angle1,:angle2,:angle3,:image)
  end
end
