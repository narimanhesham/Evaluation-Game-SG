class AddColumnNumberToUnit < ActiveRecord::Migration
  def change
    add_column :units, :number, :integer
  end
end
