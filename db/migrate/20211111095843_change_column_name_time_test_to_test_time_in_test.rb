class ChangeColumnNameTimeTestToTestTimeInTest < ActiveRecord::Migration[6.0]
  def change
    def change
      rename_column :tests, :time_test, :test_time

    end
  end
end
