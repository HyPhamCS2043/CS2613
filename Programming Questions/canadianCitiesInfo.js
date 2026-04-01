//Author: Hy Pham
//Student number: 3644179

//Add API Key here to access server
const apiKey = '';

const prompt = require('prompt-sync')({sigint: true});
console.log(`Please enter, in one line, "[City], [Canadian Province/Territory]"`);
let input = prompt();

var searchParams = input.split(",");
//console.log(`City: ${searchParams[0]}, Province = ${searchParams[1]}`);
var urlToSearch = `https://wft-geo-db.p.rapidapi.com/v1/geo/countries/CA/regions/${searchParams[1].trim()}/cities`;
//console.log(`URL: ${urlToSearch}`)

//Snippet partially from rapidapi.com 
const axios = require('axios');

const options = {
  method: 'GET',
  url: urlToSearch,
  params: {
    namePrefix: searchParams[0],
    limit: '1'
  },
  headers: {
    'x-rapidapi-key': apiKey,
    'x-rapidapi-host': 'wft-geo-db.p.rapidapi.com',
    'Content-Type': 'application/json'
  }
};

async function fetchData() {
	try {
		const response = await axios.request(options);

        if (response.data.metadata.totalCount === 0) {
            console.log("The city could not be found.");
        }
        else {
            var latitude = response.data.data[0].latitude;
            var longitude = response.data.data[0].longitude;
            var population = response.data.data[0].population;
            var wikiDataId = response.data.data[0].wikiDataId;

            var firstOutput = "";
            if (population > 0) {
                firstOutput = `${searchParams[0]}, ${searchParams[1].trim()} (${latitude}, ${longitude}) has a population of ${population}`;
            }
            else {
                firstOutput = `${searchParams[0]}, ${searchParams[1].trim()} (${latitude}, ${longitude}) does not have population data`;
            }
            console.log(firstOutput);

            //If city is found, prompt user for radius and send request to server
            console.log("Input radius in kilometers:");
            let radiusInput = prompt();

            //Snippet partially from rapidapi.com
            const cityOptions = {
            method: 'GET',
            url: `https://wft-geo-db.p.rapidapi.com/v1/geo/cities/${wikiDataId}/nearbyCities`,
            params: {
                radius: radiusInput,
                distanceUnit: 'KM',
                excludedCountryIds: 'Q30'
            },
            headers: {
                'x-rapidapi-key': apiKey,
                'x-rapidapi-host': 'wft-geo-db.p.rapidapi.com',
                'Content-Type': 'application/json'
            }
            };

            async function fetchCityData() {
                try {
                    const response = await axios.request(cityOptions);
                    
                    var numRetData = response.data.data.length;

                    if (numRetData == 0) {
                        console.log(`There is no cities within ${radiusInput} km of ${searchParams[0]}, ${searchParams[1].trim()}`);
                    }
                    else {
                        console.log(`Some cities close to ${searchParams[0]}, ${searchParams[1].trim()} are:`);
                        for (let i = 0; i < numRetData; i++) {
                            var cityName = response.data.data[i].name;
                            console.log(`\t${cityName}`);
                        }
                    }
                    
                } catch (error) {
                    console.error(error);
                }
            }

            fetchCityData();
        }
        
	} catch (error) {
		console.error(error);
	}

}

fetchData();
