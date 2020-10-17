class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,              null: false
      t.text       :text,               null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true
      t.integer    :genre_id,           null: false
      t.integer    :item_status_id,     null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :state_id,           null: false
      t.integer    :delivery_days_id,   null: false
      t.timestamps
    end
  end
end
