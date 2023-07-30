class AddExtAuthTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ext_auth_token, :string
  end
end
