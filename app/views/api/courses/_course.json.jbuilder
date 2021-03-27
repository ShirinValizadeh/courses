
json.extract! course, :id,:title, :body, :description ,:published , :image, :created_at, :updated_at
json.url api_course_url(course, format: :json)
