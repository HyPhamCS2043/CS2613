from TradingCard import TradingCard

class HockeyCard(TradingCard):
    
    def __init__(self, id, year, rarity, playerName, jerseyNum, numGamesWon):
        super().__init__(id, year, rarity)
        self.playerName = playerName
        self.jerseyNum = jerseyNum
        self.numGamesWon = numGamesWon
    

    def playerName(self):
        return self.playerName
    
    def jerseyNum(self):
        return self.jerseyNum
    
    def numGamesWon(self):
        return self.numGamesWon
    
    def cost(self):
        return self.numGamesWon * (2026 - self.yearRelease)/10 * (0.15 + self.rarity/5)
    
    def __str__(self):
        return super().__str__() + f" Cost: ${self.cost()}\n\t{self.playerName} (#{self.jerseyNum}) - {self.numGamesWon} Games Won"