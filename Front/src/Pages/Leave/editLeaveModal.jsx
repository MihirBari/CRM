import React, { useState, useEffect, useContext } from "react";
import { useParams } from "react-router-dom";
import { toast } from "react-toastify";
import API_BASE_URL from "../../config";
import axios from "axios";
import { AuthContext } from "../../context/AuthContext";
import Modal from "react-modal";
Modal.setAppElement("#root");
export const EditLeaveModal = ({ isOpen, onClose }) => {
  const initialInputs = {
    name: "",
    surname: "",
    status: "",
    fromDate: "",
    toDate: "",
    type: "",
    duration: "",
    days: 0, // Initialize days as 0
    description: "",
    history: "",
  };

  const { id } = useParams();
  const [inputs, setInputs] = useState(initialInputs);
  const [err, setError] = useState(null);
  const { currentUser } = useContext(AuthContext); // Assuming you have currentUser from context

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setInputs((prev) => ({
      ...prev,
      [name]: type === "checkbox" ? checked : value,
    }));

    // Calculate days difference if both fromDate and toDate are set
    if (name === "fromDate" || name === "toDate") {
      const fromDate = name === "fromDate" ? value : inputs.fromDate;
      const toDate = name === "toDate" ? value : inputs.toDate;
      if (fromDate && toDate) {
        const from = new Date(fromDate);
        const to = new Date(toDate);
        const timeDifference = to.getTime() - from.getTime();
        const daysDifference = Math.ceil(timeDifference / (1000 * 3600 * 24)) + 1; // Adding 1 to include both start and end dates
        setInputs((prev) => ({
          ...prev,
          days: daysDifference
        }));
      } else {
        setInputs((prev) => ({
          ...prev,
          days: 0
        }));
      }
    }
  };

  useEffect(() => {
    const fetchSeller = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Leave/showOneApplicationLeave/${id}`
        );
        const sellerData = response.data[0];
        console.log("Seller Data:", sellerData);

        const formattedFromDate = new Date(sellerData.fromDate)
          .toISOString()
          .split("T")[0];

        const formattedToDate = new Date(sellerData.toDate)
          .toISOString()
          .split("T")[0];

        setInputs({
          name: sellerData.name,
          surname: sellerData.surname,
          status: sellerData.status,
          fromDate: formattedFromDate,
          toDate: formattedToDate,
          type: sellerData.type,
          duration: sellerData.duration,
          days: sellerData.days,
          description: sellerData.description,
          history: sellerData.history,
        });
      } catch (err) {
        console.error(err);
        setError(err.response);
        toast.error("Failed to fetch seller details");
      }
    };

    // Fetch data when the component mounts
    fetchSeller();
  }, [id]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.put(
        `${API_BASE_URL}/api/Leave/editApplicationAdmin/${id}`,
        inputs
      );
      setInputs(initialInputs);
      toast.success("Updated successfully");
      onClose()
    } catch (err) {
      console.error(err);
      toast.error("Failed to update");
    }
  };
  const renderInput = (name, label, placeholder, type = "text", isDisabled = false) => {
    const isEditableByUser = currentUser.role === "user" || currentUser.role === "moderator";
    const isEditable = isEditableByUser && !isDisabled;

    return (
      <div key={name}>
        <label htmlFor={name} className="block text-sm font-medium text-gray-700">
          {label}
        </label>
        <div className="mt-1">
          <input
            type={type}
            name={name}
            required
            onChange={handleChange}
            placeholder={placeholder}
            value={inputs[name]}
            readOnly={!isEditable}
            disabled={!isEditable}
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          />
        </div>
      </div>
    );
  };

  const renderTextArea = (name, label, placeholder, type = "text", isDisabled = false) => {
    const isEditableByUser = currentUser.role === "user" || currentUser.role === "moderator";
    const isEditable = isEditableByUser && !isDisabled;

    return (
      <div key={name}>
        <label htmlFor={name} className="block text-sm font-medium text-gray-700">
          {label}
        </label>
        <div className="mt-1">
          <textarea
            name={name}
            required
            onChange={handleChange}
            placeholder={placeholder}
            value={inputs[name]}
            readOnly={!isEditable}
            disabled={!isEditable}
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          />
        </div>
      </div>
    );
  };

  const renderSelect = (name, label, options, isDisabled = false) => {
    const isEditableByUser = currentUser.role === "user" || currentUser.role === "moderator";
    const isEditable = isEditableByUser && !isDisabled;

    return (
      <div key={name}>
        <label htmlFor={name} className="block text-sm font-medium text-gray-700">
          {label}
        </label>
        <div className="mt-1 relative">
          <select
            name={name}
            required
            onChange={handleChange}
            value={inputs[name]}
            disabled={!isEditable}
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          >
            {options.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        </div>
      </div>
    );
  };

  const renderTextAreaAdmin = (name, label, placeholder, type = "text", isDisabled = false) => {
    const isEditableByUser = currentUser.role === "admin";
    const isEditable = isEditableByUser && !isDisabled;

    return (
      <div key={name}>
        <label htmlFor={name} className="block text-sm font-medium text-gray-700">
          {label}
        </label>
        <div className="mt-1">
          <textarea
            name={name}
            required
            onChange={handleChange}
            placeholder={placeholder}
            value={inputs[name]}
            readOnly={!isEditable}
            disabled={!isEditable}
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          />
        </div>
      </div>
    );
  };

  const renderSelectAdmin = (name, label, options, isDisabled = false) => {
    const isEditableByUser = currentUser.role === "admin";
    const isEditable = isEditableByUser && !isDisabled;

    return (
      <div key={name}>
        <label htmlFor={name} className="block text-sm font-medium text-gray-700">
          {label}
        </label>
        <div className="mt-1 relative">
          <select
            name={name}
            required
            onChange={handleChange}
            value={inputs[name]}
            disabled={!isEditable}
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          >
            {options.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        </div>
      </div>
    );
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
          width: "90%",
          margin: "auto",
        },
      }}
      ariaHideApp={false}
    >
   <div className="flex flex-col justify-center">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 className="text-center text-3xl font-extrabold text-gray-900">
          Edit Leave Application
        </h2>
      </div>
      <div className=" sm:w-full">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
          {inputs && Object.keys(inputs).length !== 0 ? (
            <form className="space-y-6" onSubmit={handleSubmit}>
              <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
                {renderInput(
                  "name",
                  "Name",
                  "Enter Name",
                  "text",
                  true
                )}
                {renderInput(
                  "surname",
                  "Surname",
                  "Enter Surname",
                  "text",
                  true
                )}
                {renderInput(
                  "fromDate",
                  "From",
                  "Enter Date",
                  "date",
                  false
                )}
                {renderInput(
                  "toDate",
                  "To",
                  "Enter Date",
                  "date",
                  false
                )}
                <div>
                  {renderSelect(
                    "type",
                    "Type",
                    [
                      { value: "", label: "Select an option" },
                      { value: "paid leave", label: "paid leave" },
                      { value: "sick leave", label: "sick leave" },
                      { value: "casual leave", label: "casual leave" },
                      { value: "other leave", label: "other leave" },
                    ],
                    false
                  )}
                </div>
                <div>
                  {renderSelect(
                    "duration",
                    "Duration Of leave",
                    [
                      { value: "", label: "Select an option" },
                      { value: "Full Day", label: "Full Day" },
                      { value: "Half Day", label: "Half Day" },
                      { value: "Early leave", label: "Early leave" },
                    ],
                    false
                  )}
                </div>
                {renderInput(
                  "days",
                  "No of Days",
                  "Enter No Of Days",
                  "text",
                  true
                )}
                {renderTextArea(
                  "description",
                  "Description / Summary",
                  "Enter Summary",
                  "text",
                  false
                )}
                {currentUser.role === "admin" && (
                  <>
                    <div>
                      {renderSelectAdmin(
                        "status",
                        "Status",
                        [
                          { value: "", label: "Select an option" },
                          { value: "request", label: "request" },
                          { value: "approved", label: "approved" },
                          { value: "rejected", label: "rejected" },
                        ],
                        false
                      )}
                    </div>
                    <div>
                      {renderTextAreaAdmin(
                        "history",
                        "Comments / History",
                        "Enter Comment",
                        "text",
                        false
                      )}
                    </div>
                  </>
                )}
              </div>

              <div className="flex justify-between items-center mt-4">
                <button
                  type="submit"
                  className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
                >
                  Update
                </button>
              </div>
            </form>
          ) : (
            <p>Loading...</p>
          )}
        </div>
      </div>
    </div>
    </Modal>
  );

  
};

export default EditLeaveModal;