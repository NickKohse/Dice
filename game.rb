class Game
	def initialize(your, opp)
		@your_hand = your
		@opp_hand = opp
	end 
	
	#Check to see that both players still have money, ends the game with an appropriate message thats no the case
	def check_money
		if @your_hand.get_money <= 0
			puts "You have run out of money, the game is over"
			exit
		elsif @opp_hand.get_money <= 0 
			puts "Your opponent has run otu of money, you win the game"
			exit
		end
	end
	
	#Checks the strengths of each hand, determine the winner, and adjusts the money in each hand 
	def determine_winner
		your_strength = @your_hand.determine_strength
		opp_strength = @opp_hand.determine_strength
		if opp_strength > your_strength
			puts "You lost the round."
			@your_hand.adjust_money(-1)
			@opp_hand.adjust_money(1)
		elsif your_strength > opp_strength
			puts "You won the round."
			@your_hand.adjust_money(1)
			@opp_hand.adjust_money(-1)
		else
			puts "The round ends in a tie."
		end	
	end
	
	#Populates the hands to start the game
	def start
		@your_hand.populate
		@opp_hand.populate
	end
	
	#Sets the bet for each hand
	def bet(x)
		
	end
	
	#Prints the hands and a blank line in between
	def show
		@your_hand.hand_printer
		puts "\n"
		@opp_hand.hand_printer
	end
	
	def roll(your_reroll)
		@your_hand.reroll(your_reroll)
		@opp_hand.reroll(@opp_hand.determine_reroll)
	end
	
	def prepare_bet
		puts "You have $#{@your_hand.get_money}"
		puts "Enter a bet:"
		bet = gets.chomp.to_i #WILL NEED ERROR CHECKING
		@your_hand.set_bet(bet)
		@opp_hand.set_bet(bet)
	end

end	