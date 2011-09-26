class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :zaciatok
      t.integer :subject_id
      t.integer :classroom_id
      t.integer :user_id
      t.string :status, :default=>"riadna"
      t.text :popis
      t.integer :zastupujuci

      t.timestamps
    end
  end
end
