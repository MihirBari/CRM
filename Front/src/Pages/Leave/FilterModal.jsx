import axios from "axios";
import React, { useEffect, useState } from "react";
import Modal from "react-modal";
import API_BASE_URL from "../../config";
import Select from "react-select";

Modal.setAppElement("#root");
const FilterModal = ({
  isOpen,
  onClose,
  onApplyFilters,
  users,
  resetFilters,
}) => {
  const [status, setStatus] = useState("");
 
  const [dateFilterType, setDateFilterType] = useState("");
  const [selectedDate, setSelectedDate] = useState(
    new Date().toISOString().split("T")[0]
  ); // Today's date
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [shouldApplyFilters, setShouldApplyFilters] = useState(false);

  const applyFilters = async () => {
    try {
      const response = await axios.get(
        `${API_BASE_URL}/api/Leave/showApplicationLeave`,
        {
          params: {
            status,
            
            dateFilterType,
            selectedDate: dateFilterType !== "between" ? selectedDate : null,
            startDate: dateFilterType === "between" ? startDate : null,
            endDate: dateFilterType === "between" ? endDate : null,
          },
        }
      );
      onApplyFilters(response.data.dealers);
      localStorage.setItem(
        "SellerFilters",
        JSON.stringify({
          status,
          
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
    // Retrieve filter values from localStorage
    const storedFilters = localStorage.getItem("SellerFilters");
    if (storedFilters) {
      const {
        status: storedStatus,
        dateFilterType: storedDateFilterType,
        selectedDate: storedSelectedDate,
        startDate: storedStartDate,
        endDate: storedEndDate,
      } = JSON.parse(storedFilters);

      // Set filter values to state
      setStatus(storedStatus);
      
      setDateFilterType(storedDateFilterType);
      setSelectedDate(storedSelectedDate);
      setStartDate(storedStartDate);
      setEndDate(storedEndDate);

      // Apply retrieved filters
      setShouldApplyFilters(true);
    }
  }, []);

  useEffect(() => {
    // Apply filters when the flag is set to true
    if (shouldApplyFilters) {
      applyFilters();
      // Reset the flag to false after applying filters
      setShouldApplyFilters(false);
    }
  }, [shouldApplyFilters]);

  const handleResetFilters = () => {
    setStatus("");
   
    setDateFilterType("");
    setSelectedDate(new Date().toISOString().split("T")[0]);
    setStartDate(null);
    setEndDate(null);
    resetFilters();
  };

  const statusOptions = [
    { value: "request", label: "Request" },
    { value: "approved", label: "Approved" },
    { value: "rejected", label: "Rejected" },
  ];

  
  return (
    <Modal
      isOpen={isOpen}
      onRequestClose={onClose}
      style={{
        overlay: {
          zIndex: 9999,
        },
        content: {
          height: "50%", // Set the height here, e.g., 50%
          margin: "auto", // Center the modal horizontally
        },
      }}
    >
      <div className="flex flex-wrap">
        <Select
          isMulti
          options={statusOptions}
          value={statusOptions.filter((option) =>
            status.includes(option.value)
          )}
          onChange={(selectedOptions) =>
            setStatus(
              selectedOptions
                ? selectedOptions.map((option) => option.value)
                : []
            )
          }
          placeholder="Select Status Type"
          className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2"
        />

        

        <select
          value={dateFilterType}
          onChange={(e) => setDateFilterType(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
          <option value="">Select Date Filter</option>
          <option value="equal">Equal to</option>
          <option value="before">Before</option>
          <option value="after">After</option>
          <option value="between">Between</option>
        </select>

        {dateFilterType &&
          (dateFilterType === "equal" ||
            dateFilterType === "before" ||
            dateFilterType === "after") && (
            <input
              type="date"
              value={selectedDate}
              onChange={(e) => setSelectedDate(e.target.value)}
              className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
            />
          )}

        {dateFilterType === "between" && (
          <div>
            <input
              type="date"
              value={startDate}
              onChange={(e) => setStartDate(e.target.value)}
              className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
            />
            <input
              type="date"
              value={endDate}
              onChange={(e) => setEndDate(e.target.value)}
              className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
            />
          </div>
        )}

        {/* Apply and Cancel buttons */}
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
