# -*- encoding : utf-8 -*-
class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|

      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.string  :authentication_token
      
      t.boolean :active, :default => true
      
      t.string :fname
      t.string :lname
      t.string :street
      t.string :city
      t.integer :zip
      t.integer :phone
      t.string :prac_pomer
      t.text :info
      t.integer :default_hodinovka

      # t.lockable

      t.timestamps
      
        create_table :classrooms_users, :id => false do |t|
        t.integer :classroom_id
        t.integer :user_id
        end
        
        create_table :subjects_users, :id => false do |t|
        t.integer :subject_id
        t.integer :user_id
        t.decimal :uhodinovka, :precision => 8, :scale => 2
        t.decimal :ucelokurzovka, :precision => 8, :scale => 2
        end
        
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true

    add_index :users, :authentication_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :users
  end
end

