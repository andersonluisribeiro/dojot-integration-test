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

Then(/^I should get a template created$/) do
  @response_body = parse_json @response.body
  assert same_json?(@template, @response_body[:template])
end

And(/^the status code should be (\d+)$/) do |code|
  assert_equal code, @response.code
end
