import axios from "axios";
import { createContext, useEffect, useState } from "react";
import { useNavigate } from 'react-router-dom';
import API_BASE_URL from "../config";
import { toast } from "react-toastify";

export const AuthContext = createContext();

export const AuthContextProvider = ({ children }) => {
  const [currentUser, setCurrentUser] = useState(
    JSON.parse(localStorage.getItem("user")) || null
  );
  const navigate = useNavigate();

  useEffect(() => {
    // Check if user data is available in localStorage on page load
    const storedUser = JSON.parse(localStorage.getItem("user"));
    if (storedUser) {
      setCurrentUser(storedUser); // Set currentUser state if user data is available
      // Include the authentication token in Axios defaults if user data is available
      axios.defaults.headers.common['Authorization'] = `Bearer ${storedUser.accessToken}`;
    }
  }, []);

  const login = async (inputs) => {
    try {
      const res = await axios.post(`${API_BASE_URL}/api/user/login`, inputs);
      const { accessToken, user } = res.data; // Extract accessToken and user from response
      setCurrentUser(user); // Store user data in currentUser state
      localStorage.setItem("user", JSON.stringify({ ...user, accessToken })); // Store user data including accessToken in localStorage
      // Set the accessToken in Axios defaults to be sent with every subsequent request
      axios.defaults.headers.common['Authorization'] = `Bearer ${accessToken}`;
      navigate('/Customer');
    } catch (error) {
      console.log(error);
      toast.error('Email or Password wrong');
    }
  };

  const logout = async () => {
    try {
      await axios.get(`${API_BASE_URL}/api/user/logout`);
      setCurrentUser(null);
      localStorage.removeItem("user"); // Remove user data from localStorage on logout
      // Remove the accessToken from Axios defaults on logout
      delete axios.defaults.headers.common['Authorization'];
      navigate('/');
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <AuthContext.Provider value={{ currentUser, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};
