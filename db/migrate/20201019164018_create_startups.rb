class CreateStartups < ActiveRecord::Migration[6.0]
  def change
    create_table :startups do |t|
      t.string :name
      t.text :resume
      t.text :descrption
      t.integer :trade_registre
      t.text :banner
      t.text :logo
      t.string :address

      t.timestamps
    end
  end
end
