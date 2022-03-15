class AddConsultantReferenceToCoffeeChats < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :coffee_chats, :consultants
    add_index :coffee_chats, :consultant_id
    change_column_null :coffee_chats, :consultant_id, false
  end
end
