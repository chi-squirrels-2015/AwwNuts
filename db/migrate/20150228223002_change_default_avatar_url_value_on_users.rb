class ChangeDefaultAvatarUrlValueOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :avatar_url, :string, null: false, default: "https://robohash.org/o24ruwlekfj239487wejfn23498ty3ejfbn3oity483fgjn"
  end
end
