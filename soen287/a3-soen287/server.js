//exercise 2
const express = require('express');
const app = express();
const port = 3000;

// Middleware to parse URL-encoded bodies (for form submissions)
app.use(express.urlencoded({ extended: true }));


function findSummation(N = 1) {  //function A
    if (typeof N !== 'number' || N <= 0 || !Number.isInteger(N)) {
        return false;
    }
    let sum = 0;
    for (let i = 1; i <= N; i++) {
        sum += i;
    }
    return sum;
}


function uppercaseFirstandLast(str) { //function B
    if (typeof str !== 'string' || str.trim().length === 0) {
        return false;
    }

    return str.split(' ').map(word => {
        if (word.length === 1) {
            return word.toUpperCase();
        }
        return word[0].toUpperCase() + word.slice(1, -1) + word[word.length - 1].toUpperCase();
    }).join(' ');
}

//Function C
function findAverageAndMedian(arr) {
    if (!Array.isArray(arr) || arr.length === 0 || !arr.every(Number.isFinite)) {
        return false;
    }

    const sum = arr.reduce((acc, val) => acc + val, 0);
    const average = sum / arr.length;

    const sortedArr = [...arr].sort((a, b) => a - b);
    let median;
    const mid = Math.floor(sortedArr.length / 2);

    if (sortedArr.length % 2 === 0) {
        median = (sortedArr[mid - 1] + sortedArr[mid]) * 0.5;
    } else {
        median = sortedArr[mid];
    }

    return { average, median };
}

// Function D
function find4Digits(numbersString) {
    const numbers = numbersString.split(' ');
    for (let number of numbers) {
        if (number.length === 4 && !isNaN(number)) {
            return number;
        }
    }
    return false;
}

// Function A route
app.post('/findSummation', (req, res) => {
    const N = parseInt(req.body.number, 10);
    const result = findSummation(N);
    res.send(`The summation is: ${result}`);
});

// Function B route
app.post('/uppercaseFirstandLast', (req, res) => {
    const str = req.body.text;
    const result = uppercaseFirstandLast(str);
    res.send(`The modified string is: "${result}"`);
});

// Function C route
app.post('/findAverageAndMedian', (req, res) => {
    const arr = req.body.numbers.split(',').map(Number);
    const result = findAverageAndMedian(arr);
    if (result === false) {
        res.send('Invalid input.');
    } else {
        res.send(`The average is: ${result.average}, and the median is: ${result.median}`);
    }
});

// Function D route
app.post('/find4Digits', (req, res) => {
    const str = req.body.text;
    const result = find4Digits(str);
    if (result === false) {
        res.send('No four-digit number found.');
    } else {
        res.send(`The first four-digit number is: ${result}`);
    }
});


app.get('/', (req, res) => {
    res.send(`
        <form action="/findSummation" method="post">
            <label for="number">Enter a positive integer:</label>
            <input type="number" id="number" name="number" required>
            <button type="submit">Submit</button>
        </form>
        <br>
        <form action="/uppercaseFirstandLast" method="post">
            <label for="text">Enter a string:</label>
            <input type="text" id="text" name="text" required>
            <button type="submit">Submit</button>
        </form>
        <br>
        <form action="/findAverageAndMedian" method="post">
            <label for="numbers">Enter a comma-separated list of numbers:</label>
            <input type="text" id="numbers" name="numbers" required>
            <button type="submit">Submit</button>
        </form>
        <br>
        <form action="/find4Digits" method="post">
            <label for="text">Enter a string of numbers separated by spaces:</label>
            <input type="text" id="text" name="text" required>
            <button type="submit">Submit</button>
        </form>
    `);
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
