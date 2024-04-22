import React, { useContext, useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import { toast } from "react-toastify";
import API_BASE_URL from "../../config";
import axios from "axios";
import { AuthContext } from "../../context/AuthContext";

const EditSeller = () => {
  const initialInputs = {
    name: "",
    status: "",
    fromDate: "",
    toDate: "",
    type: "",
    duration: "",
    days: "",
    description: "",
    history: "",
  };

  const { id } = useParams();
  const [inputs, setInputs] = useState(initialInputs);
  const [err, setError] = useState(null);
  const navigate = useNavigate();
  const { currentUser } = useContext(AuthContext); // Assuming you have currentUser from context

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    setInputs((prev) => ({
      ...prev,
      [name]: type === "checkbox" ? checked : value,
    }));
  };

  useEffect(() => {
    const fetchSeller = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Leave/showOneApplicationLeave/${id}`
        );
        const sellerData = response.data[0];
        console.log("Seller Data:", sellerData);

        const formattedDate = new Date(sellerData.fromDate).toLocaleDateString(
          "en-CA",
          {
            year: "numeric",
            month: "2-digit",
            day: "2-digit",
          }
        );

        const formattedDate1 = new Date(sellerData.toDate).toLocaleDateString(
          "en-CA",
          {
            year: "numeric",
            month: "2-digit",
            day: "2-digit",
          }
        );

        setInputs({
          name: sellerData.name,
          status: sellerData.status,
          fromDate: formattedDate,
          toDate: formattedDate1,
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
      navigate("/Leave");
    } catch (err) {
      console.error(err);
      toast.error("Failed to update");
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Edit Seller
        </h2>
      </div>
      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
          {inputs && Object.keys(inputs).length !== 0 ? (
            <form className="space-y-6">
              <div className="grid grid-cols-2 gap-4">
                {renderInput(
                  "name",
                  "Name",
                  "Enter Name",
                  "text",
                  currentUser.role === "user"
                )}
                {renderInput(
                  "fromDate",
                  "From",
                  "Enter Date",
                  "text",
                  false,
                  currentUser.role === "user"
                )}
                {renderInput(
                  "toDate",
                  "To",
                  "Enter Date",
                  "text",
                  false,
                  currentUser.role === "user"
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
                  "text",
                  false,
                  currentUser.role === "user"
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
                  false,
                  "text",
                  currentUser.role === "user"
                )}
                </div>
                {renderInput(
                  "days",
                  "No of Days",
                  "Enter No Of Days",
                  "text",
                  false,
                  currentUser.role === "user"
                )}
                {renderTextArea(
                  "description",
                  "Description / Summary",
                  "Enter Summary",
                  "text",
                  false,
                  currentUser.role === "user"
                )}
                <div>
                  {currentUser.role === "admin" &&
                    renderSelect("status", "Status", [
                      { value: "", label: "Select an option" },
                      { value: "request", label: "request" },
                      { value: "approved", label: "approved" },
                      { value: "rejected", label: "rejected" },
                    ])}
                </div>
                {renderTextArea(
                  "history",
                  "Comments / History",
                  "Enter Comment",
                  "text",
                  true
                )}
              </div>

              <div className="flex justify-between items-center mt-4">
                <button
                  onClick={handleSubmit}
                  className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
                >
                  Update
                </button>
                <Link to="/Leave">
                  <button className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700">
                    Back
                  </button>
                </Link>
              </div>
            </form>
          ) : (
            <p>Loading...</p>
          )}
        </div>
      </div>
    </div>
  );

  function renderInput(
    name,
    label,
    placeholder,
    type = "text",
    readOnly = false
  ) {
    return (
      <div key={name}>
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
            required
            onChange={handleChange}
            placeholder={placeholder}
            value={inputs[name]}
            readOnly={readOnly} // Add readOnly attribute
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          />
        </div>
      </div>
    );
  }

  function renderTextArea(
    name,
    label,
    placeholder,
    type = "text",
    readOnly = false
  ) {
    return (
      <div key={name}>
        <label
          htmlFor={name}
          className="block text-sm font-medium text-gray-700"
        >
          {label}
        </label>
        <div className="mt-1">
          <textarea
            type={type}
            name={name}
            required
            onChange={handleChange}
            placeholder={placeholder}
            value={inputs[name]}
            readOnly={readOnly} // Add readOnly attribute
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          />
        </div>
      </div>
    );
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
            required
            onChange={handleChange}
            value={inputs[name]}
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          >
            {options.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        </div>
      </>
    );
  }
};

export default EditSeller;
