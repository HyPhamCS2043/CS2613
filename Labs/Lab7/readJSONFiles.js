//Author: Hy Pham
//3644179

import { createRequire } from "module";
const require = createRequire(import.meta.url);

const fs = require('fs')


fs.readdir("Lab7_StudentFiles/", (err, files) => {
  if (err)
    console.log(err);
  else {
    var sumDifAbby = 0
    var sumDifTyson = 0
    var sumDifZack = 0
    console.log("\nComparision of each file:");
    files.forEach(file => {
        
      //console.log(file);
      fs.readFile('Lab7_StudentFiles/' + file, 'utf8', (err, data) => {
        if (err) {
            console.error(err);
            return;
        }
        //data = JSON.stringify(data)
        //console.log(data);
        const parsed = JSON.parse(data)
        

        const trueValue = parseFloat(parsed.data.calculations[0].calc)
        const abbyCalc = parseFloat(parsed.data.calculations[1].calc)
        const tysonCalc = parseFloat(parsed.data.calculations[2].calc)
        const zackCalc = parseFloat(parsed.data.calculations[3].calc)

        let difAbby = trueValue - abbyCalc
        sumDifAbby += Math.abs(difAbby)
        let difTyson = trueValue - tysonCalc
        sumDifTyson += Math.abs(difTyson)
        let difZack = trueValue - zackCalc
        sumDifZack += Math.abs(difZack)
        
        console.log(file);

        if(Math.abs(difAbby) <= Math.abs(difTyson) && Math.abs(difTyson) <= Math.abs(difZack)) {
            console.log(`1. Abby (${Math.abs(difAbby)})\n2. Tyson (${Math.abs(difTyson)})\n3. Zack (${Math.abs(difZack)})`)
            console.log()
        } else if (Math.abs(difTyson) <= Math.abs(difAbby) && Math.abs(difAbby) <= Math.abs(difZack)) {
            console.log(`1. Tyson (${Math.abs(difTyson)})\n2. Abby (${Math.abs(difAbby)})\n3. Zack (${Math.abs(difZack)})`)
            console.log()
        } else if (Math.abs(difZack) <= Math.abs(difAbby) && Math.abs(difAbby) <= Math.abs(difTyson)) {
            console.log(`1. Zack (${Math.abs(difZack)})\n2. Abby (${Math.abs(difAbby)})\n3. Tyson (${Math.abs(difTyson)})`)
            console.log()
        } else if (Math.abs(difAbby) <= Math.abs(difZack) && Math.abs(difZack) <= Math.abs(difTyson)) {
            console.log(`1. Abby (${Math.abs(difAbby)})\n2. Zack (${Math.abs(difZack)})\n3. Tyson (${Math.abs(difTyson)})`)
            console.log()
        } else if (Math.abs(difTyson) <= Math.abs(difZack) && Math.abs(difZack) <= Math.abs(difAbby)) {
            console.log(`1. Tyson (${Math.abs(difTyson)})\n2. Zack (${Math.abs(difZack)})\n3. Abby (${Math.abs(difAbby)})`)
            console.log()
        } else {
            console.log(`1. Zack (${Math.abs(difZack)})\n2. Tyson (${Math.abs(difTyson)})\n3. Abby (${Math.abs(difAbby)})`)
            console.log()
        }

        console.log("Ranking of total difference so far: ")
        if(Math.abs(sumDifAbby) <= Math.abs(sumDifTyson) && Math.abs(sumDifTyson) <= Math.abs(sumDifZack)) {
            console.log(`1. Abby (${Math.abs(sumDifAbby)})\n2. Tyson (${Math.abs(sumDifTyson)})\n3. Zack (${Math.abs(sumDifZack)})`)
            console.log()
        } else if (Math.abs(sumDifTyson) <= Math.abs(sumDifAbby) && Math.abs(sumDifAbby) <= Math.abs(sumDifZack)) {
            console.log(`1. Tyson (${Math.abs(sumDifTyson)})\n2. Abby (${Math.abs(sumDifAbby)})\n3. Zack (${Math.abs(sumDifZack)})`)
            console.log()
        } else if (Math.abs(sumDifZack) <= Math.abs(sumDifAbby) && Math.abs(sumDifAbby) <= Math.abs(sumDifTyson)) {
            console.log(`1. Zack (${Math.abs(sumDifZack)})\n2. Abby (${Math.abs(sumDifAbby)})\n3. Tyson (${Math.abs(sumDifTyson)})`)
            console.log()
        } else if (Math.abs(sumDifAbby) <= Math.abs(sumDifZack) && Math.abs(difZack) <= Math.abs(sumDifTyson)) {
            console.log(`1. Abby (${Math.abs(sumDifAbby)})\n2. Zack (${Math.abs(sumDifZack)})\n3. Tyson (${Math.abs(sumDifTyson)})`)
            console.log()
        } else if (Math.abs(sumDifTyson) <= Math.abs(sumDifZack) && Math.abs(sumDifZack) <= Math.abs(sumDifAbby)) {
            console.log(`1. Tyson (${Math.abs(sumDifTyson)})\n2. Zack (${Math.abs(sumDifZack)})\n3. Abby (${Math.abs(sumDifAbby)})`)
            console.log()
        } else {
            console.log(`1. Zack (${Math.abs(sumDifZack)})\n2. Tyson (${Math.abs(sumDifTyson)})\n3. Abby (${Math.abs(sumDifAbby)})`)
            console.log()
        }
        }); 
    })
    

  }
})