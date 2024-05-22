import React, { useEffect, useState } from "react";
import Modal from "react-modal";
import axios from "axios";
import API_BASE_URL from "../../config";

const FilterModal = ({ isOpen, onClose, onApplyFilters, resetFilters }) => {
  
  const [customerEntity, setCustomerEntity] = useState("");
  const [customerEntitys, setCustomerEntitys] = useState([]);
  const [status, setStatus] = useState([]);

  const [shouldApplyFilters, setShouldApplyFilters] = useState(false);

  useEffect(() => {
    const fetchCustomerEntity = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/opportunity/customerEntityAlert`
        );
        setCustomerEntitys(response.data);
        console.log("Entity:",response.data);
      } catch (error) {
        console.error("Error fetching product types:", error.message);
      }
    };

    fetchCustomerEntity();
  }, []);


  const applyFilters = async () => {
    try {
      const response = await axios.get(`${API_BASE_URL}/api/Opportunity/sendAlert`, {
        params: {
          customerEntity,
          status,
        },
      });
  
      onApplyFilters(response.data.products);
      
      // Update localStorage only if filters are applied successfully
      localStorage.setItem(
        "expenseFilters",
        JSON.stringify({
          customerEntity,
          status,
        })
      );
    } catch (error) {
      console.error("Error applying filters:", error.message);
    }
  };
  
  const retrieveAndSetFilters = async () => {
    // Retrieve filter values from localStorage
    const storedFilters = localStorage.getItem("expenseFilters");
    if (storedFilters) {
      const {
        
        customerEntity: storedCustomerEntity,
        status: storedStatus
      } = JSON.parse(storedFilters);

      // Set filter values to state
     
      setCustomerEntity(storedCustomerEntity);
      setStatus(storedStatus);
      setShouldApplyFilters(true);
    }
  };

  useEffect(() => {
    // Retrieve and set filters from localStorage when the component mounts
    retrieveAndSetFilters();
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
   
    setCustomerEntity("");
    setStatus("");
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
          height: "50%", // Set the height here, e.g., 50%
          margin: "auto", // Center the modal horizontally
        },
      }}
    >
      <div className="filter-modal">
      <select
          value={status}
          onChange={(e) => setStatus(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
          <option value="" disabled>Opportunity Type</option>
          <option value="BigFix New">BigFix New</option>
          <option value="BigFix Renew">BigFix Renew</option>
          <option value="SolarWinds New">SolarWinds New</option>
          <option value="SolarWinds Renew">SolarWinds Renew</option>
          <option value="Services">Services</option>
        </select>

        <select
  value={customerEntity}
  onChange={(e) => setCustomerEntity(e.target.value)}
  className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
>
  <option value="">Select Entity</option>
  {customerEntitys &&
    customerEntitys.map((data, index) => (
      <option key={index} value={data.alert_entity}>
        {data.alert_entity}
      </option>
    ))}
</select>

        {/* Apply and Cancel buttons */}
        <button
          onClick={() => {
            applyFilters();
            onClose();
          }}
          className="bg-blue-500 text-white px-4 py-2 rounded ml-2"
          style={{ marginLeft: "10px" }}
        >
          Apply Filters
        </button>
        <button
          onClick={handleResetFilters}
          className="bg-red-500 text-white px-4 py-2 rounded ml-2"
          style={{ marginLeft: "10px" }}
        >
          Clear Filters
        </button>
        <button
          onClick={onClose}
          className="bg-blue-500 text-white px-4 py-2 rounded ml-2"
          style={{ marginLeft: "10px" }}
        >
          Cancel
        </button>
      </div>
    </Modal>
  );
};

export default FilterModal;