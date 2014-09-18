class CreateMonuments < ActiveRecord::Migration
  def change
    create_table :monuments do |t|
      t.string :name
      t.text :description
      t.references :collection

      t.timestamps
    end
  end
end
