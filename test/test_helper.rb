ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/autorun"
require "selenium-webdriver"
require "capybara"
require "site_prism"
require "require_all"
require "rest-client"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  def post_data(resource, params)
    return RestClient.post "http://10.202.21.64:8000/#{resource.to_s}", params.to_json, {content_type: :json, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiIzcDZtcWJZTzZZVHlNTEp2V3FkQWtZYlgzdjNnNTVTUyIsImlhdCI6MTU1MTQ2NDkyNiwiZXhwIjoxNTUxNDY1MzQ2LCJwcm9maWxlIjoiYWRtaW4iLCJncm91cHMiOlsxXSwidXNlcmlkIjoxLCJqdGkiOiJlOWU2MGYwZmI1MDRlZmZiM2E2ZThiZTQ4ZWI3Zjg4YiIsInNlcnZpY2UiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifQ.-TR_j-tebNGheqlSs-oqBhVa4v9FAH2KTefiv4CdT2M"}
  end

  def same_json?(sent, result, root = nil)
    sent.keys.each do |key|
      if sent[key].is_a?(Array)
        sent[key].each_with_index do |item, index|
          same_json? item, result[key][index], nil
        end
      else
        return false unless result[key].eql? sent[key]
      end
    end
    return true
  end

  def parse_json(json_result, root = nil)
    return ActiveSupport::JSON.decode(json_result).deep_symbolize_keys[root] if root
    return ActiveSupport::JSON.decode(json_result).deep_symbolize_keys
  end
end
