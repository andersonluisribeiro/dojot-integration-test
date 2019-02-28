require "test_helper"

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "should create a empty template" do
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

    response = post_data "template", template
    assert response.code, 200
    assert is_the_same?(template, response.body)
  end
end
