json.extract! student, :id, :name, :surname, :birthday, :created_at, :updated_at
json.url student_url(student, format: :json)