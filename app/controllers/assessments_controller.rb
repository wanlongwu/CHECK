class AssessmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create,:show]

  def new
    @assessment = Assessment.new
  end
  def create
    exercise_array = []
    @assessment = Assessment.new(assessment_params)
    @assessment.user = current_or_guest_user
    @assessment.photo = change_img_params(assessment_params[:"photo"])
    @assessment.save!
    if (@assessment.angle1 - 180).abs > 5
      exercise_array += Exercise.where(catergory:"neck")
    end
    if (@assessment.angle2 - 180).abs > 5
      exercise_array += Exercise.where(catergory:"back")
    end
    exercise_array.uniq.each do |e|
      @program = Program.new
      @program.assessment = @assessment
      @program.exercise = e
      @program.save!
    end
    redirect_to assessment_path(@assessment)
  end

  def show
    @neck_result = ""
    @hip_result = ""
    @knee_result = ""
    @assessment = Assessment.find(params[:id])
    @programs = @assessment.programs[0..2]
  end

  private

  def assessment_params
    params.require(:assessment).permit(:angle1,:angle2,:angle3,:photo)
  end

  def change_img_params(img)
    begin
    Base64.decode64(img) #To check if thats a base64 string
      if img
        img = file_decode(img.split(',')[1],"some file name") #getting only the string leaving out the data/<format>
      end
      rescue Exception => e
      img #Returning if its not a base64 string
      end
  end

  def file_decode(base, filename)
    file = Tempfile.new([file_base_name(filename), file_extn_name(filename)])
    file.binmode
    file.write(Base64.decode64(base))
    file.close
    file
  end

  def file_base_name(file_name)
    File.basename(file_name, file_extn_name(file_name))
  end

  def file_extn_name(file_name)
    File.extname(file_name)
  end
end
