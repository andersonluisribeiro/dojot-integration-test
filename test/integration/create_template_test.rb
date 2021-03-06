require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "should create a template with only one attr" do
    template = {
      label: "My template",
      attrs: [
        {
          label: "temperature",
          type: "dynamic",
          value_type: "float",
        },
      ],
    }

    response = post_data :template, template
    assert response.code, 200

    response_body = parse_json response.body
    assert same_json?(template, response_body[:template])
  end

  test "should create a template with multiple attrs" do
    template = {
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

    response = post_data :template, template
    assert response.code, 200

    response_body = parse_json response.body
    assert same_json?(template, response_body[:template])
  end
end
