class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.string   "title_ru"
	    t.text     "body_ru"
	    t.string   "preview_ru"
	    t.integer  "site_id"
	    t.string   "title_en"
	    t.text   "body_en"
	    t.string   "preview_en"
	    t.timestamps
    end
  end
end
