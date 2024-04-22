const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    //console.log(authHeader);
    if (!authHeader) return res.sendStatus(401); // Unauthorized
    
    // Split the header to separate the "Bearer" and the token
    const token = authHeader.split(' ')[1];
    //console.log(token)
    jwt.verify(token, 'jwt-secret-key', (err, user) => {
      if (err) return res.sendStatus(403); // Forbidden
      req.user = user; // Assigning the entire user object to req.user
      // Check if user's role is admin
     
      next(); // Pass the execution to the next middleware
    });
  };
  

module.exports = { authenticateToken };