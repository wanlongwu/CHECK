class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :assessments, :image, :photo
  end
end
