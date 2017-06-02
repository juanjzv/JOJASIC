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

ActiveRecord::Schema.define(version: 20170531193852) do

  create_table "albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 50
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "release"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "albums_genres", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "genre_id"
    t.bigint "album_id"
    t.index ["album_id"], name: "index_albums_genres_on_album_id"
    t.index ["genre_id", "album_id"], name: "index_albums_genres_on_genre_id_and_album_id", unique: true
    t.index ["genre_id"], name: "index_albums_genres_on_genre_id"
  end

  create_table "artist_perform_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "artist_id", null: false
    t.bigint "song_id", null: false
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id", "song_id"], name: "index_artist_perform_songs_on_artist_id_and_song_id", unique: true
    t.index ["artist_id"], name: "index_artist_perform_songs_on_artist_id"
    t.index ["song_id"], name: "index_artist_perform_songs_on_song_id"
  end

  create_table "artists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists_genres", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "genre_id"
    t.bigint "artist_id"
    t.index ["artist_id"], name: "index_artists_genres_on_artist_id"
    t.index ["genre_id", "artist_id"], name: "index_artists_genres_on_genre_id_and_artist_id", unique: true
    t.index ["genre_id"], name: "index_artists_genres_on_genre_id"
  end

  create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "follower_id", null: false
    t.string "following_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_follows_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
    t.index ["following_id"], name: "index_follows_on_following_id"
  end

  create_table "genres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres_songs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "genre_id"
    t.bigint "song_id"
    t.index ["genre_id", "song_id"], name: "index_genres_songs_on_genre_id_and_song_id", unique: true
    t.index ["genre_id"], name: "index_genres_songs_on_genre_id"
    t.index ["song_id"], name: "index_genres_songs_on_song_id"
  end

  create_table "interactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "kind"
    t.string "interactable_type"
    t.bigint "interactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id", limit: 50
    t.index ["interactable_type", "interactable_id"], name: "index_interactions_on_interactable_type_and_interactable_id"
    t.index ["user_id"], name: "index_interactions_on_user_id"
  end

  create_table "playlists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "playlists_songs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "playlist_id"
    t.bigint "song_id"
    t.index ["playlist_id", "song_id"], name: "index_playlists_songs_on_playlist_id_and_song_id", unique: true
    t.index ["playlist_id"], name: "index_playlists_songs_on_playlist_id"
    t.index ["song_id"], name: "index_playlists_songs_on_song_id"
  end

  create_table "song_composes_albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "song_id"
    t.bigint "album_id"
    t.integer "track_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_song_composes_albums_on_album_id"
    t.index ["song_id", "album_id"], name: "index_song_composes_albums_on_song_id_and_album_id", unique: true
    t.index ["song_id"], name: "index_song_composes_albums_on_song_id"
  end

  create_table "songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 50, null: false
    t.integer "lenght", null: false
    t.date "release"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "song_file_file_name"
    t.string "song_file_content_type"
    t.integer "song_file_file_size"
    t.datetime "song_file_updated_at"
  end

  create_table "users", primary_key: "email", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "username", null: false
    t.integer "role", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "albums_genres", "albums"
  add_foreign_key "albums_genres", "genres"
  add_foreign_key "artist_perform_songs", "artists"
  add_foreign_key "artist_perform_songs", "songs"
  add_foreign_key "artists_genres", "artists"
  add_foreign_key "artists_genres", "genres"
  add_foreign_key "follows", "users", column: "follower_id", primary_key: "email"
  add_foreign_key "follows", "users", column: "following_id", primary_key: "email"
  add_foreign_key "genres_songs", "genres"
  add_foreign_key "genres_songs", "songs"
  add_foreign_key "interactions", "users", primary_key: "email"
  add_foreign_key "playlists", "users", primary_key: "email"
  add_foreign_key "playlists_songs", "playlists"
  add_foreign_key "playlists_songs", "songs"
  add_foreign_key "song_composes_albums", "albums"
  add_foreign_key "song_composes_albums", "songs"
end
