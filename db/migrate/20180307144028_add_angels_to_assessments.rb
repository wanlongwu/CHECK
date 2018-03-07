class AddAngelsToAssessments < ActiveRecord::Migration[5.1]
  def change
    add_column :assessments, :angle1, :float;
    add_column :assessments, :angle2, :float;
    add_column :assessments, :angle3, :float;
    add_column :assessments, :image, :text;
  end
end
