class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :firstname
      t.string :secondname
      t.date :birthday
      t.text :about

      t.belongs_to :user, index: { unique: true }, foreign_key: true

      t.timestamps
    end
  end
end
