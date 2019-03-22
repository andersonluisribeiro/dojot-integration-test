When(/^I import a template with one attribute$/) do
    @import = {
        templates: [
            {
                id:1,
                label:"medidor de temperatura",
                attrs: [
                    {
                        id:1,
                        label:"temperatura",
                        template_id:"1",
                        type:"dynamic",
                        value_type:"float"
                    }
                ]
            }
        ],
        devices: [],
        flows: []
    }

    @response = post_data :import, @import
end

When(/^I import two templates with one attribute each one$/) do
    @import = {
        templates: [
            {
                id:1,
                label:"medidor de temperatura",
                attrs: [
                    {
                        id:1,
                        label:"temperatura",
                        template_id:"1",
                        type:"dynamic",
                        value_type:"float"
                    }
                ]
            },
            {
                id:2,
                label:"medidor de pressão",
                attrs: [
                    {
                        id:2,
                        label:"temperatura",
                        template_id:"1",
                        type:"dynamic",
                        value_type:"float"
                    }
                ]
            }
        ],
        devices: [],
        flows: []
    }

    @response = post_data :import, @import
end

When(/^I import two templates with two attributes each one$/) do
    @import = {
        templates: [
            {
                id:1,
                label:"medidor de temperatura",
                attrs: [
                    {
                        id:1,
                        label:"temperatura",
                        template_id:"1",
                        type:"dynamic",
                        value_type:"float"
                    },
                    {
                        id:2,
                        label:"pressure",
                        template_id:"1",
                        type:"dynamic",
                        value_type:"float"
                    }
                ]
            },
            {
                id:2,
                label:"medidor de pressão",
                attrs: [
                    {
                        id:3,
                        label:"temperatura",
                        template_id:"2",
                        type:"dynamic",
                        value_type:"float"
                    },
                    {
                        id:4,
                        label:"pressure",
                        template_id:"2",
                        type:"dynamic",
                        value_type:"float"
                    }
                ]
            }
        ],
        devices: [],
        flows: []
    }

    @response = post_data :import, @import
end

Then(/^I should get imported template$/) do
    @response_body = parse_json @response.body
    assert same_json?(@import, @response_body)
end
