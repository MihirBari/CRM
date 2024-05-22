import React, { useEffect, useState } from "react";
import API_BASE_URL from "../../config";
import "./style.css";
import { CiFilter } from "react-icons/ci";
import { FaExclamationTriangle } from "react-icons/fa";
import FilterModal from "./filterModal.jsx";
import axios from "axios";

const Main = () => {
  const [alerts, setAlerts] = useState([]);
  const [filterModalIsOpen, setFilterModalIsOpen] = useState(false);
  const [filteredUsers, setFilteredUsers] = useState([]);
  const [filters, setFilters] = useState({
    customerEntity: "",
    status: "",
  });
  const [popupAlerts, setPopupAlerts] = useState([]); // State for multiple popup alerts

  useEffect(() => {
    const fetchAlerts = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/opportunity/sendAlert`
        );
        setAlerts(response.data.products);
        setFilteredUsers(response.data.products);
        console.log(response.data.products);
        // Update loading state
      } catch (error) {
        console.error("Error fetching customer details:", error);
        // Update loading state even if there's an error
      }
    };

    fetchAlerts();
  }, [filters]);

  useEffect(() => {
    const checkForPopupAlerts = () => {
      const alertsToPopup = alerts.filter(
        (alert) =>
          alert.daysLeft === 15 &&
          alert.acknowledge === "No" &&
          alert.po_lost === "No"
      );

      const lastPopupTime = localStorage.getItem("lastPopupTime");
      const now = new Date().getTime();
      const threeHours = 3 * 60 * 60 * 1000;

      if (!lastPopupTime || now - lastPopupTime > threeHours) {
        setPopupAlerts(alertsToPopup);
        localStorage.setItem("lastPopupTime", now);
      }
    };

    checkForPopupAlerts();
  }, [alerts]);

  const acknowledgeAlert = async (id) => {
    try {
      await fetch(`${API_BASE_URL}/api/Opportunity/acknowledge`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id }),
      });

      setAlerts((prevAlerts) => prevAlerts.filter((alert) => alert.id !== id));
      setPopupAlerts((prevPopupAlerts) =>
        prevPopupAlerts.filter((alert) => alert.id !== id)
      ); // Close popup if acknowledged
    } catch (error) {
      console.error("Error acknowledging alert:", error);
    }
  };

  const PoLost = async (id) => {
    try {
      await fetch(`${API_BASE_URL}/api/Opportunity/PoLost`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id }),
      });

      setAlerts((prevAlerts) => prevAlerts.filter((alert) => alert.id !== id));
      setPopupAlerts((prevPopupAlerts) =>
        prevPopupAlerts.filter((alert) => alert.id !== id)
      ); // Close popup if acknowledged
    } catch (error) {
      console.error("Error acknowledging alert:", error);
    }
  };

  const onApplyFilters = (filteredData) => {
    setFilteredUsers(filteredData);
    setFilterModalIsOpen(false);
  };

  const initialFilters = {
    customerEntity: "",
    status: "",
  };

  const handleCiFilterClick = () => {
    setFilterModalIsOpen(true);
  };

  const closePopupAlert = (id) => {
    setPopupAlerts((prevPopupAlerts) =>
      prevPopupAlerts.filter((alert) => alert.id !== id)
    );
  };

return (
  <div className="h-screen flex-1 p-7">
  <h1 className="text-2xl font-semibold text-center">Alerts</h1>
  <div>
    <CiFilter
      size={40}
      style={{ marginLeft: "25px" }}
      onClick={handleCiFilterClick}
    />
    <FilterModal
      isOpen={filterModalIsOpen}
      onClose={() => setFilterModalIsOpen(false)}
      onApplyFilters={onApplyFilters}
      filters={filters}
      resetFilters={() => setFilters(initialFilters)}
    />
  </div>
  {alerts.length === 0 ? (
    <p className="text-xl p-7 text-center">No alerts present</p>
  ) : (
    <div className="alert-container">
      {Array.isArray(alerts) &&
        filteredUsers.map((alert) => (
          <div key={alert.id} className="alert-box">
            <h2>Reminder!!
            {alert.daysLeft <= 15 && alert.acknowledge === "No" && (
              <FaExclamationTriangle className="warning-icon" />
            )}
            </h2>
            <p>
              Opportunity for <b>{alert.alert_entity}</b> for{" "}
              {alert.alert_description} in {alert.alert_type} expiring in{" "}
              {alert.daysLeft} days on {alert.license_to}
            </p>
            <div className="button-container">
              <button
                className="po-received-button"
                onClick={() => acknowledgeAlert(alert.id) }
              >
                PO Received
              </button>
              <button
                className="po-lost-button"
                onClick={() => PoLost(alert.id)}
              >
                PO Lost
              </button>
            </div>
          </div>
        ))}
    </div>
  )}
  {popupAlerts.map((alert) => (
    <div key={alert.id} className="popup-alert">
      <button
        className="close-popup-button"
        onClick={() => closePopupAlert(alert.id)}
      >
        X
      </button>
      <h2>Urgent Reminder!</h2>
      <p>
        Opportunity for <b>{alert.alert_entity}</b> for{" "}
        {alert.alert_description} in {alert.alert_type} is expiring in 15
        days on {alert.license_to}
      </p>
      <div className="button-container">
        <button
          className="po-received-button"
          onClick={() => acknowledgeAlert(alert.id)}
        >
          PO Received
        </button>
        <button className="po-lost-button" onClick={() => PoLost(alert.id)}>
          PO Lost
        </button>
      </div>
    </div>
  ))}
</div>
);
};

export default Main;

