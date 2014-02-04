class ChangeVclipTimes < ActiveRecord::Migration
  def change
    change_column :vclips, :time_in,  :string
    change_column :vclips, :time_out, :string
  end
end
