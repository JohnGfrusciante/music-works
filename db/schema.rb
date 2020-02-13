# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_06_092345) do

  create_table "applications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "matter_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matter_id"], name: "index_applications_on_matter_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "blocks", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "musician_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musician_id"], name: "index_blocks_on_musician_id"
    t.index ["user_id"], name: "index_blocks_on_user_id"
  end

  create_table "chats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "matter_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matter_id"], name: "index_chats_on_matter_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "likes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "matter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matter_id"], name: "index_likes_on_matter_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "matter_categories", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matters", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.integer "reward", null: false
    t.date "deadline", null: false
    t.date "start"
    t.date "end", null: false
    t.text "content", null: false
    t.string "payment"
    t.text "supplement"
    t.integer "status", default: 0, null: false
    t.integer "musician_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musician_id"], name: "index_matters_on_musician_id"
  end

  create_table "messages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.integer "user_id", null: false
    t.integer "chat_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "musicians", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image"
    t.string "name", null: false
    t.text "biography", null: false
    t.text "activity_history", null: false
    t.text "activity_place", null: false
    t.string "email", null: false
    t.text "homepage"
    t.string "sound_source"
    t.text "youtube"
    t.text "spotify"
    t.text "apple_music"
    t.text "twitter"
    t.text "facebook"
    t.string "otherlink_title"
    t.text "otherlink_url"
    t.text "live_info"
    t.string "office"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_musicians_on_user_id"
  end

  create_table "tags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "matter_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matter_category_id"], name: "index_tags_on_matter_category_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "tel", null: false
    t.date "birthday", null: false
    t.integer "status", null: false
    t.integer "prefecture"
    t.text "introduction"
    t.text "performance"
    t.text "portfolio"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "matters"
  add_foreign_key "applications", "users"
  add_foreign_key "blocks", "musicians"
  add_foreign_key "blocks", "users"
  add_foreign_key "chats", "matters"
  add_foreign_key "chats", "users"
  add_foreign_key "likes", "matters"
  add_foreign_key "likes", "users"
  add_foreign_key "matters", "musicians"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "musicians", "users"
  add_foreign_key "tags", "matter_categories"
  add_foreign_key "tags", "users"
end
