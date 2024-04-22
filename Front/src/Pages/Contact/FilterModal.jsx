import React, { useEffect, useState } from "react";
import Modal from "react-modal";
import axios from "axios";
import API_BASE_URL from "../../config";

const FilterModal = ({ isOpen, onClose, onApplyFilters, resetFilters }) => {
  const [city, setCity] = useState("");
  const [citys, setCitys] = useState("");
  const [customerentity, setCustomerEntity] = useState("");
  const [shouldApplyFilters, setShouldApplyFilters] = useState(false);


  useEffect(() => {
    const fetchCity = async () => {
      try {
        const response = await axios.get(`${API_BASE_URL}/api/contact/city`);
        setCitys(response.data);
        console.log(response.data);
      } catch (error) {
        console.error("Error fetching product types:", error.message);
      }
    };

    fetchCity();
  }, []);

  const applyFilters = async () => {
    try {
      const response = await axios.get(
        `${API_BASE_URL}/api/contact/showContact`,
        {
          params: {
            city,
            
            customerentity,
            
          },
        }
      );

      onApplyFilters(response.data.products);
      // Update localStorage only if filters are applied successfully
      localStorage.setItem(
        "expenseFilters",
        JSON.stringify({
          city,
          
          customerentity,
          
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
        city: storedCity,
        
        customerEntity: storedCustomerEntity,
      } = JSON.parse(storedFilters);

      // Set filter values to state
      setCity(storedCity);

      setCustomerEntity(storedCustomerEntity);
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
    setCity("");
    setCustomerEntity("");
   
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
 
<input
          type="text"
          placeholder="Name of Customer Entity"
          value={customerentity}
          onChange={(e) => setCustomerEntity(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        />

        <select
          value={city}
          onChange={(e) => setCity(e.target.value)}
          className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2"
        >
          <option value="">Select City</option>
          {citys &&
            citys.map((data, index) => (
              <option key={index} value={data.city}>
                {data.city}
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
