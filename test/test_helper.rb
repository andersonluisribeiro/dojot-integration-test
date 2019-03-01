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
    return RestClient.post "http://10.202.21.64:8000/#{resource.to_s}", params.to_json, {content_type: :json, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJJUHRqcE9EdTlveENnV2pwdkFveHNJenZwcE1mRUFMbiIsImlhdCI6MTU1MTQ0MDMzNSwiZXhwIjoxNTUxNDQwNzU1LCJwcm9maWxlIjoiYWRtaW4iLCJncm91cHMiOlsxXSwidXNlcmlkIjoxLCJqdGkiOiI0NGM0OWQ5NmRkYjYzNmY4MTc4MDAzZDJkYTg0OGE3ZiIsInNlcnZpY2UiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifQ.wqbMcl_C1IncwmYhxb8RpnPAKePr9BV_on2NOS8zj8Y"}
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
