class CreateConversions < ActiveRecord::Migration[5.0]
  def change
    create_table :conversions, id: :uuid do |t|
      t.string :email

      t.timestamps
    end
  end
end
