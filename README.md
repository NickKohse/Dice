# Dice

## Summary

This is a simple dice game, similar to the one found in the original Witcher game. Written in Ruby.

## Ranking of the Hands
- 1. Straight - five consecutive values (1,2,3,4,5 or 2,3,4,5,6)
- 2. Five of a kind - all dice show the same value
- 3. Four of a kind
- 4. Full House - three of a kind and a pair in the same hand
- 5. Three of a kind
- 6. Two pairs
- 7. Pair
- 8. Highest single value - The highest value of any of the die
- 9. Highest sum - The sum of the values shown on all die

## Hand Strength Determining Function
The function used to determine which hand is stronger is by far the most complex part of this 
program. It determines a strength value as an integer to represent each of the hands. This 
makes the comparison of two competing hand very simple. Below is an explanation of how the 
strength value is calculated.

### Strength Value Calculation 

```
 Sum of the value of the dice
+(50 * highest value die)
+(500 * value of a paired die)
+(1500 * value of die in second pair)
+(10,000 * value of tripled die)
+(100,000 * value of quadrupled die)
+(1,000,000 * value of quintupled die)
+(10,000,000 for straight)
---------------------------------------
= Strength value
```

### Notes on Strength Value
- The order of the die in each hand is irrelevant i.e. (5,5,6,1,2) is the same hand as (5,6,2,1,5)
- The max theoretical value is 10,000,320 for this hand (2,3,4,5,6) 10M for straight + 300 for high die 6 + 20 for the sum of the die
- The min theoretical value is 316 for this hand (1,2,3,4,6) 300 for high die 6 + 16 for the sum of the die
- The min and max hands are only one die different, both have 2,3,4,6
- The lowest possible value for each rank n is higher than the highest possible value for the rank n-1
- For example, the highest score in rank 8 is 319 for this hand (1,3,4,5,6), the lowest score for rank 7 is 711 for this hand (1,1,2,3,4)
- The strength value is an internal mechanism only, it is not shown to users of the game as it is not relevant 

## Things to add
- Ability to bet
- Different difficulties
- Error checking on input
