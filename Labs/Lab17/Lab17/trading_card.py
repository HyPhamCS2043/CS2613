from abc import ABC, abstractmethod
class TradingCard(ABC):
	def __init__(self, _id, rarity, release):
		self._id = _id
		self.rarity = rarity
		self.release = release
	
	def get_id(self):
		return self._id
	def get_rarity(self):
		return self.rarity
	def get_release(self):
		return self.release
	
	def set_rarity(self, new):
		if (new < 11 and new > 0):
			self.rarity = new
		else:
			pass
	
	def __str__(self):
		return f"#{self._id} {self.release}: Rarity: {self.rarity}"
		
	@abstractmethod
	def cost(self):
		pass


