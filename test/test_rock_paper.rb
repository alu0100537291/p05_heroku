require "test/unit"
require "rack/test"
require './lib/rock_paper.rb'

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Session::Cookie.new(RockPaperScissors::App.new, :secret => 'cookie')
  end

  def choice_computer
    computer_throw = 'paper'
  end

  def test_win
    get"/?choice='scissors'"
    last_response.body.include?("WIN!")
  end

  def test_index
    get "/"
    assert last_response.ok?
  end

  def test_rock
    get"/?choice='rock'"
    last_response.body.include?("WIN!")
  end

  def test_header
    get "/"
    last_response.header == 'Content-Type'
  end

  def test_
    get"/?choice='rock'"
    assert last_response.ok?
  end
end