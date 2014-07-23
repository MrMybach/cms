class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string "title"
			t.string "author"
			t.string "year"
			t.string "category"
			t.string "series_name"
			t.string "pages"
			t.string "language"
			t.boolean "read", :default => false
			t.string "cover"
      t.timestamps
    end
  end
end
