class AddEndTimeToBlock < ActiveRecord::Migration
  def change
    add_column :blocks, :end_time, :time
  end
end
