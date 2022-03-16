class AddLowerCaseEmail < ActiveRecord::Migration
  def change
    add_column :users, :email_lower, :string
  end
end
