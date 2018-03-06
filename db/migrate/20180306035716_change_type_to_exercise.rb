class ChangeTypeToExercise < ActiveRecord::Migration[5.1]
  def change
    rename_column(:exercises, :type, :catergory)
  end
end
