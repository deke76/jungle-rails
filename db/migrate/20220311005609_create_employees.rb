class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
        t.string   "name"
        t.string   "image"
        t.string   "actor"
        t.string   "position"
        t.string   "job_description"
        t.string   "email"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
    end
  end
end
