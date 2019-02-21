class ChangePaytypeToEnum < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
        ALTER TABLE orders MODIFY pay_type enum('Check', 'Credit card', 'Purchase order');
    SQL
  end

  def down
    change_colum :orders, :pay_type, :integer
  end
end
