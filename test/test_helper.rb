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
    return RestClient.post "http://192.168.67.117:8000/#{resource.to_s}", params.to_json, {content_type: :json, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJGVm1OUjQ5djBmVjd4S0huVWRHNlhFZkNRTVFxMGt3VSIsImlhdCI6MTU1MTI2NzM1OCwiZXhwIjoxNTUxMjY3Nzc4LCJwcm9maWxlIjoiYWRtaW4iLCJncm91cHMiOlsxXSwidXNlcmlkIjoxLCJqdGkiOiIyMGM2MTAyNGEzMDAzYWMwZTRmOGQxZTE1M2Q4OWRhNCIsInNlcnZpY2UiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifQ.ZVXV7LDOzWgwfko7QRNZy4YOikUMFs_hVIkD3_zFKRA"}
  end

  def same_json?(sent, result, root = nil)
    sent.keys.each do |key|
      if sent[key].is_a?(Array)
        sent[key].each_with_index do |item, index|
          same_json? item, result[key][index]
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
