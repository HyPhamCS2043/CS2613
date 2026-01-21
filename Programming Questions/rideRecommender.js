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
const bumperCars = [14, 152.4, 36.29, "Exciting", null];
const merryGoRound = [4, 0, 0, "Calm", null]; //recommended for under 12 too
const tiltAWhirl = [4, 152.4, 36.29, "Exciting", null];

const openningHour = new Date("Jan 1, 2026 09:00:00");
const closingHour = new Date("April 30, 2026 21:00:00")

var customerTime = new Date();
console.log("customer arrival time: " + customerTime.getHours());

//console.log("This should print the openning time: " + openningHour.getHours());
//console.log("This should print the closing time: " + closingHour.getHours());
//console.log("closingHour - openningHour = " + (closingHour.getHours() - openningHour.getHours()));
//console.log("Customer arrival time difference: " + (closingHour.getHours() - customerTime.getHours()));

const prompt = require('prompt-sync')({sigint: true});

console.log("In 1 line, enter your age, height, weight, preferred ride mood, and Yes if you want a view, N/A if not:\n");
let customerInput = prompt();
var criteria = customerInput.split(",");

console.log("The input is: " + customerInput);

for(i = 0; i < criteria.length; i++) {
    criteria[i] = criteria[i].trim();
    console.log(criteria[i]);
}

if(criteria[0] < 4) {
    console.log("There are currently no rides in the part that are suitable.");
} else {
    if(criteria[1] < 152.4) {
        if(criteria[0] < 12 && criteria[3] === "Calm") {
            console.log ("Merry-Go-Round");
        }
        else {
            console.log("There are currently no rides in the part that are suitable.");
        }
    } else {
        //
    }
}

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
    
    return viability;
}

//console.log("Test check viability output for bumper cars: " + checkRequirements(criteria, bumperCars));