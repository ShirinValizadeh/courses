
json.extract! posting, :id, :title,:description , :created_at, :updated_at
json.url api_posting_url(posting, format: :json)




  