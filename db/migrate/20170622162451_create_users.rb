class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :auth0_uid
      t.string :email
      t.string :name
      t.datetime :last_auth_at

      t.timestamps
    end
  end
end
