# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_12_29_172846) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "User_id"
    t.bigint "Teacher_id"
    t.integer "overallGrade"
    t.boolean "usedTime"
    t.boolean "externalThings"
    t.boolean "goodKnoledge"
    t.boolean "takeAgain"
    t.boolean "attendenceDemand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Teacher_id"], name: "index_evaluations_on_Teacher_id"
    t.index ["User_id"], name: "index_evaluations_on_User_id"
  end

  create_table "student_teacher_subjects", force: :cascade do |t|
    t.bigint "User_id"
    t.bigint "Teacher_id"
    t.bigint "Subject_id"
    t.integer "yearPeriod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Subject_id"], name: "index_student_teacher_subjects_on_Subject_id"
    t.index ["Teacher_id"], name: "index_student_teacher_subjects_on_Teacher_id"
    t.index ["User_id"], name: "index_student_teacher_subjects_on_User_id"
  end

  create_table "subject_teacher_periods", force: :cascade do |t|
    t.bigint "Teacher_id"
    t.bigint "Subject_id"
    t.integer "yearPeriod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Subject_id"], name: "index_subject_teacher_periods_on_Subject_id"
    t.index ["Teacher_id"], name: "index_subject_teacher_periods_on_Teacher_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mandatory"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "overallGrade"
    t.string "email"
    t.string "lattes"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "course"
    t.integer "registration"
    t.integer "cpf"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
