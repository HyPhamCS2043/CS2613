from abc import ABC, abstractmethod

class TradingCard(ABC):

    def __init__(self, id, year, rarity):
          self.ID = id
          self.yearRelease = year
          self.rarity = rarity

    def getID(self):
        return self.ID

    def getYearRelease(self):
        return self.yearRelease

    def getRarity(self):
        return self.rarity

    @abstractmethod
    def cost(self):
        pass

    def set_rarity(self, num):
        if num > 0 and num < 10:
            self.rarity = num
        else:
            pass

    def __str__(self):
        return f"#{self.ID} ({self.yearRelease}): Rarity: {self.rarity}"