class AddReferenceToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :reference, :string
  end
end
