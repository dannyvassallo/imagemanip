class AddDataUriToImages < ActiveRecord::Migration
  def change
    add_column :images, :data_uri, :string
  end
end
