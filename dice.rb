
class Dice_Hand
		
	def initialize(name)
		@name = name
		@hand = Array.new(5)
	end
	
	#initializes the hand to random values
	def populate
		for i in 0..4 do
			@hand[i] = rand(6) + 1
		end
	end
	
	#re-rolls dice at the specified indexes
	def reroll(indexes)
		indexes.each do |i|
		puts "RE-rolling #{i}" #THIS IS FOR DEBUGGING ONLY
			@hand[i] = rand(6) + 1
		end
	end
	
	#Determine which dice to re-roll for the computer
	#Function is incomplete, returns a placeholder
	def determine_reroll
		return [3]
	end
	
	#This function determines and returns the strength value of a hand
	#which is explained in depth in the README
	def determine_strength
		strength = 0
		@hand.sort!
		@hand.each do |x| # for rank 9
			strength += x
		end
		strength += (@hand[4] * 50) # for rank 8
		
	end
	
	#This function print the contents of the hand
	#in an easily readable format
	def hand_printer
		puts @name + " hand is:"
		puts "+---------------------------+"
		puts "| Die # | 1 | 2 | 3 | 4 | 5 |"
		puts "|---------------------------|"
		puts "| Value | #{@hand[0]} | #{@hand[1]} | #{@hand[2]} | #{@hand[3]} | #{@hand[4]} |"
		puts "+---------------------------+"
	end
	

end




#'Main' function
def play
	puts "The hands will now be rolled.\n\n"

	your_hand = Dice_Hand.new("Your")
	your_hand.populate
	your_hand.hand_printer

	puts "\n"

	opp_hand = Dice_Hand.new("Your opponents")
	opp_hand.populate
	opp_hand.hand_printer

	puts "Enter the Die #'s of the dice you wish to re-roll, separated by spaces"
	select = gets.chomp
	select = select.split(" ")

	for i in 0..(select.length - 1) do
		select[i] = select[i].to_i - 1
	end

	your_hand.reroll(select)
	opp_hand.reroll(opp_hand.determine_reroll)

	puts "The hands have been rerolled\n\n"

	your_hand.hand_printer
	opp_hand.hand_printer

	your_strength = your_hand.determine_strength
	opp_strength = opp_hand.determine_strength
	
	if opp_strength > your_strength
		puts "You lost the round."
	elsif your_strength > opp_strength
		puts "You won the round."
	else
		puts "The round ends in a tie."
	end	
	
	puts "Would you like to play again (y/n)"
	again = gets.chomp
	if again.upcase == "Y"
		play
	end
end

puts "**********Welcome to Dice**********\n\n"
play








