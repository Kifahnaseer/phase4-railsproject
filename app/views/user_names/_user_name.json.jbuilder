json.extract! user_name, :id, :email, :login, :created_at, :updated_at
json.url user_name_url(user_name, format: :json)
