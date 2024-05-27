import axios from "axios";
import React, { useEffect, useState } from "react";
import Modal from "react-modal";
import API_BASE_URL from "../../config";

const FilterModal = ({ isOpen, onClose, onApplyFilters, resetFilters }) => {
  const [type, setType] = useState("");
  const [LicenseType, setLicenseType] = useState("");
  const [licenseFrom, setLicenseFrom] = useState("");
  const [licenseTo, setLicenseTo] = useState("");
  const [dateFilterType, setDateFilterType] = useState("");
  const [selectedDate, setSelectedDate] = useState(
    new Date().toISOString().split("T")[0]
  );
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [shouldApplyFilters, setShouldApplyFilters] = useState(false);

  const applyFilters = async () => {
    try {
      const response = await axios.get(
        `${API_BASE_URL}/api/Opportunity/showOpportunity`,
        {
          params: {
            type,
            LicenseType,
            licenseFrom,
            licenseTo,
            dateFilterType,
            selectedDate: dateFilterType !== "between" ? selectedDate : null,
            startDate: dateFilterType === "between" ? startDate : null,
            endDate: dateFilterType === "between" ? endDate : null,
          },
        }
      );
      onApplyFilters(response.data.products);
      console.log("server",response.data.aggregates)
      localStorage.setItem(
        "OrderFilters",
        JSON.stringify({
          type,
          LicenseType,
          licenseFrom,
          licenseTo,
          dateFilterType,
          selectedDate,
          startDate,
          endDate,
        })
      );
    } catch (error) {
      console.error("Error applying filters:", error.message);
    }
  };

  useEffect(() => {
    const storedFilters = localStorage.getItem("OrderFilters");
    if (storedFilters) {
      const {
        type: storedType,
        LicenseType: storedLicenseType,
        licenseFrom: storedLicenseFrom,
        licenseTo: storedLicenseTo,
        dateFilterType: storedDateFilterType,
        selectedDate: storedSelectedDate,
        startDate: storedStartDate,
        endDate: storedEndDate,
      } = JSON.parse(storedFilters);

      setType(storedType);
      setLicenseType(storedLicenseType);
      setLicenseFrom(storedLicenseFrom);
      setLicenseTo(storedLicenseTo);
      setDateFilterType(storedDateFilterType);
      setSelectedDate(storedSelectedDate);
      setStartDate(storedStartDate);
      setEndDate(storedEndDate);

      setShouldApplyFilters(true);
    }
  }, []);

  useEffect(() => {
    if (shouldApplyFilters) {
      applyFilters();
      setShouldApplyFilters(false);
    }
  }, [shouldApplyFilters]);

  const handleResetFilters = () => {
    setType("");
    setLicenseType("");
    setLicenseFrom("");
    setLicenseTo("");
    setDateFilterType("");
    setSelectedDate(new Date().toISOString().split("T")[0]);
    setStartDate(null);
    setEndDate(null);
    resetFilters();
  };

  return (
    <Modal
      isOpen={isOpen}
      onRequestClose={onClose}
      style={{
        overlay: {
          zIndex: 9999,
        },
        content: {
          height: "50%",
          margin: "auto",
        },
      }}
    >
      <div className="filter-modal">
        <select
          value={type}
          onChange={(e) => setType(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
          <option value="" disabled>Opportunity Type</option>
          <option value="BigFix">BigFix</option>
          <option value="SolarWinds">SolarWinds</option>
          <option value="Services">Services</option>

        </select>

        <select
          value={LicenseType}
          onChange={(e) => setLicenseType(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
          <option value="" disabled>License Type</option>
          <option value="New">New</option>
          <option value="Renew">Renew</option>
          <option value="Services">Services</option>
       
        </select>

        <div className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2">
          <label>License From:</label>
          <input
            type="date"
            value={licenseFrom}
            onChange={(e) => setLicenseFrom(e.target.value)}
          />
        </div>

        <div className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2">
          <label>License To:</label>
          <input
            type="date"
            value={licenseTo}
            onChange={(e) => setLicenseTo(e.target.value)}
          />
        </div>

        <button
          onClick={() => {
            applyFilters();
            onClose();
          }}
          className="bg-blue-500 text-white px-4 py-2 rounded"
          style={{ marginLeft: "10px" }}
        >
          Apply Filters
        </button>
        <button
          onClick={handleResetFilters}
          className="bg-red-500 text-white px-4 py-2 rounded"
          style={{ marginLeft: "10px" }}
        >
          Clear Filters
        </button>
        <button
          onClick={onClose}
          className="bg-blue-500 text-white px-4 py-2 rounded"
          style={{ marginLeft: "10px" }}
        >
          Cancel
        </button>
      </div>
    </Modal>
  );
};

export default FilterModal;
