class SetDefaultsAddIndices < ActiveRecord::Migration
  def change
    change_table :vstructs do |t|
      t.column         :lock_version, :integer, default: 0, null: false
    end
    change_table :vclips do |t|
      t.change :lock_version, :integer, default: 0, null: false
      t.index  :vstruct_id
    end
  end
end
