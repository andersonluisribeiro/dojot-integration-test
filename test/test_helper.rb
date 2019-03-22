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
    begin
      res =  RestClient.post "http://10.202.21.64:8000/#{resource.to_s}", params.to_json, {content_type: :json, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhVFZyaHhGVElZQ3NkMGk2aTlBZzVLQlBZT08yUTN5WiIsImlhdCI6MTU1MzI2MjEyNiwiZXhwIjoxNTUzMjYyNTQ2LCJwcm9maWxlIjoiYWRtaW4iLCJncm91cHMiOlsxXSwidXNlcmlkIjoxLCJqdGkiOiIwYTVhNTYyZmY1N2JlOTM2ZWNhYzcwM2Q4ZTRjOTA3YSIsInNlcnZpY2UiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifQ.FKgXAS6Vw7DwAHtQk-OT88sPTECMy8be5uUBDdnlxnc"}
    rescue RestClient::ExceptionWithResponse => e
      return e.response
    end
    return res
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
