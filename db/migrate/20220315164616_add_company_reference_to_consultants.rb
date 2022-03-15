class AddCompanyReferenceToConsultants < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :consultants, :companies
    add_index :consultants, :company_id
    change_column_null :consultants, :company_id, false
  end
end
