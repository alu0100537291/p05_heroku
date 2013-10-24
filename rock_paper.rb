require './lib/rock_paper'


builder = Rack:: Builder.new do
        use Rack::Static, :urls => ['/public']
        use Rack::ShowExceptions
        use Rack::Lint
        use Rack::Session::Cookie,
                {:key => 'rack.session',
                :domain => 'rps.com',
                :secret => 'cookie'}

        run RockPaperScissors::App.new
end

use Rack::Server.start(
        :app => builder,
        :Port => 8080,
        :server => 'thin',
        :host => 'www.rps.com'
        )