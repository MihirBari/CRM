import React, { useEffect, useState } from "react";
import { toast } from "react-toastify";
import API_BASE_URL from "../../config";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";

const EditEmployes = () => {
  const initialInputs = {
    name: "",
    surname:""
  };
const {id} = useParams()
  const [inputs, setInputs] = useState(initialInputs);
  const [err, setError] = useState(null);

    // Inside EditContact component
const navigate = useNavigate()
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
        const response = await axios.get(`${API_BASE_URL}/api/Employes/viewEmployes/${id}`);
        console.log(id)
        const sellerData = response.data[0];
     if (sellerData) {
          setInputs({
            name: sellerData.name || '',
            surname: sellerData.surname || ''
          });
        } else {
          console.error("Contact data is undefined");
          setError("Contact data is undefined");
          toast.error("Failed to fetch Contact details");
        }
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
      await axios.put(`${API_BASE_URL}/api/Employes/editEmployes/${id}`, inputs);
      setInputs(initialInputs);
      toast.success("Updated successfully");
      navigate("/Employes")
    } catch (err) {
      console.error(err);
      toast.error("Failed to update seller");
    }
  };

  const handleClose = async() => {
    navigate("/Employes")
  }

  return (
 
    <div>
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Edit Contact
        </h2>
      </div>
      <div className="mt-8 sm:w-full">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
         
          <form className="space-y-6">
            <div className="grid grid-cols-2 gap-4">
              <div> {renderInput("name", "Name Of Customer", "Name Of Customer")}</div>
              <div> {renderInput("surname", "Name Of Customer", "Name Of Customer")}</div>
            </div>
            <div className="flex justify-between items-center mt-4">
              <button
                onClick={handleSubmit}
                className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
              >
                Update
              </button>
                <button 
                onClick={handleClose}
                className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700">
                  Back
                </button>
              
            </div>
          </form>

        </div>
      </div>
    </div>
 
  );

  function renderInput(name, label, placeholder, type = "text") {
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
            className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
          />
        </div>
      </div>
    );
  }

 
};

export default EditEmployes;
