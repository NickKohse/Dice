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
			@hand[i] = rand(6) + 1
		end
	end
	
	#Determine which dice to re-roll for the computer
	#Function is, only does easy mode
	def determine_reroll
		counts = count_hand
		if (find_value(counts, 5).length + find_value(counts, 4).length + find_value(counts, 3).length + find_value(counts, 2).length) == 0
			return [0,1,2,3,4]
		else
			return []
		end
	end
	
	#This function determines and returns the strength value of a hand
	#which is explained in depth in the README
	def determine_strength
		strength = (determine_max * 50)
		strength += (determine_sum)
		counts = count_hand
		
		for i in 1..(counts.length - 1) do
			if counts[i] != 1
				strength -= 100000000
				break
			end
		end
		
		strength += 100000000
		fives = find_value(counts, 5)
		fours = find_value(counts, 4)
		threes = find_value(counts, 3)
		twos = find_value(counts, 2)
		
		if fives.length == 1
			strength += fives[0] * 10000000
		elsif fours.length == 1
			strength += fours[0] * 1000000
		elsif threes.length == 1 && twos.length >= 1
			strength += 100000
		end
		
		if threes.length == 1
			strength += threes[0] * 10000
		end
		
		if twos.length == 2
			twos.sort!
			strength += twos[1] * 1500
			strength += twos[0] * 500
		elsif twos.length == 1
			strength += twos[0] * 500
		end
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

	def count_hand
		counts = Array.new(7,0) 
		for i in 0..4 do
			counts[@hand[i]] += 1
		end
		return counts
	end
	
	#Returns the indexes of the array arr, where v can be found
	def find_value(arr, v)
		indexes = Array.new
		i = 1
		while i < arr.length
			if arr[i] == v
				indexes.push(i)
			end
			i += 1
		end		
		return indexes		
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








