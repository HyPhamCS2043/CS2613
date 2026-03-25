//TODO: Create a City class. It should take the name and the population as instance vars.
	//It should have an equals method that takes another city as a parameter
	//and returns true if this city's name and population match the other city's name and population

class City {
	constructor(name, population) {
		this.name = name;
		this.population = population;
	}

	equals(city) {
		let isEqual = false;
		if (this.name === city.name  && this.population == city.population) {
			isEqual = true;
		}
		return isEqual;
	}
}

class CityMap{
	//TODO: The programmer made a mistake in the constructor 
	//Fix: instead of adjacencyList = [], it's this.adjacencyList = []
	constructor(){
		this.adjacencyList = [];
	}

	addConnection(startCity, endCity, dist){
		//Adding first connection
		if(this.adjacencyList.length == 0){
			this.adjacencyList[0] = [startCity, [endCity], [dist]];
			this.adjacencyList[1] = [endCity, [startCity], [dist]];
		}
		else{
			//Check to see if startCity is in list
			let startCityFound = -1;
			for(let i = 0; i < this.adjacencyList.length; i++){
				if(this.adjacencyList[i][0].equals(startCity)){
					startCityFound = i;
					break;
				}
			}
			//startCity already registered in list
			if(startCityFound >= 0){
				this.adjacencyList[startCityFound][1][this.adjacencyList[startCityFound][1].length] = endCity;
				this.adjacencyList[startCityFound][2][this.adjacencyList[startCityFound][2].length] = dist;
			}
			//startCity is not registered
			else{
				this.adjacencyList[this.adjacencyList.length] = [startCity, [endCity], [dist]];
			}


			//TODO: Check to see if endCity is already in the adjacency list
				//If it is, add a connection to the startCity
				//If it is not, add it to the adjacency list then add its connection to startCity (could be one step)
				//Review the steps above to see how it is done with startCity instead of endCity
			let endCityFound = -1;
			for(let i = 0; i < this.adjacencyList.length; i++) {
				if(this.adjacencyList[i][0].equals(endCity)) {
					endCityFound = i;
					break;
				}
			}

			//endCity is already in the list
			if (endCityFound >= 0) {
				this.adjacencyList[endCityFound][1][this.adjacencyList[endCityFound][1].length] = startCity;
				this.adjacencyList[endCityFound][2][this.adjacencyList[endCityFound][2].length] = dist;
			}
			//endCity is not in the list
			else {
				this.adjacencyList[this.adjacencyList.length] = [endCity, [startCity], [dist]];
			}
		}
	}

	//TODO: Create a printMap() function that takes no parameters and prints the 
		//entire map. It should match the styling from the lab document.
	printMap() {
		for(let i = 0; i < this.adjacencyList.length; i++) {
			console.log(this.adjacencyList[i][0].name);
			for(let k = 0; k < this.adjacencyList[i][1].length; k++) {
				console.log(`\t ${this.adjacencyList[i][1][k].name} (${this.adjacencyList[i][2][k]}km)`);
			}
		}
	}
}

//Main code goes here...

//TODO: Create the four cities listed on the lab document
let bathurst = new City("Bathurst", 10000);
let campbellton = new City("Campbellton", 12000);
let edmundston = new City("Edmunston", 14000);
let miramichi = new City("Miramichi", 15000);

//TODO: Create a map and add connections between Bathurst-Miramichi, Bathurst-Edmundston
	//Bathurst-Campbellton, and Edmundston-Campbellton
let connectionMap = new CityMap();
connectionMap.addConnection(bathurst, miramichi, 75.9);
connectionMap.addConnection(bathurst, edmundston, 248);
connectionMap.addConnection(edmundston, campbellton, 200);
connectionMap.addConnection(bathurst, campbellton, 108);


//TODO: Print the map using your the function you created
connectionMap.printMap();


