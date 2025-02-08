//sometimes in when creating an account or adding a pet, the information is not saved right away in txt file. 
//(sometimes i face conflict issues between the "old" txt file that has all information an the "new" txt file which is empty, even though I'm using the same file)
//if you're using VSC, just run "cd Exercise4, then node app.js, then choose the old version of the txt file to see all information"
const express = require('express');
const path = require('path');
const fs = require('fs');
const bodyParser = require('body-parser');
const session = require('express-session');

const app = express();
const port = 3000;


app.set('view engine', 'ejs');


app.set('views', path.join(__dirname, 'views'));


app.use(express.static(path.join(__dirname, 'public')));


app.use(bodyParser.urlencoded({ extended: true }));

// Set up session middleware
app.use(session({
  secret: 'your_secret_key',
  resave: false,
  saveUninitialized: true
}));


// Middleware to pass session to all views
app.use((req, res, next) => {
    res.locals.session = req.session;
    next();
});


// Paths to the data files
const petsFilePath = path.join(__dirname, 'data', 'pet.txt');
const usersFilePath = path.join(__dirname, 'data', 'user.txt');

const readPetsFromFile = () => {
    try {
        const data = fs.readFileSync(petsFilePath, 'utf8');
        const pets = data.split('\n').filter(line => line).map(line => {
            const [id, username, animal, breed, age, gender, getsAlongWith, discussion, fname, lname, email] = line.split(':');
            return { id, username, animal, breed, age, gender, getsAlongWith: getsAlongWith.split(','), discussion, fname, lname, email };
        });
        return pets;
    } catch (error) {
        console.error('Error reading pets file:', error);
        return [];
    }
};
  



// Utility function to read users from the file
const readUsersFromFile = () => {
  const data = fs.readFileSync(usersFilePath, 'utf8');
  const users = data.split('\n').filter(line => line).map(line => {
    const [username, password] = line.split(':');
    return { username, password };
  });
  return users;
};

// Middleware to ensure user is logged in
const ensureLoggedIn = (req, res, next) => {
    if (req.session.loggedIn) {
      next();
    } else {
      res.redirect('/login');
    }
  };
  
  // Route for the giveaway page
  app.get('/giveaway', ensureLoggedIn, (req, res) => {
    res.render('giveaway');
  });
  
// Route for the home page
app.get('/', (req, res) => {
  res.render('index', {
    title: 'Adopt A-Cat/Dog',
    items: ['Cat', 'Dog']
  });
});

// Route for the registration page
app.get('/register', (req, res) => {
  res.render('register');
});

app.post('/register', (req, res) => {
    const { username, password } = req.body;
  
    
    if (!username || !password) {
      return res.render('register', { error: 'Username and password are required.' });
    }
  
   
    const users = readUsersFromFile();
    
   
    const existingUser = users.find(user => user.username === username);
    
    if (existingUser) {
      return res.render('register', { 
        error: 'Username already exists.'
      });
    }
  
  
    const userString = `${username}:${password}\n`;
    fs.appendFileSync(usersFilePath, userString, 'utf8');
  
   
    res.render('register', { success: 'Account created successfully!' });
  });
  

// Route for the login page
app.get('/login', (req, res) => {
    res.render('login', {
     
    });
  });

app.post('/login', (req, res) => {
  const { username, password } = req.body;

 
  const users = readUsersFromFile();
  
  const user = users.find(user => user.username === username && user.password === password);

  if (user) {
    req.session.loggedIn = true;
    req.session.username = username;
    res.redirect('/giveaway');
  } else {
    res.render('login', { error: 'Invalid username or password' });
  }
});

app.get('/logout', (req, res) => {
    req.session.destroy(err => {
      if (err) {
        return res.redirect('/');
      }
      res.clearCookie('connect.sid'); 
      res.redirect('/login');
    });
  });
  
  app.post('/logout', (req, res) => {
    req.session.destroy(err => {
        if (err) {
            return res.redirect('/');
        }
        res.clearCookie('connect.sid'); 
        res.redirect('/login');
    });
});

  const getNextPetId = () => {
    try {
      const data = fs.readFileSync(petsFilePath, 'utf8');
      console.log('File data:', data);
      const lines = data.split('\n').filter(line => line);
      console.log('Lines:', lines);
      
      if (lines.length === 0) {
        return 1;
      } else {
        const lastLine = lines[lines.length - 1];
        console.log('Last line:', lastLine);
        const parts = lastLine.split(':');
        console.log('Parts:', parts);
        
       
        const lastId = parseInt(parts[0], 10);
        console.log('Parsed Last ID:', lastId);
        
        
        return isNaN(lastId) ? 1 : lastId + 1;
      }
    } catch (error) {
      console.error('Error reading pets file:', error);
      return 1;
    }
  };
  
  
  
  

  app.post('/giveaway', ensureLoggedIn, (req, res) => {
    const { type, breed, agedog, gender, value1, value2, value3, discussion, fname, lname, email } = req.body;
    const username = req.session.username; 
   
   
    const pet = {
      id: getNextPetId(),
      username: username,
      type: type,
      breed: breed,
      age: agedog,
      gender: gender,
      getsAlongWith: [value1, value2, value3].filter(value => value),
      discussion: discussion,
      fname: fname,
      lname: lname,
      email: email
    };
  
   
    const petString = `${pet.id}:${pet.username}:${pet.type}:${pet.breed}:${pet.age}:${pet.gender}:${pet.getsAlongWith.join(',')}:${pet.discussion}:${pet.fname}:${pet.lname}:${pet.email}\n`;
  
    
    try {
      fs.appendFileSync(petsFilePath, petString, 'utf8');
      res.render('giveaway', { message: 'Pet information submitted successfully!' });
    } catch (error) {
      console.error('Error writing to pet file:', error);
      res.render('giveaway', { message: 'Failed to submit pet information.' });
    }
  });
  

// Route for the find page
app.get('/find', (req, res) => {
  res.render('find');
});

app.post('/find', (req, res) => {
    const { animalType, breed, age, gender, value1, value2, value3 } = req.body;
  
    const searchCriteria = {
        animal: animalType,
        breed: breed,
        age: age,
        gender: gender,
        getsAlongWith: [value1, value2, value3].filter(value => value)
    };
  
    const pets = readPetsFromFile();
  
    const matches = pets.filter(pet => {
        return (
            pet.animal === searchCriteria.animal &&
            (searchCriteria.breed === 'noMatter' || pet.breed === searchCriteria.breed) &&
            (searchCriteria.age === 'noMatter' || pet.age === searchCriteria.age) &&
            (searchCriteria.gender === 'noMatter' || pet.gender === searchCriteria.gender) &&
            searchCriteria.getsAlongWith.every(value => pet.getsAlongWith.includes(value))
        );
    });


    matches.forEach(match => {
        const imagePath = path.join(__dirname, 'public', 'images', `${match.breed.toLowerCase()}Browse.jpg`);
        match.imageExists = fs.existsSync(imagePath);
    });
  
    res.render('results', { matches });
});

  


app.get('/catcare', (req, res) => {
  res.render('catcare');
});

app.get('/dogcare', (req, res) => {
  res.render('dogcare');
});

app.get('/contact', (req, res) => {
  res.render('contact');
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
