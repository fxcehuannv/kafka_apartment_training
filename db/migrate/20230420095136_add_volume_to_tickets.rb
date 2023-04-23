class AddVolumeToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :volumn, :float
  end
end
