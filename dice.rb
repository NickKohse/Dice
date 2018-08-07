
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
		@sort = @hand.sort
	end
	
	#re-rolls dice at the specified indexes
	def reroll(indexes)
		indexes.each do |i|
		puts "RE-rolling #{i}" #THIS IS FOR DEBUGGING ONLY
			@hand[i] = rand(6) + 1
		end
	end
	
	#Determine which dice to re-roll for the computer
	#Function is, only does easy mode
	def determine_reroll
		if (determine_five + determine_four + determine_three + determine_pair.length) == 0
			return [0,1,2,3,4]
		else
			return []
		end
	end
	
	#This function determines and returns the strength value of a hand
	#which is explained in depth in the README
	def determine_strength
		strength = (determine_straight * 100000000)
		strength += (determine_five * 10000000)
		strength += (determine_four * 1000000)
		
		if determine_three != 0 && determine_pair != 0 #full house
			strength += 100000
		end
		
		strength += (determine_three * 10000)
		pairs = determine_pair
		
		if pairs.length == 2
			strength += (pairs[1] * 1500)
		elsif pairs.length >= 1
			strength += (pairs[0] * 500)
		end
		
		strength += (determine_max * 50)
		strength += (determine_sum)
		
		return strength		
		
	end
	
	#Returns the sum of the values of the die in the hand
	def determine_sum
		sum = 0
		@hand.each do |x| # for rank 9
			sum += x
		end
		return sum
	end
	
	#Returns the max value of die in the hand
	def determine_max
		return @sort[4]
	end
	/* dumb
	#Returns 1 if the hand is a straight, 0 otherwise
	def determine_straight
		for i in 0..3 do
			if (@sort[i] + 1) != @sort[i + 1]
				return 0
			end
		end
		return 1
	end
	
	#NOTE - Its probably better to check for two three four and five of a kind in the same function with double loop
	#Returns the value of any die if there is a five of kind in the hand, 0 otherwise
	def determine_five
		for i in 0..3 do
			if @sort[i] != @sort[i + 1]
				return 0
			end
		end
		return sort[i]
	
	end
	
	#Returns the value of a die in a quadruplet, if one exists, 0 otherwise
	def determine_four
		for i in 0..1 do
			if @sort[i] == @sort[i + 1] == @sort[i + 2] == @sort[i + 3]
				return sort[i]
			end
		end
		
		return 0
	end
	
	#Returns the value of a die in a triplet, if one exists, 0 otherwise
	def determine_three
		for i in 0..2 do
			if @sort[i] == @sort[i + 1] == @sort[i + 2]
				return @sort[i]
			end
		end
		
		return 0
	end
	
	#Returns the values the value(s) of die in pairs, in an array, returns empty array otherwise
	def determine_pair
		i = 0
		pairs = Array.new
		while i < 3
			if sort[i] == sort[i + 1]
				pairs.append(sort[i])
				
		end
		
	end
	*/
	def count_hand
		counts = Array.new(7,0) # use a hash
		for i in 0..4 do
			counts[@hand[i]] += 1
		end
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








