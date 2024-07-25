import React, { useEffect, useState } from "react";
import API_BASE_URL from "../../config";
import "./style.css";
import { CiFilter } from "react-icons/ci";
import { FaExclamationTriangle } from "react-icons/fa";
import FilterModal from "./filterModal.jsx";
import axios from "axios";
import { Tab, Tabs, TabList, TabPanel } from "react-tabs";
import "react-tabs/style/react-tabs.css";

const Main = () => {
  const [alerts, setAlerts] = useState([]);
  const [filterModalIsOpen, setFilterModalIsOpen] = useState(false);
  const [filteredUsers, setFilteredUsers] = useState([]);
  const [filters, setFilters] = useState({
    customerEntity: "",
    status: "",
  });

  useEffect(() => {
    const fetchAlerts = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/opportunity/sendAlert`
        );
        setAlerts(response.data.products);
        setFilteredUsers(response.data.products);
      } catch (error) {
        console.error("Error fetching customer details:", error);
      }
    };

    fetchAlerts();
  }, [filters]);

  const acknowledgeAlert = async (id) => {
    try {
      await fetch(`${API_BASE_URL}/api/Opportunity/acknowledge`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id }),
      });

      window.location.reload(); // Reload the page after acknowledgment
    } catch (error) {
      console.error("Error acknowledging alert:", error);
    }
  };

  const Remind = async (id) => {
    try {
      await fetch(`${API_BASE_URL}/api/Opportunity/reminder`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ id }),
      });

      window.location.reload(); // Reload the page after acknowledgment
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

      window.location.reload(); // Reload the page after PO lost
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

  const filterAlerts = (alerts, daysLeftRange) => {
    return alerts.filter(
      (alert) =>
        alert.daysLeft >= daysLeftRange[0] && alert.daysLeft <= daysLeftRange[1]
    );
  };

  return (
    <div className="h-screen flex-1 p-7 bg-gray-50">
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
      <Tabs>
        <TabList>
          <Tab>Urgent</Tab>
          <Tab>Warning</Tab>
          <Tab>Reminder</Tab>
        </TabList>

        <TabPanel>
          {filterAlerts(filteredUsers, [0, 15]).length === 0 ? (
            <p className="text-xl p-7 text-center">No urgent alerts present</p>
          ) : (
            <div className="alert-container">
              {filterAlerts(filteredUsers, [0, 15]).map((alert) => (
                <div key={alert.id} className="alert-box shadow ">
                  <h2>
                    Urgent
                    {alert.acknowledge === "No" && (
                      <FaExclamationTriangle className="warning-icon" />
                    )}
                  </h2>
                  <p>
                    Opportunity for <b>{alert.alert_entity}</b> for{" "}
                    {alert.alert_description} in {alert.alert_type} for{" "}
                    <b>{alert.License_type} License Type</b> expiring in{" "}
                    {alert.daysLeft} days on {alert.license_to}
                  </p>
                  <div className="button-container">
                    <button
                      className="po-received-button"
                      onClick={() => acknowledgeAlert(alert.id)}
                    >
                      PO Won
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
        </TabPanel>
        <TabPanel>
          {filterAlerts(filteredUsers, [16, 30]).length === 0 ? (
            <p className="text-xl p-7 text-center">No warning alerts present</p>
          ) : (
            <div className="alert-container">
              {filterAlerts(filteredUsers, [16, 30]).map((alert) => (
                <div key={alert.id} className="alert-box shadow ">
                  <h2>Warning</h2>
                  <p>
                    Opportunity for <b>{alert.alert_entity}</b> for{" "}
                    {alert.alert_description} in {alert.alert_type} for{" "}
                    <b>{alert.License_type} License Type</b> expiring in{" "}
                    {alert.daysLeft} days on {alert.license_to}
                  </p>
                  <button
                    className="po-received-button"
                    onClick={() => Remind(alert.id)}
                  >
                    Remind Me Later
                  </button>
                </div>
              ))}
            </div>
          )}
        </TabPanel>
        <TabPanel>
          {filterAlerts(filteredUsers, [31, 45]).length === 0 ? (
            <p className="text-xl p-7 text-center">No reminder alerts present</p>
          ) : (
            <div className="alert-container">
              {filterAlerts(filteredUsers, [31, 45]).map((alert) => (
                <div key={alert.id} className="alert-box shadow ">
                  <h2>Reminder</h2>
                  <p>
                    Opportunity for <b>{alert.alert_entity}</b> for{" "}
                    {alert.alert_description} in {alert.alert_type} for{" "}
                    <b>{alert.License_type} License Type</b> expiring in{" "}
                    {alert.daysLeft} days on {alert.license_to}
                  </p>
                  <button
                    className="po-received-button"
                    onClick={() => Remind(alert.id)}
                  >
                    Remind Me Later
                  </button>
                </div>
              ))}
            </div>
          )}
        </TabPanel>
      </Tabs>
    </div>
  );
};

export default Main;
