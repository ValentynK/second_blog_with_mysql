class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :articles, :titel, :title
  end
end
