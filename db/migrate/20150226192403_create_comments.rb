class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :author, class_name: "User"
    	t.text			 :content
    	t.string		 :commentable_type
    	t.integer		 :commentable_id

      t.timestamps null: false
    end
  end
end
