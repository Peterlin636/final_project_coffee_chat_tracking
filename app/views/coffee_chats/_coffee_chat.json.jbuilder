json.extract! coffee_chat, :id, :location, :consultant_id, :time,
              :followup_email, :goal_of_the_chat, :created_at, :updated_at
json.url coffee_chat_url(coffee_chat, format: :json)
