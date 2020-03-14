class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|

      t.timestamps
      t.string :image
      t.references :user, foregin_key: true
    end
  end
end
