class Createcities < ActiveRecord::Migration[7.0]
 def change
    create_table :cities do |t|
      t.string :name
      t.string :zip_code

      t.timestamps
    end
  end
end