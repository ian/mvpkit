class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
