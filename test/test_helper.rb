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
    return RestClient.post "http://192.168.0.110:8000/#{resource}", params.to_json, {content_type: :json, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJGVm1OUjQ5djBmVjd4S0huVWRHNlhFZkNRTVFxMGt3VSIsImlhdCI6MTU1MTI2NzM1OCwiZXhwIjoxNTUxMjY3Nzc4LCJwcm9maWxlIjoiYWRtaW4iLCJncm91cHMiOlsxXSwidXNlcmlkIjoxLCJqdGkiOiIyMGM2MTAyNGEzMDAzYWMwZTRmOGQxZTE1M2Q4OWRhNCIsInNlcnZpY2UiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifQ.ZVXV7LDOzWgwfko7QRNZy4YOikUMFs_hVIkD3_zFKRA"}
  end

  def is_the_same?(sent, json_result)
    result = JSON.parse(json_result)
    puts "start: #{sent}\n#{json_result}"
    sent.keys.each do |key|
      if sent[key].is_a?(Array)
        sent[key].each_with_index do |item, index|
          puts "for: #{item}\n#{result["template"][key.to_s][index]}"
          is_the_same? item, result["template"][key.to_s][index]
        end
      end
      raise "#{key} is not equal to sent value " unless result["template"][key.to_s].eql? sent[key]
      return false
    end
    return true
  end

  # Add more helper methods to be used by all tests here...
end
