class CreateConsultants < ActiveRecord::Migration[6.0]
  def change
    create_table :consultants do |t|
      t.integer :company_id
      t.string :name
      t.string :title
      t.string :office
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
