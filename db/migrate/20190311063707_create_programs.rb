class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :program_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.string :subtitle
      t.string :area
      t.string :service
      t.string :act

      t.timestamps
    end
  end
end
