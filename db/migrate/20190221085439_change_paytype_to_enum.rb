class ChangePaytypeToEnum < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
        CREATE TYPE enum_type AS ENUM ('Check', 'Credit card', 'Purchase order');
        ALTER TABLE orders ALTER COLUMN pay_type TYPE enum_type USING pay_type::text::enum_type;
    SQL
  end

  def down
    change_colum :orders, :pay_type, :integer
  end
end
