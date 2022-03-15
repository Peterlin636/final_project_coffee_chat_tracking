class CreateCoffeeChats < ActiveRecord::Migration[6.0]
  def change
    create_table :coffee_chats do |t|
      t.string :location
      t.integer :consultant_id
      t.string :time
      t.string :followup_email
      t.string :goal_of_the_chat

      t.timestamps
    end
  end
end
