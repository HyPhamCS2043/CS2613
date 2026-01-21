//Author: Hy Pham
//3644179

const ferrisWheel = [10, 152.4, 0, "Calm", true];
const rollerCoaster = [10, 152.4, 0, "Exciting", true];
const bumperCars = [14, 152.4, 36.29, "Exciting", false];
const merryGoRound = [4, 0, 0, "Calm", false]; //only recommended if under 12 
const tiltAWhirl = [4, 152.4, 36.29, "Exciting", false];

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
    if ((cust[3].toLowerCase() === "calm" && ride[3].toLowerCase()  === "exciting") 
        || (cust[3].toLowerCase()  === "exciting" && ride[3].toLowerCase()  === "calm")) {
        viability = false;
    }
    if ((cust[4]).toLowerCase()  === "yes" && ride[4] == false) {
        viability = false;
    }
    return viability;
}

const prompt = require('prompt-sync')({sigint: true});

console.log("In 1 line, enter your age, height, weight, preferred ride mood, and Yes if you want a view, N/A if not:\n");
let customerInput = prompt();
console.log(); //Add a line between user input and output

//Split customer input into an array using "," as delimiter.
var criteria = customerInput.split(",");

//Check if the user puts in at least 5 requirements
while (criteria.length < 5) {
    console.log("Not enough requirements. Please input 5 requirement values, separated by comma ',' ");
    customerInput = prompt();
    console.log();

    criteria = customerInput.split(",");

    if(criteria.length >= 5) {
        break;
    }
}
//Clean up the data by removing white spaces.
for(i = 0; i < 5; i++) {
    criteria[i] = criteria[i].trim();
}


//Get customer's arrival time (system time)
var customerTime = new Date();

//If current time is at exactly 00 minutes, format output string to print 00 instead of 0
var currentMinutes = customerTime.getMinutes() === 0 ? "00" : customerTime.getMinutes();

console.log(`Current time: ${customerTime.getHours()}:${currentMinutes} ` );

//Variable to indicate whether the park is open or not
var isOpen = true;

//If the customer does not arrive between January (which is 0)
//and April (which is 3)
if (customerTime.getMonth() > 3) {
    isOpen = false;
}

//Check if the visitor arrives between 11 AM and 11 PM (a.k.a. 23:00)
if (customerTime.getHours() < 11 || customerTime.getHours() >= 23) {
    isOpen = false;
}

if(isOpen) {
    console.log("The Amusement Park is OPEN.");
} else {
    console.log("The Amusement Park is CLOSED.");
}

console.log("Ride Recommendations:");

//Taking care of clear edge cases, such as when visitors are younger than 4
if(criteria[0] < 4) { 
    console.log("\tThere are currently no rides in the park that are suitable.");
} else { //Visitors are older than 4
    //Visitors are shorter than 152.4 cm
    if(criteria[1] < 152.4) {
        //Only recommend if visitor is younger than 12
        if(criteria[0] < 12) {
            if (checkRequirements(criteria, merryGoRound)) {
                console.log("\tMerry-Go-Round");
            } else {
                console.log("\tThere are currently no rides in the park that are suitable.");
            }

        } else {
           console.log("\tThere are currently no rides in the park that are suitable."); 
        }

    } else { //Visitors are taller than 152.4
        //Variable to check if any rides are recommended
        var hasARide = false;
        
        if (checkRequirements(criteria, bumperCars)) {
            console.log("\tBumper Cars");
            hasARide = true;
        }
        if (checkRequirements(criteria, ferrisWheel)) {
            console.log("\tFerris Wheel");
            hasARide = true;
        }
        if (checkRequirements(criteria, merryGoRound)) {
            console.log("\tMerry-Go-Round");
            hasARide = true;
        } 
        if (checkRequirements(criteria, rollerCoaster)) {
            console.log("\tRoller Coaster");
            hasARide = true;
        } 
        if (checkRequirements(criteria, tiltAWhirl)) {
            console.log("\tTilt-A-Whirl");
            hasARide = true;
        } 

        if(!hasARide) {
            console.log("\tThere are currently no rides in the park that are suitable.")
        }

    }
}

if(isOpen) {
    console.log("Hope to see you soon!");
} else {
    console.log("We hope to see you when our park opens, every day 11AM-11PM from January 1st to April 30th.");
}