class AddAvailabilityToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :availability, :boolean, default: false, null:false
  end
end
