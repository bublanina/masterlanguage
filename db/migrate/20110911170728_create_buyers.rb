# -*- encoding : utf-8 -*-
class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.integer :zip
      t.string :email
      t.string :phone
      t.string :ico
      t.string :dic
      t.text :info
      t.text :admin_note

      t.timestamps
    end
  end
end
