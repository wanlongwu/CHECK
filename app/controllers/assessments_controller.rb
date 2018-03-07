class AssessmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create,:show]

  def new
    @assessment = Assessment.new
  end
  def create
    @assessment = Assessment.new
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
end
