import React from 'react';
import { Navigate } from 'react-router-dom';
import { useContext } from 'react';
import { AuthContext } from '../context/AuthContext';

const ProtectedRoute = ({ children, adminOnly = false, moderatorOnly = false }) => {
  const { currentUser } = useContext(AuthContext);

  if (!currentUser) {
    return <Navigate to="/" />;
  }

  if (adminOnly && currentUser.role !== 'admin' && currentUser.role !== 'moderator') {
    // return <Navigate to="/Leave" />;
    return <Navigate to="/unauthorized" />;
  }


  return children;
};

export default ProtectedRoute;
