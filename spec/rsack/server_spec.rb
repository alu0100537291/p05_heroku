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

		it "Jugador: tijeras; Ordenador: piedra -> Debería perder el jugador" do 
			computer_throw = 'rock'
			response = server.get("/?choice='scissors'")
			response.body.include?("LOSE!")
		end

		it "Jugador: tijeras; Ordenador: tijeras -> Deberían empatar" do 
			computer_throw = 'scissors'
			response = server.get("/?choice='scissors'")
			response.body.include?("TIE!")
		end
	end

	# Elección PIEDRA
	context "/?choice='rock'" do

		it "Debería devolver el código 200" do 
			response = server.get("/?choice='rock'")
			response.status.should == 200
		end

		it "Jugador: piedra; Ordenador: papel -> Debería perder el jugador" do 
			computer_throw = 'paper'
			response = server.get("/?choice='scissors'")
			response.body.include?("LOSE!")
		end

		it "Jugador: piedra; Ordenador: piedra -> Deberían empatar" do 
			computer_throw = 'rock'
			response = server.get("/?choice='scissors'")
			response.body.include?("TIE!")
		end

		it "Jugador: piedra; Ordenador: tijeras -> Debería ganar el jugador" do 
			computer_throw = 'scissors'
			response = server.get("/?choice='scissors'")
			response.body.include?("WIN!")
		end
	end

	# Elección PAPEL
	context "/?choice='paper'" do

		it "Debería devolver el código 200" do 
			response = server.get("/?choice='paper'")
			response.status.should == 200
		end

		it "Jugador: papel; Ordenador: papel -> Deberían empatar" do 
			computer_throw = 'paper'
			response = server.get("/?choice='scissors'")
			response.body.include?("TIE!")
		end

		it "Jugador: papel; Ordenador: piedra -> Debería ganar el jugador" do 
			computer_throw = 'rock'
			response = server.get("/?choice='scissors'")
			response.body.include?("WIN!")
		end

		it "Jugador: papel; Ordenador: tijeras -> Debería perder el jugador" do 
			computer_throw = 'scissors'
			response = server.get("/?choice='scissors'")
			response.body.include?("LOSE!")
		end
	end
end