class AssessmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create,:show]

  def new
    @assessment = Assessment.new
  end
  def create
    @assessment = Assessment.new(assessment_params)
    @assessment.user = current_or_guest_user
    @assessment.photo = change_img_params(assessment_params[:"photo"])
    @assessment.save!
    @exercise = Exercise.all.sample
    @program  = Program.new
    @program.assessment = @assessment
    @program.exercise = @exercise
    @program.save!
    redirect_to assessment_path(@assessment)
  end
  def show
    @neck_result = ""
    @hip_result = ""
    @knee_result = ""

    @assessment = Assessment.find(params[:id])
    if (@assessment.angle1 - 180).abs > 5
      @neck_result = "Neck!"
    end
    if (@assessment.angle2 - 180).abs > 5
      @hip_result = "Hip!"
    end
    if (@assessment.angle3 - 180).abs > 5
      @knee_result = "Knee!"
    end
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
