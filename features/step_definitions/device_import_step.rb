When(/^I import a device with one attribute$/) do
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
        devices: [ 
            {
                id:"1",
                label:"barometro",
                templates: [1],
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
        flows: []    
    }
  
    @response = post_data :import, @import
end

When(/^I import a device with an empty array of attributes$/) do
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
        devices: [ 
            {
                id:"1",
                label:"barometro",
                templates: [1],
                attrs: []    
            }
        ],
        flows: []    
    }
  
    @response = post_data :import, @import
end

When(/^I import a device with a null array of attributes$/) do
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
        devices: [ 
            {
                id:"1",
                label:"barometro",
                templates: [1],
                attrs: nil    
            }
        ],
        flows: []    
    }
  
    @response = post_data :import, @import
end

When(/^I import a device without a array of attributes$/) do
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
        devices: [ 
            {
                id:"1",
                label:"barometro",
                templates: [1]
            }
        ],
        flows: []    
    }
  
    @response = post_data :import, @import
end

When(/^I import a device without import a template$/) do
    @import = {
        devices: [ 
            {
                id:"1",
                label:"barometro",
                templates: [1],
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
        flows: []    
    }
  
    @response = post_data :import, @import
end

Then(/^the imported device$/) do
    @response_body = parse_json @response.body
    assert same_json?(@import, @response_body)
end

And(/^I should get the status code (\d+)$/) do |code|
    assert_equal code, @response.code
  end