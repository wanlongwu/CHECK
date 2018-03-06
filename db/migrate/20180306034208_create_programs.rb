class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.references :assessment, foreign_key: true
      t.references :exercise, foreign_key: true

      t.timestamps
    end
  end
end
