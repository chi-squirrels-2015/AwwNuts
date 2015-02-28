class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count

      t.references :votable, polymorphic: true
      t.references :voter

      t.timestamps null: false
    end
  end
end
