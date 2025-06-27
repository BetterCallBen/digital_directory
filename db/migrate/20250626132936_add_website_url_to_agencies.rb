class AddWebsiteUrlToAgencies < ActiveRecord::Migration[7.1]
  def change
    add_column :agencies, :website_url, :string, limit: 500
  end
end
