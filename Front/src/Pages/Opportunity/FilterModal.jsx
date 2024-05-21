import axios from "axios";
import React, { useEffect, useState } from "react";
import Modal from "react-modal";
import API_BASE_URL from "../../config";

const FilterModal = ({ isOpen, onClose, onApplyFilters, resetFilters }) => {
  const [customerEntities, setCustomerEntities] = useState([]);
  const [customerEntitiess, setCustomerEntitiess] = useState([]);
  const [type, setType] = useState("");
  const [value, setValue] = useState("");
  const [status, setStatus] = useState([]);
  const [closureTime, setClosureTime] = useState("");
  const [licenseFrom, setLicenseFrom] = useState("");
  const [licenseTo, setLicenseTo] = useState("");
  const [dateFilterType, setDateFilterType] = useState("");
  const [selectedDate, setSelectedDate] = useState(
    new Date().toISOString().split("T")[0]
  );
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [shouldApplyFilters, setShouldApplyFilters] = useState(false);

  useEffect(() => {
    const fetchCustomerEntities = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Contact/customerentity`
        );
        setCustomerEntitiess(response.data);
        console.log(response.data);
      } catch (error) {
        console.error("Error fetching customer entities:", error);
      }
    };

    fetchCustomerEntities();
  }, []);

  const applyFilters = async () => {
    try {
      const response = await axios.get(
        `${API_BASE_URL}/api/Opportunity/showOpportunity`,
        {
          params: {
            customerEntities,
            type,
            value,
            status,
            closureTime,
            licenseFrom,
            licenseTo,
            dateFilterType,
            selectedDate: dateFilterType !== "between" ? selectedDate : null,
            startDate: dateFilterType === "between" ? startDate : null,
            endDate: dateFilterType === "between" ? endDate : null,
          },
        }
      );
      console.log("Server Response:", response.data); // Log the response
      onApplyFilters(response.data.products);
      localStorage.setItem(
        "OrderFilters",
        JSON.stringify({
          customerEntities,
          type,
          value,
          status,
          closureTime,
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
        customerEntities: storedCustomerEntities,
        type: storedType,
        value: storedValue,
        status: storedStatus,
        closureTime: storedClosureTime,
        licenseFrom: storedLicenseFrom,
        licenseTo: storedLicenseTo,
        dateFilterType: storedDateFilterType,
        selectedDate: storedSelectedDate,
        startDate: storedStartDate,
        endDate: storedEndDate,
      } = JSON.parse(storedFilters);

      setCustomerEntities(storedCustomerEntities);
      setType(storedType);
      setValue(storedValue);
      setStatus(storedStatus);
      setClosureTime(storedClosureTime);
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
    setCustomerEntities([]);
    setType("");
    setValue("");
    setStatus("");
    setClosureTime("");
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
          value={customerEntities}
          onChange={(e) =>
            setCustomerEntities(
              Array.from(e.target.selectedOptions, (option) => option.value)
            )
          }
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
          <option value="">Select Customer Entity</option>
          {customerEntitiess &&
            customerEntitiess.map((entity, index) => (
              <option key={index} value={entity.customer_entity}>
                {entity.customer_entity}
              </option>
            ))}
        </select>

        <select
          value={type}
          onChange={(e) => setType(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
           <option value="" selected disabled>Opportunity Type</option>
          <option value="BigFix New">BigFix New</option>
          <option value="BigFix Renew">BigFix Renew</option>
          <option value="SolarWinds New">SolarWinds New</option>
          <option value="SolarWinds Renew">SolarWinds Renew</option>
          <option value="Services">Services</option>
        </select>

        <input
          type="number"
          placeholder="Opportunity Value"
          value={value}
          onChange={(e) => setValue(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        />

        <select
          value={status}
          onChange={(e) =>
            setStatus(
              Array.from(e.target.selectedOptions, (option) => option.value)
            )
          }
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
          <option value="" selected disabled>Opportunity Status</option>
          <option value="Quotation Done">Quotation Done</option>
          <option value="Demo Done">Demo Done</option>
          <option value="ROC Done">ROC Done</option>
          <option value="Progress Sub">Progress Sub</option>
          <option value="Won">Won</option>
          <option value="Lost">Lost</option>
        </select>

        <div className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2">
          <label>Closure Time:</label>
          <input
            type="date"
            value={closureTime}
            onChange={(e) => setClosureTime(e.target.value)}
          />
        </div>

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
