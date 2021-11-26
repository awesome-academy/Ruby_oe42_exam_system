class AddActualTestTimeToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :actual_test_time, :datetime
  end
end
