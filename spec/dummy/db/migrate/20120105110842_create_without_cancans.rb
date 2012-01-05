class CreateWithoutCancans < ActiveRecord::Migration
  def change
    create_table :without_cancans do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end
  end
end
