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
    # puts params.to_json
    begin
      res =  RestClient.post "http://10.202.21.64:8000/#{resource.to_s}", params.to_json, {content_type: :json, Authorization: "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ0NjJ0eDJIVTdjRUEzTzFFVEhVMTcwbHdyVVo4cEFSeSIsImlhdCI6MTU1MTk2NDExMCwiZXhwIjoxNTUxOTY0NTMwLCJwcm9maWxlIjoiYWRtaW4iLCJncm91cHMiOlsxXSwidXNlcmlkIjoxLCJqdGkiOiIxMDZkOTAzZmI4ZmEwNTYwYjc0ZmYzY2QxYTA5N2I0NyIsInNlcnZpY2UiOiJhZG1pbiIsInVzZXJuYW1lIjoiYWRtaW4ifQ.AdQXWeM-J7kl4GlNdK7nG1Plm4NbJ51Wkbx5_IwElXE"}
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
