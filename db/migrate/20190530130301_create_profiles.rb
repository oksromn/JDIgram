class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.text :about
      t.string :image

      t.timestamps
    end
  end
end
