//Author: Hy Pham
//ID: 3644179

import { createRequire } from "module";
import { parse } from "path";
const require = createRequire(import.meta.url);

const fs = require('fs')

function filterTask (tasks, prio) {
    let returnArr = [];
    for (let i = 0; i < tasks.length; i++ ) {
        if (tasks[i].priority == prio) {
            returnArr.push(tasks[i]);
        }   
    }
    return returnArr;
}

function getHighPriorityIncomplete (tasks) {
    let arr = filterTask(tasks, 1);
    for (let i = 0; i < arr.length; i++ ) {
        if (!arr[i].completed) {
            console.log(`${arr[i].description} (incomplete)`);
        }   
    }
}

fs.readFile('tasks.json', 'utf8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }

    let totalNum = 0;
    let incomplete = 0;
    let highPrio = 0;

    const parsedData = JSON.parse(data);
    totalNum = parsedData.length;
  

    for (let i = 0; i < parsedData.length; i++ ) {
        if (!parsedData[i].completed) {
            incomplete += 1;
        }
        if (parsedData[i].priority == 1) {
            highPrio += 1;
        }   
    }

    console.log(`Total tasks: ${totalNum}`);
    console.log(`Incomplete tasks: ${incomplete}`);
    console.log(`High Priority tasks: ${highPrio}`);

    
    //console.log(filterTask(parsedData, 1))
    console.log("\nTasks with priority 1:")
    getHighPriorityIncomplete(parsedData);
})

