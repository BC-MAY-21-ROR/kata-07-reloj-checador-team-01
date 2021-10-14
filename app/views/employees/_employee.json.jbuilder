json.extract! employee, :id, :name, :email, :private_number, :user_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
