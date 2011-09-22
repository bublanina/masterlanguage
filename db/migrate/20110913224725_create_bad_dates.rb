class CreateBadDates < ActiveRecord::Migration
  def change
    create_table :bad_dates do |t|
      t.date :fujdate
      t.integer :user_id

      t.timestamps
    end
  end
end
