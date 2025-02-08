//exercise 3
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

// Middleware to parse URL-encoded bodies (for form submissions)
app.use(bodyParser.urlencoded({ extended: true }));


app.get('/', (req, res) => {
    res.sendFile(__dirname + '/formatCheck.html');
});


app.post('/submit', (req, res) => {
    const { name, phone } = req.body;
    const phonePattern = /^\d{3}-\d{3}-\d{4}$/;

    if (phonePattern.test(phone)) {
        res.send(`Hello, ${name}. The phone number ${phone} is valid.`);
    } else {
        res.send(`Hello, ${name}. The phone number ${phone} is invalid. Please use the format ddd-ddd-dddd.`);
    }
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
