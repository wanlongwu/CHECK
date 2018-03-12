class CorrectColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :exercises, :catergory, :category
  end
end
