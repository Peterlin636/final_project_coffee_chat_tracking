json.extract! consultant, :id, :company_id, :name, :title, :office, :email,
              :phone_number, :created_at, :updated_at
json.url consultant_url(consultant, format: :json)
