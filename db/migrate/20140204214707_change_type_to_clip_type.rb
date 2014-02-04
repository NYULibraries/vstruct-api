class ChangeTypeToClipType < ActiveRecord::Migration
  def change
    rename_column :vclips, :type, :clip_type
  end
end
