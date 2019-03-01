# Given(/^I access login page$/) do
#   visit "http://10.202.21.64:8000/#/"
#   sleep 2
#   save_screenshot
#   fill_in 'username', with: 'admin'
#   fill_in 'username', with: 'admin'
#   click_button 'Login'
# end

When(/^I post a simple template$/) do
  @template = {
    label: "My template",
    attrs: [
      {
        label: "temperature",
        type: "dynamic",
        value_type: "float",
      },
    ],
  }

  @response = post_data :template, @template
end

When(/^I post a template with one metadata$/) do
  @template = {
    label: "My template",
    attrs: [
      {
        label: "temperature",
        type: "dynamic",
        value_type: "float",
        metadata: [
          { 
            type: "mapping",
            label: "type2",
            static_value: "dummy",
            value_type: "string"
          }
        ]
      }
    ]
  }

  @response = post_data :template, @template
end

When(/^I post a template with multiple metadata$/) do
  @template = {
    label: "New template",
    attrs: [
      {
        label: "temperature",
        type: "dynamic",
        value_type: "float",
        metadata: [
          { 
            type: "mapping",
            label: "type2",
            static_value: "dummy",
            value_type: "string"
          },
          { 
            type: "mapping",
            label: "type3",
            static_value: "dummy",
            value_type: "string"
          }
        ]
      }
    ]
  }

  @response = post_data :template, @template
end

When(/^I post a template with multiple attributes$/) do
  @template = {
    label: "My template",
    attrs: [
      {
        label: "temperature",
        type: "dynamic",
        value_type: "float",
      },
      {
        label: "weight",
        type: "dynamic",
        value_type: "float",
      },
    ],
  }

  @response = post_data :template, @template
end

When(/^I post a template with an empty array of attributes$/) do
  @template = {
    label: "My template",
    attrs: [],
  }

  @response = post_data :template, @template
end

Then(/^I should get a template created$/) do
  @response_body = parse_json @response.body
  assert same_json?(@template, @response_body[:template])
end

And(/^the status code should be (\d+)$/) do |code|
  assert_equal code, @response.code
end
