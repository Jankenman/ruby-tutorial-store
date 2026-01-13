class CreateActionCableTables < ActiveRecord::Migration[8.0]
  def change
    # Action Cable を PostgreSQL で動かすための標準的なテーブル構成です
    create_table "solid_cable_messages", force: :cascade do |t|
      t.binary "channel", null: false
      t.binary "payload", null: false
      t.datetime "created_at", null: false
      t.integer "channel_hash", limit: 8, null: false
      t.index [ "channel" ], name: "index_solid_cable_messages_on_channel"
      t.index [ "channel_hash" ], name: "index_solid_cable_messages_on_channel_hash"
      t.index [ "created_at" ], name: "index_solid_cable_messages_on_created_at"
    end
  end
end
