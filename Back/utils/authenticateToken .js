const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    //console.log('Authorization Header:', authHeader);  // Log the entire header for debugging

    if (!authHeader) return res.status(401).json({ message: 'Authorization token is missing' });

    const token = authHeader.split(' ')[1];  // Get the token from 'Bearer <token>'
    //console.log('Extracted Token:', token);  // Log the extracted token

    if (!token) return res.status(401).json({ message: 'Token is missing' });

    jwt.verify(token, process.env.JWT_SECRET_KEY, (err, user) => {
        if (err) {
          if (err.name === 'TokenExpiredError') {
            return res.status(401).json({ message: 'Token has expired' }); // Expired token
          }
          console.log("JWT Verification Error:", err); // Log the error for debugging
          return res.status(403).json({ message: 'Invalid or expired token' }); // Forbidden
        }      

      req.user = user;
      next();
    });
};
  

module.exports = { authenticateToken };