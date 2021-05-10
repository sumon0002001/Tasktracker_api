class ChangeFormatOfMood < ActiveRecord::Migration[6.0]
  def change
    change_column :trackings, :type, :string
  end
end
