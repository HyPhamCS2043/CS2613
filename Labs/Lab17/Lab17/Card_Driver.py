# Trading Card (id, rarity, release)
# Hockey Card (jersey number, num games won
# playing card (holo, condition)
from trading_card import TradingCard
from HockeyCard import HockeyCard
from Playing_Card import Playing_Card
PC1 = Playing_Card(6666666, 1, 2024, True, "Good")
PC2 = Playing_Card(4907492, 3, 1994, False, "Good")
PC3 = Playing_Card(3229920, 8, 2003, True, "Mint")
HC1 = HockeyCard(1234567, 3, 2017, "Macklin Cellbrini", 17, 8)
HC2 = HockeyCard(2042005, 7, 2003, "Conner Bedard", 19, 59)
HC3 = HockeyCard(3840182, 10, 1983, "Wayne Gretzky", 99, 213)



# to_strings:
print("To strings:")
print(HC1)
print(HC2)
print(HC3)

print(PC1)
print(PC2)
print(PC3)

# test accessors
print("Accessors:")
print(HC1.get_id())
print(PC2.get_id())
print(PC1.get_condition())
print(PC2.get_holo())

# test rarity mutator
print("Mutators:")
print(HC2.get_rarity())
HC2.set_rarity(11)
print(HC2.get_rarity())
HC2.set_rarity(4)
print(HC2.get_rarity())

# test condition mutator
print(PC2.cost())
PC2.set_condition("Decent")
print(PC2.cost())
PC2.set_condition("Poor")
print(PC2.cost())

cards = [HC1, HC2, HC3, PC1, PC2, PC3]

def total_value(card_list):
	totalPrice = 0
	for x in card_list:
		totalPrice += x.cost()
	return totalPrice


def highest_value(card_list):
	highest = card_list[0]
	for x in card_list:
		if (x.cost() > highest.cost()):
			highest = x
	return highest

print("Driver Functions (Total Value, Highest Card):")
print(total_value(cards))
print(highest_value(cards))
		

		

