class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.belongs_to :author
      t.string :title

      t.timestamps null: false
    end
  end
end
