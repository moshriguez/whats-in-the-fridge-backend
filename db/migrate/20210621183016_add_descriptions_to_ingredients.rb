class AddDescriptionsToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :description, :string
  end
end
