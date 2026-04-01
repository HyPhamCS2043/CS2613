//Author: Hy Pham
//Student number: 3644179


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
    'x-rapidapi-key': 'dd8e5c4c15msh69aff2ca5bb366ap17df84jsn94dfa240bd9a',
    'x-rapidapi-host': 'wft-geo-db.p.rapidapi.com',
    'Content-Type': 'application/json'
  }
};

async function fetchData() {
	try {
		const response = await axios.request(options);

        console.log(response.data.data[0]);
	} catch (error) {
		console.error(error);
	}
}

fetchData();
