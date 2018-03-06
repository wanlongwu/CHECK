class AssessmentsController < ApplicationController

  def new
    @assessment = Assessment.new
  end
  def create
    @assessment = Assessment.new(assessment_params)
    @assessment.user = current_user
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
  end
end
