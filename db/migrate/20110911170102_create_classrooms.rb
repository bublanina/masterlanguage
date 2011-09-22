# -*- encoding : utf-8 -*-
class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :capacity
      t.text :note

      t.timestamps
    end
  end
end
