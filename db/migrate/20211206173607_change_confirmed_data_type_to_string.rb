class ChangeConfirmedDataTypeToString < ActiveRecord::Migration[6.1]
  def change
    change_column :invitations, :confirmed, :string, default: 'false'
  end
end
