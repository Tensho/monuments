class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.binary :data
      t.string :name
      t.text :description
      t.date :date
      t.references :monument

      t.timestamps
    end
  end
end
