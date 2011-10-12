# -*- encoding : utf-8 -*-
class CreateBadDates < ActiveRecord::Migration
  def change
    create_table :bad_dates do |t|
      t.integer :den
      t.integer :mesiac
      t.integer :rok
      t.integer :buyer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
