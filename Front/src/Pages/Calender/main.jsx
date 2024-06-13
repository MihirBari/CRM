import React, { useState, useEffect, useContext } from 'react';
import axios from 'axios';
import Calendar from 'react-calendar';
import API_BASE_URL from '../../config';
import 'react-calendar/dist/Calendar.css';
import './holiday.css'; // Import the CSS file for custom styles
import { AuthContext } from '../../context/AuthContext';

const Main = () => {
  const [file, setFile] = useState(null);
  const [holidays, setHolidays] = useState([]);
  const [value, setValue] = useState(new Date());
  const [selectedHoliday, setSelectedHoliday] = useState(null);

  const { currentUser } = useContext(AuthContext); 

  const handleFileChange = (e) => {
    setFile(e.target.files[0]);
  };

  const handleFileUpload = async () => {
    if (!file) {
      alert('Please select a file.');
      return;
    }

    const formData = new FormData();
    formData.append('file', file);

    try {
      const response = await axios.post(`${API_BASE_URL}/api/Holiday/holiday`, formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      });
      console.log('File uploaded successfully:', response.data);
      fetchHolidays(); // Fetch holidays after successful upload
    } catch (error) {
      console.error('Error uploading file:', error);
    }
  };

  const fetchHolidays = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/api/Holiday/holidays`);
      setHolidays(response.data);
    } catch (error) {
      console.error('Error fetching holidays:', error);
    }
  };

  useEffect(() => {
    fetchHolidays();
  }, []);

  const isHoliday = (date) => {
    return holidays.some(holiday => {
      const holidayDate = new Date(holiday.date);
      return (
        holidayDate.getFullYear() === date.getFullYear() &&
        holidayDate.getMonth() === date.getMonth() &&
        holidayDate.getDate() === date.getDate()
      );
    });
  };

  const handleDateClick = (date) => {
    const holiday = holidays.find(holiday => {
      const holidayDate = new Date(holiday.date);
      return (
        holidayDate.getFullYear() === date.getFullYear() &&
        holidayDate.getMonth() === date.getMonth() &&
        holidayDate.getDate() === date.getDate()
      );
    });
    setSelectedHoliday(holiday || null);
  };

  const handleTodayClick = () => {
    setValue(new Date()); // Set the calendar value to today's date
    setSelectedHoliday(null); // Clear selected holiday when going to today
  };

  const tileClassName = ({ date, view }) => {
    if (view === 'month' && isHoliday(date)) {
      return 'holiday';
    }
    return 'default';
  };

  return (
    <div className="container">
      <h1>Holiday Calendar</h1>
      {currentUser.role === 'admin' && (
        <div>
          <div className="file-upload">
            <input type="file" onChange={handleFileChange} />
          </div>
          <button onClick={handleFileUpload}>Upload File</button>
        </div>
      )}
      <Calendar
        onChange={setValue}
        value={value}
        onClickDay={handleDateClick}
        tileClassName={tileClassName}
        onClickMonth={handleTodayClick} // Navigate to today when clicking on "Today" button
      />
      {selectedHoliday && (
        <div className="holiday-details">
          <h2>{selectedHoliday.name}</h2>
          <p>{new Date(selectedHoliday.date).toDateString()}</p>
        </div>
      )}
    </div>
  );
};

export default Main;
