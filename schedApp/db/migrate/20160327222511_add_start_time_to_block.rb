class AddStartTimeToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :start_time, :time
  end
end
