require_relative 'dice_hand.rb'
require_relative 'game.rb'

#'Main' function
def play(game)
	game.check_money
	game.start
	game.prepare_bet
	puts "The hands will now be rolled.\n\n"
	game.show
	
	puts "Enter the Die #'s of the dice you wish to re-roll, separated by spaces"
	select = gets.chomp #WILL NEED ERROR CHECKING
	select = select.split(" ")

	for i in 0..(select.length - 1) do
		select[i] = select[i].to_i - 1
	end

	game.roll(select)
	puts "The hands have been rerolled\n\n"

	game.show

	game.determine_winner
	
	puts "Would you like to play again (y/n)"
	again = gets.chomp
	if again.upcase == "Y"
		play(game)
	end
end

puts "**********Welcome to Dice**********\n\n"
your_hand = Dice_Hand.new("Your", 20)
opp_hand = Dice_Hand.new("Your opponents", 20)
the_game = Game.new(your_hand, opp_hand)
play(the_game)








