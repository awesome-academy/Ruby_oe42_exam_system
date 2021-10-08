ActiveRecord::Schema.define(version: 2021_10_08_080647) do

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "subjects_id", null: false
    t.index ["subjects_id"], name: "index_exams_on_subjects_id"
    t.index ["users_id"], name: "index_exams_on_users_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "answer"
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_questions_on_users_id"
  end

  create_table "questions_exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "exams_id", null: false
    t.bigint "questions_id", null: false
    t.float "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exams_id"], name: "index_questions_exams_on_exams_id"
    t.index ["questions_id"], name: "index_questions_exams_on_questions_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_subjects_on_users_id"
  end

  create_table "tests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "exams_id", null: false
    t.datetime "time_test"
    t.float "total_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exams_id"], name: "index_tests_on_exams_id"
    t.index ["users_id"], name: "index_tests_on_users_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "exams", "subjects", column: "subjects_id"
  add_foreign_key "exams", "users", column: "users_id"
  add_foreign_key "questions", "users", column: "users_id"
  add_foreign_key "questions_exams", "exams", column: "exams_id"
  add_foreign_key "questions_exams", "questions", column: "questions_id"
  add_foreign_key "subjects", "users", column: "users_id"
  add_foreign_key "tests", "exams", column: "exams_id"
  add_foreign_key "tests", "users", column: "users_id"
end