from trading_card import TradingCard

class Playing_Card(TradingCard):
	def __init__(self, i_id, i_rarity, i_release, i_holo, i_condition):
		super().__init__(i_id, i_rarity, i_release)
		self.holo = i_holo
		if i_condition == "Mint" or i_condition == "Good" or i_condition == "Poor":
			self.condition = i_condition
			
	def ID(self):
		return self.ID
	
	def release(self):
		return self.release
	
	def rarity(self):
		return self.rarity

	def get_holo(self):
		return self.holo
	
	def get_condition(self):
		return self.condition
	
	def set_condition(self, new):
		if new == "Mint" or new == "Good" or new == "Poor":
			self.condition = new
	
	
	def cost(self):
		condition_cost = 0.5
		if self.condition == "Mint":
			condition_cost = 5.15
		elif self.condition == "Good":
			condition_cost = 2.15
	
		holo_mult = 1
		if self.holo == True:
			holo_mult = 5
		
		return (holo_mult * (condition_cost * (self.rarity / 2)))
	
	def __str__(self):
		return f"#{self._id} ({self.release}): Rarity: {self.rarity} Cost: ${self.cost()}\n\tHolographic: {self.holo}\tCondition: {self.condition}"
