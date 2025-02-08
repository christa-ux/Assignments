//exercise 2
const express = require('express');
const cookieParser = require('cookie-parser');
const app = express();
const port = 3000;

app.use(cookieParser());

app.get('/', (req, res) => {
    let visits = parseInt(req.cookies.visits || '0', 10);
    const lastVisit = req.cookies.lastVisit;

    // Increment the number of visits
    visits += 1;

    // Get the current date and time
    const currentDate = new Date();
    const currentVisitString = currentDate.toString();

    // Set cookies for visits and lastVisit
    res.cookie('visits', visits, { maxAge: 365 * 24 * 60 * 60 * 1000 }); // 1 year
    res.cookie('lastVisit', currentVisitString, { maxAge: 365 * 24 * 60 * 60 * 1000 }); // 1 year

    // Generate response based on the number of visits
    let message;
    if (visits === 1) {
        message = 'Welcome to my webpage! It is your first time that you are here.';
    } else {
        const lastVisitMessage = lastVisit ? `Last time you visited my webpage on: ${lastVisit}` : '';
        message = `Hello, this is the ${visits} time that you are visiting my webpage.<br>${lastVisitMessage}`;
    }

    // Send the response
    res.send(message);
});

// Start the server
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
