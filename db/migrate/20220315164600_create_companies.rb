class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :industry
      t.string :website

      t.timestamps
    end
  end
end
