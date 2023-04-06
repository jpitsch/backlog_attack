class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name,      null: false, default: ""
      t.string :developer, null: false, default: ""
      t.string :genre
      t.string :platform
      t.string :box_image

      t.integer :story_only
      t.integer :story_plus
      t.integer :full_completion

      t.integer :metacritic_score

      t.integer :steam_app_id
      t.string :playstion_id
      t.string :nintendo_id
      t.string :xbox_id

      t.timestamps
    end
  end
end
