# frozen_string_literal: true

module Employee
  include HTTParty

  base_uri 'http://dummy.restapiexample.com/api/v1'

  format :json
  headers Accept: 'application/vnd.tasmanager.v2',
          'Content-Type': 'application/json'
end
