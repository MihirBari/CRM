import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { toast } from "react-toastify";
import API_BASE_URL from "../../config";
import axios from "axios";

import Modal from "react-modal";

const EditOpportunityModal = ({ isOpen, onClose }) => {
  const initialInputs = {
    customer_entity: "",
    name: "",
    description: "",
    type: "",
    License_type: "",
    value: "",
    closure_time: "",
    status: "",
    period: "",
    license_from: "",
    license_to: "",
  };

  const { id } = useParams();
  const [inputs, setInputs] = useState(initialInputs);
  const [nameOptions, setNameOptions] = useState([]);
  const [err, setError] = useState(null);

  useEffect(() => {
    const fetchOrder = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Opportunity/showOneOpportunity/${id}`
        );
        const orderData = response.data[0];
        console.log("Fetched Order Data:", orderData);

        // Adjust the timezone offset and convert to yyyy-MM-dd format
        const formatDate = (dateString) => {
          if (!dateString) return "";
          const date = new Date(dateString);
          const timezoneOffset = date.getTimezoneOffset() * 60000;
          const adjustedDate = new Date(date.getTime() - timezoneOffset);
          return adjustedDate.toISOString().split("T")[0];
        };

        setInputs({
          customer_entity: orderData.customer_entity,
          name: orderData.name,
          description: orderData.description,
          type: orderData.type,
          License_type: orderData.License_type,
          value: orderData.value,
          closure_time: formatDate(orderData.closure_time),
          status: orderData.status,
          period: orderData.period,
          license_from: formatDate(orderData.license_from),
          license_to: formatDate(orderData.license_to),
        });
      } catch (err) {
        console.error(err);
        setError(err.response);
        toast.error("Failed to fetch order details");
      }
    };

    fetchOrder();
  }, [id]);

  useEffect(() => {
    if (inputs.customer_entity) {
      fetchName(inputs.customer_entity);
    }
  }, [inputs.customer_entity]);

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setInputs((prev) => ({
      ...prev,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  const handleChangeFile = (e) => {
    const { name, files } = e.target;
    const file = files[0];
    const blob = new Blob([file]);
    setInputs((prev) => ({
      ...prev,
      [name]: blob,
    }));
  };

  const fetchName = async (customerEntity) => {
    try {
      const response = await axios.post(
        `${API_BASE_URL}/api/Opportunity/name`,
        { customer_entity: customerEntity }
      );
      setNameOptions(response.data);
      console.log(response.data);
    } catch (error) {
      console.error("Error fetching names:", error);
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const formData = new FormData();
      Object.keys(inputs).forEach((key) => {
        formData.append(key, inputs[key]);
      });

      await axios.put(
        `${API_BASE_URL}/api/Opportunity/editOpportunity/${id}`,
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
          },
        }
      );

      setInputs(initialInputs);
      toast.success("Opportunity updated successfully");

      onClose();
      window.location.reload();
    } catch (err) {
      console.error(err);
      setError(err.response);
      toast.error("Failed to update opportunity");
    }
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
          height: "70%",
          width: "30%",
          margin: "auto",
        },
      }}
      ariaHideApp={false}
    >
      <div className=" bg-gray-50 flex flex-col justify-center">
        <div className="sm:mx-auto sm:w-full sm:max-w-md">
          <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
            Edit Opportunity
          </h2>
        </div>
        <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
          <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
            <form className="space-y-6" onSubmit={handleSubmit}>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  {renderInput(
                    "customer_entity",
                    "Customer Entity",
                    "Enter Customer Entity"
                  )}
                </div>
                <div>{renderSelect("name", "Name", nameOptions)}</div>
                <div>
                  {renderInput(
                    "description",
                    "description",
                    "Enter description"
                  )}
                </div>
                <div>
                  {renderSelect("type", "Opportunity Type", [
                    { value: "BigFix", name: "BigFix" },
                    { value: "SolarWinds", name: "SolarWinds" },
                    { value: "Services", name: "Services" },
                    { value: "Tenable", name: "Tenable" },
                    { value: "Armis", name: "Armis" },
                  ])}
                </div>
                <div>
                  {renderSelect("License_type", "License Type", [
                    { value: "New", name: "New" },
                    { value: "Renewal", name: "Renewal" },
                  ])}
                </div>
                <div>{renderInput("value", "Value", "Enter value")}</div>
                <div>
                  {renderInput(
                    "closure_time",
                    "Closure Time",
                    "Closure Time",
                    "date"
                  )}
                </div>
                <div>{renderInput("period", "Comment", "Comment")}</div>
                <div>
                  {renderSelect("status", "Status", [
                    { value: "Quotation Done", name: "Quotation Done" },
                    { value: "Demo Done", name: "Demo Done" },
                    { value: "POC Done", name: "POC Done" },
                    { value: "Progress Sub", name: "Progress Sub" },
                    { value: "Won", name: "Won" },
                    { value: "Lost", name: "Lost" },
                  ])}
                </div>
                {inputs.status === "Won" && (
                  <>
                    <div>
                      {renderInput(
                        "license_from",
                        "License From",
                        "License From",
                        "date"
                      )}
                    </div>
                    <div>
                      {renderInput(
                        "license_to",
                        "License To",
                        "License To",
                        "date"
                      )}
                    </div>
                  </>
                )}
                <div>
                  {renderInput("pdf", "Upload PDF", "Upload PDF", "file")}
                </div>
              </div>
              <div className="flex  items-center mt-4">
                {renderButton("Update")}
              </div>
            </form>
          </div>
        </div>
      </div>
    </Modal>
  );

  function renderInput(name, label, placeholder, type = "text") {
    if (type === "file") {
      return (
        <>
          <label
            htmlFor={name}
            className="block text-sm font-medium text-gray-700"
          >
            {label}
          </label>
          <div className="mt-1">
            <input
              type={type}
              id={name}
              name={name}
              onChange={handleChangeFile}
              className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
            />
          </div>
        </>
      );
    } else {
      return (
        <>
          <label
            htmlFor={name}
            className="block text-sm font-medium text-gray-700"
          >
            {label}
          </label>
          <div className="mt-1">
            <input
              type={type}
              name={name}
              
              onChange={handleChange}
              placeholder={placeholder}
              value={inputs[name]}
              className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
            />
          </div>
        </>
      );
    }
  }

  function renderSelect(name, label, options) {
    return (
      <>
        <label
          htmlFor={name}
          className="block text-sm font-medium text-gray-700"
        >
          {label}
        </label>
        <div className="mt-1 relative">
          <select
            name={name}
            
            onChange={handleChange}
            value={inputs[name]}
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          >
            <option value="" label="Select an option" disabled />
            {options.map((option) => (
              <option key={option.value} value={option.value}>
                {option.name}
              </option>
            ))}
          </select>
        </div>
      </>
    );
  }

  function renderButton(label) {
    return (
      <button
        type={label === "Update" ? "submit" : "button"}
        className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
      >
        {label}
      </button>
    );
  }
};

export default EditOpportunityModal;
