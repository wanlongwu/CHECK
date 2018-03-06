class CreateAssessments < ActiveRecord::Migration[5.1]
  def change
    create_table :assessments do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
