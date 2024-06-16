import React, { useEffect, useState } from "react";
import API_BASE_URL from "../../config";
import "./style.css";
import { CiFilter } from "react-icons/ci";
import FilterModal from "./filterModal.jsx";

const Main = () => {
  const [alerts, setAlerts] = useState([]);
  const [filterModalIsOpen, setFilterModalIsOpen] = useState(false);
  const [filteredUsers, setFilteredUsers] = useState([]);
  const [filters, setFilters] = useState({
    designation: "",
    name: "",
  });
  const [popupAlerts, setPopupAlerts] = useState([]); // State for multiple popup alerts

  useEffect(() => {
    const fetchAlerts = async () => {
      try {
        const response = await fetch(`${API_BASE_URL}/api/Opportunity/sendPo`);
        const data = await response.json();
        setAlerts(data.products);
        console.log(data.products);
        setFilteredUsers(data.products);
      } catch (error) {
        console.error("Error fetching alerts:", error);
      }
    };

    fetchAlerts();
  }, []);

  useEffect(() => {
    const checkForPopupAlerts = () => {
      const alertsToPopup = alerts.filter(
        (alert) => alert.daysLeft === 1 && alert.acknowledge === "Yes"
      );
      setPopupAlerts(alertsToPopup);
    };

    checkForPopupAlerts();
  }, [alerts]);

  const acknowledgePopupAlert = (id) => {
    setPopupAlerts((prevPopupAlerts) =>
      prevPopupAlerts.filter((alert) => alert.id !== id)
    );
  };

  const onApplyFilters = (filteredData) => {
    setFilteredUsers(filteredData);
    setFilterModalIsOpen(false);
  };

  const initialFilters = {
    designation: "",
    name: "",
  };

  const handleCiFilterClick = () => {
    setFilterModalIsOpen(true);
  };

  return (
    <div className="h-screen flex-1 p-7">
      <h1 className="text-2xl font-semibold text-center">PO</h1>
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
                <h2>PO WON!!</h2>
                <p>
                  PO of <b>{alert.alert_entity}</b> for{" "}
                  {alert.alert_description} in {alert.alert_type} was won
                </p>
                <div className="button-container"></div>
              </div>
            ))}
        </div>
      )}
      {popupAlerts.map((alert) => (
        <div key={alert.id} className="popup-alert">
          <h2>PO WON</h2>
          <p>
            Opportunity for <b>{alert.alert_entity}</b> for{" "}
            {alert.alert_description} in {alert.alert_type} has been won
            please make required changes
          </p>
          <div className="button-container">
            <button
              className="po-received-button"
              onClick={() => acknowledgePopupAlert(alert.id)}
            >
              Close
            </button>
          </div>
        </div>
      ))}
    </div>
  );
};

export default Main;
