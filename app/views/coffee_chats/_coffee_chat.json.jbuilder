json.extract! coffee_chat, :id, :consultant_id, :time, :followup_email,
              :goal_of_the_chat, :location, :created_at, :updated_at
json.url coffee_chat_url(coffee_chat, format: :json)
