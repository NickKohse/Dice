
class Dice_Hand
		
	def initialize
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
		puts "RE-rolling #{i}"
			@hand[i] = rand(6) + 1
		end
	end
	
	#Determine which dice to re-roll for the computer
	#Function is incomplete, returns a placeholder
	def determine_reroll
		return [3]
	end
	

end

#This function takes a dice_hand of five integers representing
#five dice, and prints them in an easily recognizable format
def hand_printer(hand, whose)
	puts whose + " hand is:"
	puts "+---------------------------+"
	puts "| Die # | 1 | 2 | 3 | 4 | 5 |"
	puts "|---------------------------|"
	puts "| Value | #{hand[0]} | #{hand[1]} | #{hand[2]} | #{hand[3]} | #{hand[4]} |"
	puts "+---------------------------+"
end

#This function takes two hand and returns:
#1 if hand1 wins
#2 if hand2 wins
#3 if there is a tie
def hand_compare(hand1, hand2)

end

puts "**********Welcome to Dice**********\n\n"
puts "The hands will now be rolled.\n\n"

your_hand = Dice_Hand.new
your_hand.populate
hand_printer(your_hand.instance_variable_get(:@hand), "Your")

puts "\n"

opp_hand = Dice_Hand.new
opp_hand.populate
hand_printer(opp_hand.instance_variable_get(:@hand), "Your opponents")

puts "Enter the Die #'s of the dice you wish to re-roll, separated by spaces"
select = gets.chomp
select = select.split(" ")

for i in 0..(select.length - 1) do
	select[i] = select[i].to_i - 1
end

your_hand.reroll(select)
opp_hand.reroll(opp_hand.determine_reroll)

puts "The hands have been rerolled\n\n"

hand_printer(your_hand.instance_variable_get(:@hand), "Your")
hand_printer(opp_hand.instance_variable_get(:@hand), "Your opponents")

result = hand_compare(your_hand.instance_variable_get(:@hand), opp_hand.instance_variable_get(:@hand))






