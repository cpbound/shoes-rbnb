class ChangeStatusToBeAnEnumInRentals < ActiveRecord::Migration[6.1]
  def up
    change_column :rentals, :status, :integer, using: 'status::integer', default: 0
  end

  def down
    change_column :rentals, :status, :string
  end
end
