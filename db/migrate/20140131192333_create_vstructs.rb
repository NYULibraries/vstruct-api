class CreateVstructs < ActiveRecord::Migration
  def change
    create_table :vstructs, id: :uuid  do |t|
      t.string :label
      t.string :streaming_fname
      t.text :digitization_notes
      t.string :status

      t.timestamps
    end
  end
end
