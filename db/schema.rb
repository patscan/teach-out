# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130525024721) do

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relationship_to_student"
    t.string   "language"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.boolean  "active"
  end

  add_index "contacts", ["phone_number"], :name => "index_contacts_on_phone_number", :unique => true

  create_table "contacts_messages", :force => true do |t|
    t.integer "contact_id"
    t.integer "message_id"
  end

  create_table "contacts_students", :force => true do |t|
    t.integer "contact_id"
    t.integer "student_id"
  end

  create_table "messages", :force => true do |t|
    t.string   "header"
    t.string   "content"
    t.boolean  "delivered"
    t.datetime "time_sent"
    t.integer  "teacher_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "subject"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "teacher_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "students", ["teacher_id"], :name => "index_students_on_teacher_id"

  create_table "teachers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "grade"
    t.integer  "zip"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "school_name"
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true

end
