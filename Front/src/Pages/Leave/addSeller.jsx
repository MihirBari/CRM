import React, { useContext, useState } from "react";
import { Link, useNavigate } from "react-router-dom";

import { toast } from "react-toastify";
import API_BASE_URL from "../../config";
import axios from "axios";
import { AuthContext } from "../../context/AuthContext";

const AddSeller = () => {

  const { currentUser } = useContext(AuthContext);
  const initialInputs = {
    name:  `${currentUser.name}` ,
    surname: `${currentUser.surname}`,
    status: "request",
    fromDate: "",
    toDate: "",
    type: "",
    duration: "",
    days: "",
    description: "",
  
  };
console.log(currentUser.name + currentUser.surname)
  const [inputs, setInputs] = useState(initialInputs);
  const [err, setError] = useState(null);
  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    let newInputs = { ...inputs, [name]: type === "checkbox" ? checked : value };
  
    // Calculate number of days if both fromDate and toDate are available
    if (newInputs.fromDate && newInputs.toDate) {
      const fromDate = new Date(newInputs.fromDate);
      const toDate = new Date(newInputs.toDate);
      const timeDifference = toDate.getTime() - fromDate.getTime() + 1;
      const daysDifference = Math.ceil(timeDifference / (1000 * 3600 * 24));
      newInputs = { ...newInputs, days: daysDifference };
      console.log(daysDifference)
    }
  
    setInputs(newInputs);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const requiredFields = [];

    for (const field of requiredFields) {
      if (!inputs[field]) {
        toast.error(`Please fill in the ${field.replace(/_/g, ' ')} field.`);
        return;
      }
    }

    try {
      // Send data to backend
      await axios.post(`${API_BASE_URL}/api/Leave/addApplicationLeave`, inputs);
      setInputs(initialInputs);
      toast.success("Leave Applied successfully");

      navigate('/Leave');
    } catch (err) {
      console.error(err);
      setError(err.response);
      toast.error("Failed to apply for Leave");
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Ask For Leave
        </h2>
      </div>
      <div className="mt-8  sm:w-full">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
        <form className="space-y-6">
        <div className="grid grid-cols-3 gap-4">
            <div>
              <label
                htmlFor="name"
                className="block text-sm font-medium text-gray-700"
              >
                Name
              </label>
              <div className="mt-1">
                <input
                  type="name"
                  name="name"
                  value={inputs.name}
                  required
                  readOnly
                  onChange={handleChange}
                  placeholder="Enter Your Name"
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                />
              </div>
            </div>

            <div>
              <label
                htmlFor="surname"
                className="block text-sm font-medium text-gray-700"
              >
              Surname Name
              </label>
              <div className="mt-1">
                <input
                  type="text"
                  name="surname"
                  value={inputs.surname}
                  required
                  readOnly
                  onChange={handleChange}
                  placeholder="Enter Your Name"
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                />
              </div>
            </div>

            <div>
              <label
                htmlFor="fromDate"
                className="block text-sm font-medium text-gray-700"
              >
               From Date
              </label>
              <div className="mt-1">
                <input
                  type="Date"
                  name="fromDate"
                  required
                  onChange={handleChange}
                  placeholder="Enter your E-mail"
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                />
              </div>
            </div>

            <div>
              <label
                htmlFor="toDate"
                className="block text-sm font-medium text-gray-700"
              >
               To Date
              </label>
              <div className="mt-1">
                <input
                  type="Date"
                  name="toDate"
                  required
                  onChange={handleChange}
                  placeholder="Enter your E-mail"
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                />
              </div>
            </div>

            <div>
                <label
                  htmlFor="type"
                  className="block text-sm font-medium text-gray-700"
                >
                  Paid Status
                </label>
                <div className="mt-1 relative">
                  <select
                    name="type"
                    required
                    onChange={handleChange}
                    className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                  >
                    <option value=" " disabled selected>Select Option</option>
                    <option value="paid leave" >
                      paid leave
                    </option>
                    <option value="sick leave">sick leave</option>
                    <option value="casual leave" >
                    casual leave
                    </option>
                    <option value="other leave" >
                    other leave
                    </option>
                  </select>
                </div>
              </div>


            <div>
              <label
                htmlFor="duration"
                className="block text-sm font-medium text-gray-700"
              >
                Leave Duration
              </label>
              <div className="mt-1 relative">
              <select
                    name="duration"
                    required
                    onChange={handleChange}
                    className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                  >
                    <option value=" " disabled selected>Select Option</option>
                    <option value="Full Day" >
                      Full day
                    </option>
                    <option value="Half Day">Half Day</option>
                    <option value="Early leave" >
                    Early leave
                    </option>
                  </select>
              </div>
            </div>

            <div>
                <label
                  htmlFor="days"
                  className="block text-sm font-medium text-gray-700"
                >
                  No Of Days
                </label>
                <div className="mt-1 relative">
                  <input
                    type="number"
                    name="days"
                    required
                    value={inputs.days}
                    readOnly
                    className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                  />
                </div>
              </div>

            <div>
              <label
                htmlFor="description"
                className="block text-sm font-medium text-gray-700"
              >
              Description / Summary
              </label>
              <div className="mt-1 relative">
                <textarea
                  type="text"
                  name="description"
                  autoComplete="current-password"
                  required
                  onChange={handleChange}
                  placeholder="Description / Summary"
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                />
              </div>        
            </div>
            
              {/* <div>
              <label
                htmlFor="history"
                className="block text-sm font-medium text-gray-700"
              >
               Comments / History
              </label>
              <div className="mt-1 relative">
                <textarea
                  type="text"
                  name="history"
                  required
                  onChange={handleChange}
                  placeholder="Comments / History"
                  className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                />
              </div>
              </div> */}

            </div>
            <div className="flex justify-between items-center mt-4">
              <button
                onClick={handleSubmit}
                className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
              >
                Create
              </button>
              <Link to="/Leave">
                <button className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700">
                  Back
                </button>
              </Link>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default AddSeller;