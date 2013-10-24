require "test/unit"
require "rack/test"
require './lib/rock_paper.rb'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.new do
      run RockPaperScissors::App.new
    end.to_app
  end

  def test_index
    get "/"
    assert last_response.ok?
  end

  def test_rock
    get"/?choice='rock'"
    assert last_response.body.include?("WIN!")
  end
end