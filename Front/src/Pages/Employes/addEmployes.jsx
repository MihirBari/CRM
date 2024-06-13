import React, { useState } from "react";
import { toast } from "react-toastify";
import API_BASE_URL from "../../config";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const AddEmployes = () => {
  const initialInputs = {
    contacts: [], // Initialize contacts array for multiple contacts
  };

  const navigate = useNavigate();
  const [inputs, setInputs] = useState(initialInputs);
  const [err, setError] = useState(null);

  const handleChange = (e, index) => {
    const { name, value } = e.target;
    const newContacts = [...inputs.contacts];
    if (!newContacts[index]) {
      newContacts[index] = {};
    }
    newContacts[index][name] = value;
    setInputs((prev) => ({
      ...prev,
      contacts: newContacts,
    }));
  };

  const addContact = () => {
    setInputs((prev) => ({
      ...prev,
      contacts: [...prev.contacts, { name: "", surname: "" }], // Add default values for a new contact
    }));
  };

  const removeContact = (index) => {
    const newContacts = [...inputs.contacts];
    newContacts.splice(index, 1);
    setInputs((prev) => ({
      ...prev,
      contacts: newContacts,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      // Send data to backend
      await axios.post(`${API_BASE_URL}/api/Employes/addEmployes`, inputs);
      setInputs(initialInputs);
      toast.success("Contacts created successfully");
      navigate("/Employes");
    } catch (err) {
      console.error(err);
      setError(err.response);
      toast.error("Failed to create Contacts");
    }
  };

  const handleClose = () => {
    setInputs(initialInputs);
    navigate("/Employes");
  };

  return (
    <div>
      <div className="sm:mx-auto sm:w-full sm:max-w-md">
        <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Add Employees
        </h2>
      </div>
      <div className="mt-8 sm:w-full">
        <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
          <form className="space-y-6" onSubmit={handleSubmit}>
            <div className="grid grid-cols-2 gap-4">
              {inputs.contacts.map((contact, index) => (
                <div key={index}>
                  <label className="block text-sm font-medium text-gray-700">
                    Contact {index + 1}
                    {index > 0 && (
                      <button
                        type="button"
                        onClick={() => removeContact(index)}
                        className="ml-2 text-sm font-medium text-red-600 hover:text-red-500 focus:outline-none focus:underline"
                      >
                        Remove
                      </button>
                    )}
                  </label>
                  <div className="grid grid-rows-3 gap-4">
                    <div>
                      <input
                        type="text"
                        name="name"
                        required
                        onChange={(e) => handleChange(e, index)}
                        placeholder="Enter Name Of Employee"
                        value={contact.name}
                        className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm h-[40px]"
                      />
                    </div>
                    <div>
                      <input
                        type="text"
                        name="surname"
                        required
                        onChange={(e) => handleChange(e, index)}
                        placeholder="Enter Surname Of Employee"
                        value={contact.surname}
                        className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm h-[40px]"
                      />
                    </div>
                  </div>
                </div>
              ))}
              <button
                type="button"
                onClick={addContact}
                className="text-sm font-medium text-blue-600 hover:text-blue-500 focus:outline-none focus:underline"
              >
                + Add Contact
              </button>
            </div>

            <div className="flex justify-between items-center mt-4">
              <button
                type="submit"
                className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
              >
                Create
              </button>

              <button
                type="button"
                onClick={handleClose}
                className="group relative w-[100px] h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
              >
                Back
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default AddEmployes;
