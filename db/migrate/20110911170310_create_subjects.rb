# -*- encoding : utf-8 -*-
class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :typ  #typ kurzu / firemny, one-to-one, public
      t.text :info		#popis kurzu
      t.integer :capacity
      t.integer :mins_per_hour	#dlzka hodiny
      t.integer :how_many_hours
      t.text :admin_note
      t.integer :user_id
      t.boolean :confirmed
      
      t.timestamps
    end
  end
end
