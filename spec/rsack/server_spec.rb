require './spec/spec_helper'

describe Rsack::Server do 
	def server
		Rack::MockRequest.new(Rsack::Server.new)
	end

	# Página inicial
	context '/' do 

		it "Debería devolver el codigo 200" do 
			response = server.get('/')
			response.status.should == 200
		end

		it "Debería mostrar RPS GAME como título de la página" do 
			response = server.get('/')
			response.header == 'RPS GAME'
		end
	end

	# Elección TIJERAS
	context "/?choice='scissors'" do

		it "Debería devolver el código 200" do 
			response = server.get("/?choice='scissors'")
			response.status.should == 200
		end

		it "Jugador: tijeras; Ordenador: papel -> Debería ganar el jugador" do 
			computer_throw = 'paper'
			response = server.get("/?choice='scissors'")
			response.body.include?("WIN!")
		end

		it "Debería Perder" do 
			computer_throw = 'rock'
			response = server.get("/?choice='scissors'")
			response.body.include?("OUCH! PLAYER 2 WIN =(")
		end

		it "Debería Empatar" do 
			computer_throw = 'scissors'
			response = server.get("/?choice='scissors'")
			response.body.include?("TIE")
		end
	end

	# Elección PIEDRA
	context "/?choice='rock'" do

		it "Debería devolver el código 200" do 
			response = server.get("/?choice='rock'")
			response.status.should == 200
		end

		it "Debería ganar" do 
			computer_throw = 'scissors'
			response = server.get("/?choice='rock'")
			response.body.include?("PLAYER 1 WIN =)!")
		end

		it "Debería Perder" do 
			computer_throw = 'paper'
			response = server.get("/?choice='rock'")
			response.body.include?("OUCH! PLAYER 2 WIN =(")
		end

		it "Debería Empatar" do 
			computer_throw = 'rock'
			response = server.get("/?choice='rock'")
			response.body.include?("TIE")
		end
	end

	# Elección PAPEL
	context "/?choice='paper'" do

		it "Debería devolver el código 200" do 
			response = server.get("/?choice='paper'")
			response.status.should == 200
		end
	end
end