// ── SYNCHRONOUS (simplest, best for exams) ──────────────────────────
const fs = require('fs');

// Read whole file as string
const content = fs.readFileSync('input.txt', 'utf8');
console.log(content);

// Read as array of lines
const lines = fs.readFileSync('input.txt', 'utf8').split('\n');
lines.forEach(line => console.log(line));

// Write to file (overwrites)
fs.writeFileSync('output.txt', 'Hello World\n');

// Append to file
fs.appendFileSync('output.txt', 'Another line\n');


// ── SYNCHRONOUS - Read, Process, Write ──────────────────────────────
const input  = fs.readFileSync('students.txt', 'utf8');
const output = [];

input.split('\n')
     .filter(line => line.trim() !== '')       // skip empty lines
     .forEach(line => {
         const [name, score] = line.split(',');
         const grade = parseInt(score) >= 50 ? 'PASS' : 'FAIL';
         output.push(`${name.trim()} | ${grade}`);
     });

fs.writeFileSync('results.txt', output.join('\n'));


// ── ASYNCHRONOUS with Callbacks ──────────────────────────────────────
fs.readFile('input.txt', 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading file:', err);
        return;
    }
    console.log(data);

    // Write must be NESTED inside read callback (else data won't exist yet)
    fs.writeFile('output.txt', data.toUpperCase(), (err) => {
        if (err) console.error('Error writing file:', err);
        else     console.log('File written!');
    });
});


// ── ASYNCHRONOUS with Promises (async/await) ─────────────────────────
const fsPromises = require('fs').promises;

async function processFile() {
    try {
        // Read
        const data = await fsPromises.readFile('input.txt', 'utf8');
        console.log(data);

        // Write
        await fsPromises.writeFile('output.txt', data.toUpperCase());
        console.log('Done!');

        // Append
        await fsPromises.appendFile('output.txt', '\nAppended line');

    } catch (err) {
        console.error('Error:', err);
    }
}

processFile();