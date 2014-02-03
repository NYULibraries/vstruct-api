class CreateVclips < ActiveRecord::Migration
  def change
    create_table :vclips, id: :uuid do |t|
      t.uuid :vstruct_id
      t.time :time_in
      t.time :time_out
      t.string :label
      t.string :type
      t.integer :clip_order
      t.integer :lock_version

      t.timestamps
    end
  end
end
