class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :contract_num
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
