json.extract! comment, :id, :user_id, :session_id, :comment, :created_at, :updated_at
json.url comment_url(comment, format: :json)
