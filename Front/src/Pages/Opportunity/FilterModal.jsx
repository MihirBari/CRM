import axios from "axios";
import React, { useEffect, useState } from "react";
import Modal from "react-modal";
import Select from "react-select";
import API_BASE_URL from "../../config";

Modal.setAppElement("#root");

const FilterModal = ({ isOpen, onClose, onApplyFilters, resetFilters }) => {
  const [customerEntities, setCustomerEntities] = useState([]);
  const [customerEntitiess, setCustomerEntitiess] = useState([]);
  const [type, setType] = useState([]);
  const [LicenseType, setLicenseType] = useState([]); // Initialize as an array
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
    const controller = new AbortController();
    const signal = controller.signal;
    const fetchCustomerEntities = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Contact/customerentity`,
          {
            signal: signal, // Pass the signal to the request
          }
        );
        setCustomerEntitiess(response.data);
      } catch (err) {
        if (axios.isCancel(err)) {
          console.log("Request canceled", err.message);
        } else {
          console.error("Error fetching orders:", err);
        }
      }
    };
    fetchCustomerEntities();
    return () => {
      controller.abort(); // Cancel the request if the component unmounts
    };
  }, []);

  const applyFilters = async () => {
    try {
      const response = await axios.get(
        `${API_BASE_URL}/api/Opportunity/showOpportunity`,
        {
          params: {
            customerEntities,
            type,
            LicenseType,
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
      onApplyFilters(response.data.products);
      localStorage.setItem(
        "OrderFilters",
        JSON.stringify({
          customerEntities,
          type,
          LicenseType,
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
        LicenseType: storedLicenseType,
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

      setCustomerEntities(storedCustomerEntities || []);
      setType(storedType || []);
      setLicenseType(storedLicenseType || []);
      setValue(storedValue || "");
      setStatus(storedStatus || []);
      setClosureTime(storedClosureTime || "");
      setLicenseFrom(storedLicenseFrom || "");
      setLicenseTo(storedLicenseTo || "");
      setDateFilterType(storedDateFilterType || "");
      setSelectedDate(
        storedSelectedDate || new Date().toISOString().split("T")[0]
      );
      setStartDate(storedStartDate || null);
      setEndDate(storedEndDate || null);

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
    setType([]);
    setLicenseType([]);
    setValue("");
    setStatus([]);
    setClosureTime("");
    setLicenseFrom("");
    setLicenseTo("");
    setDateFilterType("");
    setSelectedDate(new Date().toISOString().split("T")[0]);
    setStartDate(null);
    setEndDate(null);
    resetFilters();
  };

  const customerEntityOptions = customerEntitiess.map((entity) => ({
    value: entity.customer_entity,
    label: entity.customer_entity,
  }));

  const opportunityTypeOptions = [
    { value: "BigFix", label: "BigFix" },
    { value: "SolarWinds", label: "SolarWinds" },
    { value: "Services", label: "Services" },
    { value: "Tenable", label: "Tenable" },
    { value: "Armis", label: "Armis" },
  ];

  const opportunityStatusOptions = [
    { value: "Quotation Done", label: "Quotation Done" },
    { value: "Demo Done", label: "Demo Done" },
    { value: "POC Done", label: "POC Done" },
    { value: "Progress Sub", label: "Progress Sub" },
    { value: "Won", label: "Won" },
    { value: "Lost", label: "Lost" },
  ];

  const LicenseTypeOptions = [
    { value: "New", label: "New" },
    { value: "Renewal", label: "Renewal" },
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
          height: "50%",
          margin: "auto",
        },
      }}
    >
      <div className="filter-modal">
        <div className="flex flex-wrap">
          <Select
            isMulti
            options={customerEntityOptions}
            value={customerEntityOptions.filter((option) =>
              customerEntities.includes(option.value)
            )}
            onChange={(selectedOptions) =>
              setCustomerEntities(
                selectedOptions
                  ? selectedOptions.map((option) => option.value)
                  : []
              )
            }
            placeholder="Select Customer Entity"
            className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2"
          />

          <Select
            isMulti
            options={opportunityTypeOptions}
            value={opportunityTypeOptions.filter((option) =>
              type.includes(option.value)
            )}
            onChange={(selectedOptions) =>
              setType(
                selectedOptions
                  ? selectedOptions.map((option) => option.value)
                  : []
              )
            }
            placeholder="Select Opportunity Type"
            className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2"
          />

          <Select
            isMulti
            options={LicenseTypeOptions}
            value={LicenseTypeOptions.filter((option) =>
              LicenseType.includes(option.value)
            )}
            onChange={(selectedOptions) =>
              setLicenseType(
                selectedOptions
                  ? selectedOptions.map((option) => option.value)
                  : []
              )
            }
            placeholder="Select License Type"
            className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2"
          />

          <input
            type="number"
            placeholder="Opportunity Value"
            value={value}
            onChange={(e) => setValue(e.target.value)}
            className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2"
          />

          <Select
            isMulti
            options={opportunityStatusOptions}
            value={opportunityStatusOptions.filter((option) =>
              status.includes(option.value)
            )}
            onChange={(selectedOptions) =>
              setStatus(
                selectedOptions
                  ? selectedOptions.map((option) => option.value)
                  : []
              )
            }
            placeholder="Select Opportunity Status"
            className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2"
          />

          <div className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2">
            <label>Closure Time:</label>
            <input
              type="date"
              value={closureTime}
              onChange={(e) => setClosureTime(e.target.value)}
            />
          </div>

          <div className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2">
            <label>License From:</label>
            <input
              type="date"
              value={licenseFrom}
              onChange={(e) => setLicenseFrom(e.target.value)}
            />
          </div>

          <div className="p-2 w-full md:w-1/4 rounded border border-gray-300 focus:outline-none focus:border-blue-500 ml-2 m-2">
            <label>License To:</label>
            <input
              type="date"
              value={licenseTo}
              onChange={(e) => setLicenseTo(e.target.value)}
            />
          </div>
        </div>

        <div className="mt-2" >
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
      </div>
    </Modal>
  );
};

export default FilterModal;
