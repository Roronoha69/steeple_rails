class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|
      t.string :name
      t.string :nickname
      t.string :code
      t.string :logo

      t.timestamps
    end
  end
end
