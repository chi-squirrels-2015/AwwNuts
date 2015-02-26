class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email, unique: true
      t.string :avatar_url, default: "http://movingkidsforward.org/wp-content/uploads/2013/05/profile_default800x600.jpg"
      t.string :catch_phrase

      t.timestamps
    end
  end
end
