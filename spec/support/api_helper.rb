module ApiHelper
  include Rack::Test::Methods

  # https://github.com/brynary/rack-test/blob/master/lib/rack/mock_session.rb
  # https://github.com/brynary/rack-test/blob/280ff54f50d25dd70e2ec1c55049e5ef7de126f3/lib/rack/test.rb
  Rack::Test::DEFAULT_HOST = 'www.example.com'

  def app
    Rails.application
  end
end
