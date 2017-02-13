class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.text :sha
      t.text :message
      t.text :user
      t.datetime :timestamp

      t.timestamps
    end
  end
end
