
json.extract! posting, :id, :title,:description ,:user_id, :created_at, :updated_at
json.url posting_url(posting, format: :json)



json.body do
    json.blocks posting.content[:blocks] do |block|
      json.partial! "api/pages/block", block: block
    end
  end
  