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
  const [birthdays, setBirthdays] = useState([]); // Add state for birthdays
  const [value, setValue] = useState(new Date());
  const [selectedEvents, setSelectedEvents] = useState([]); // Change to array to handle multiple events

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

  const fetchBirthdays = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/api/Holiday/birthday`);
      setBirthdays(Array.isArray(response.data) ? response.data : []); // Ensure the data is an array
      console.log(response.data);
    } catch (error) {
      console.error('Error fetching birthdays:', error);
    }
  };

  useEffect(() => {
    fetchHolidays();
    fetchBirthdays();
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

  const isBirthday = (date) => {
    return birthdays.some(birthday => {
      const birthdayDate = new Date(birthday.DOB);
      return (
        birthdayDate.getMonth() === date.getMonth() &&
        birthdayDate.getDate() === date.getDate()
      );
    });
  };

  const handleDateClick = (date) => {
    const holidayEvents = holidays.filter(holiday => {
      const holidayDate = new Date(holiday.date);
      return (
        holidayDate.getFullYear() === date.getFullYear() &&
        holidayDate.getMonth() === date.getMonth() &&
        holidayDate.getDate() === date.getDate()
      );
    });

    const birthdayEvents = birthdays.filter(birthday => {
      const birthdayDate = new Date(birthday.DOB);
      return (
        birthdayDate.getMonth() === date.getMonth() &&
        birthdayDate.getDate() === date.getDate()
      );
    });

    setSelectedEvents([...holidayEvents, ...birthdayEvents]);
  };

  const handleTodayClick = () => {
    setValue(new Date()); // Set the calendar value to today's date
    setSelectedEvents([]); // Clear selected events when going to today
  };

  const tileClassName = ({ date, view }) => {
    if (view === 'month') {
      if (isHoliday(date)) {
        return 'holiday';
      }
      if (isBirthday(date)) {
        return 'birthday';
      }
    }
    return 'default';
  };

  return (
    <div className="container">
      <h1>Holiday and Birthday Calendar</h1>
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
      {selectedEvents.length > 0 && (
        <div className="event-details">
          {selectedEvents.map((event, index) => (
            <div key={index}>
              <h2>{`${event.name} ${event.surname ? event.surname : ''} ${event.DOB ? 'Birthday' : ''}`}</h2>
              <p>{new Date(event.date || event.DOB).toDateString()}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default Main;
