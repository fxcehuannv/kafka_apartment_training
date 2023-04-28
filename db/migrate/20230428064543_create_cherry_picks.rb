class CreateCherryPicks < ActiveRecord::Migration[5.0]
  def change
    create_table :cherry_picks do |t|

      t.timestamps
    end
  end
end
