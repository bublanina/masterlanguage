# -*- encoding : utf-8 -*-
class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :buyer_id
      t.integer :subject_id
      t.string :how_to_pay		#sposob platby
 #     t.integer :pphour		#sadzba vyucbovej hodiny
      t.integer :persons	#pocet osob
      t.decimal :jhodinovka, :precision => 8, :scale => 2
      t.decimal :jcelokurzovka, :precision => 8, :scale => 2
      t.decimal :zaplatil, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
