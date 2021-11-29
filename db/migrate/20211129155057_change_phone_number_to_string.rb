class ChangePhoneNumberToString < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :phone_number, :string
  end
end
