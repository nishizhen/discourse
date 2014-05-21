class GoogleOpenidDefaultHasChanged < ActiveRecord::Migration
  def up
    result = Category.exec_sql("SELECT count(*) FROM site_settings WHERE name = 'enable_google_logins'")
    if result[0]['count'].to_i == 0
      # The old default was true, so add a row to keep it that way.
      execute "INSERT INTO site_settings (name, data_type, value, created_at, updated_at) VALUES ('enable_google_logins', 5, 't', now(), now())"
    end
  end

  def down
    # No need to undo.
  end
end