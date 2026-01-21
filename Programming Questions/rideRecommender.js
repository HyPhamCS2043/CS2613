//Author: Hy Pham
//3644179

function parkRideRequirements (age, height, weight, mood, view) {
    this.age = age;
    this.height = height;
    this.weight = weight;
    this.mood = mood;
    this.view = view;
}

//const ferrisWheel = parkRideRequirements(10, 152.4, 0, "calm", true);
//const rollerCoaster = parkRideRequirements(10, 152.4, 0, "exciting", true);
//const bumperCars = parkRideRequirements(14, 152.4, 36.29, "exciting", null);
//const merryGoRound = parkRideRequirements(4, 0, 0, "calm", null); //recommended for under 12 too
//const tiltAWhirl = parkRideRequirements(4, 152.4, 36.29, "exciting", null);


const ferrisWheel = [10, 152.4, 0, "Calm", true];
const rollerCoaster = [10, 152.4, 0, "Exciting", true];
const bumperCars = [14, 152.4, 36.29, "Exciting", false];
const merryGoRound = [4, 0, 0, "Calm", false]; //recommended for under 12 too
const tiltAWhirl = [4, 152.4, 36.29, "Exciting", false];

const openningHour = new Date("Jan 1, 2026 09:00:00");
const closingHour = new Date("April 30, 2026 21:00:00")

//Get customer's arrival time (system time)
var customerTime = new Date();
console.log("customer arrival time: " + customerTime.getHours());

//console.log("This should print the openning time: " + openningHour.getHours());
//console.log("This should print the closing time: " + closingHour.getHours());
//console.log("closingHour - openningHour = " + (closingHour.getHours() - openningHour.getHours()));
//console.log("Customer arrival time difference: " + (closingHour.getHours() - customerTime.getHours()));

//Function that compares the customer request with a ride's requirements.
function checkRequirements(cust, ride) {
    var viability = true;

    if(cust[0] < ride[0]) {
        viability = false;
    }
    if (cust[1] < ride[1]) {
        viability = false;
    }
    if (cust[2] < ride[2]) {
        viability = false;
    }
    if ((cust[3] === "Calm" && ride[3] === "Exciting") || (cust[3] === "Exciting" && ride[3] === "Calm")) {
        viability = false;
    }
    if ((cust[4]) === "Yes" && ride[4] == false) {
        viability = false;
    }
    return viability;
}

const prompt = require('prompt-sync')({sigint: true});

console.log("In 1 line, enter your age, height, weight, preferred ride mood, and Yes if you want a view, N/A if not:\n");
let customerInput = prompt();

//Split customer input into an array using "," as delimiter.
var criteria = customerInput.split(",");

console.log("The input is: " + customerInput);

//Clean up the data by removing white spaces.
for(i = 0; i < criteria.length; i++) {
    criteria[i] = criteria[i].trim();
    console.log(criteria[i]);
}

//Taking care of clear edge cases, such as when visitors are younger than 4
if(criteria[0] < 4) { 
    console.log("There are currently no rides in the park that are suitable.");
} else { //Visitors are older than 4
    //Visitors are shorter than 152.4 cm
    if(criteria[1] < 152.4) {
        //Only recommend if visitor is younger than 12
        if(criteria[0] < 12) {
            if (checkRequirements(criteria, merryGoRound)) {
                console.log("Merry-Go-Round");
            } else {
                console.log("There are currently no rides in the park that are suitable.");
            }

        }
    //Visitors are taller than 152.4
    } else { 

        /* if (criteria[2] > 36.29 ) {
            if (checkRequirements(criteria, bumperCars)) {
                console.log("Bumper Cars");
            }
            if (checkRequirements(criteria, tiltAWhirl)) {
                console.log("Tilt-A-Whirl");
            } 
        } */

        var hasARide = false;
        
        if (checkRequirements(criteria, bumperCars)) {
            console.log("Bumper Cars");
            hasARide = true;
        }
        if (checkRequirements(criteria, ferrisWheel)) {
            console.log("Ferris Wheel");
            hasARide = true;
        }
        if (checkRequirements(criteria, merryGoRound)) {
            console.log("Merry-Go-Round");
            hasARide = true;
        } 
        if (checkRequirements(criteria, rollerCoaster)) {
            console.log("Roller Coaster");
            hasARide = true;
        } 
        if (checkRequirements(criteria, tiltAWhirl)) {
            console.log("Tilt-A-Whirl");
            hasARide = true;
        } 

        if(!hasARide) {
            console.log("There are currently no rides in the park that are suitable.")
        }

    }
}

