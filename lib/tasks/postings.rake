
namespace :postings do
    desc "List all posting title"
    task titles: :environment do
      Rails.logger.info "Rake postings:titles starting..."
      Posting.all.each do |posting|
        puts posting.titles
      
      end     
    end

    task body: :environment do
      Rails.logger.info "Rake postings:body starting..."
      Posting.all.each do |posting|
        puts posting.body
      
      end     
    end
  end

  # https://github.com/jnunemaker/httparty
  # https://www.rubydoc.info/github/jnunemaker/httparty
  # https://stackoverflow.com/questions/tagged/httparty

  require "httparty"
  namespace :api do
    task :postings do
      puts "Rake api:postings starting..."
      response = HTTParty.get("http://localhost:3000/api/postings",
        headers: {
          Authorization: "Bearer abc123",
          "Content-Type" => "application/json"
        }
      )
     # p response
     #puts response.body, response.code, response.message, response.headers.inspect

 
    end
  end


