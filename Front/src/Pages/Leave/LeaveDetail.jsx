import React, { useState } from "react";
import { Link } from "react-router-dom";
import EditOpportunityModal from "./editLeaveModal";

const LeaveDetail = ({ product }) => {
  const [editModalOpen, setEditModalOpen] = useState(false); // State to manage edit modal open/close

  const handleEditClick = () => {
    console.log("Clicked");
    setEditModalOpen(true); // Open the modal when Edit button is clicked
  };

  const formatDate = (dateString) => {
    if (!dateString) return ""; // Handle cases where dateString is null or undefined

    const date = new Date(dateString);
    const day = String(date.getDate()).padStart(2, "0");
    const month = String(date.getMonth() + 1).padStart(2, "0"); // Months are zero-based
    const year = date.getFullYear();

    return `${day}/${month}/${year}`;
  };

  const {
    id,
    name,
    surname,
    status,
    fromDate,
    toDate,
    duration,
    days,
    description,
    history,
  } = product;

  return (
    <div className="flex flex-col justify-center items-center mt-8">
      <div className="max-w-md w-full bg-white p-6 rounded-lg shadow-md">
        <p className="text-gray-600 mb-2">
          {" "}
          Name : {name} {surname}
        </p>
        <p className="text-gray-600 mb-2">Status : {status}</p>
        <p className="text-gray-600 mb-2">From Date : {formatDate(fromDate)}</p>
        <p className="text-gray-600 mb-2">To Date : {formatDate(toDate)}</p>
        <p className="text-gray-600 mb-2">Duration Type : {duration}</p>
        <p className="text-gray-600 mb-2">No Of Days : {days}</p>
        <p className="text-gray-600 mb-2">Description : {description}</p>
        <p className="text-gray-600 mb-2">Comments : {history}</p>

        <div className="flex items-center justify-around mt-4">
          <button
            onClick={handleEditClick}
            className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 focus:outline-none"
          >
            Edit
          </button>
          {editModalOpen && (
            <EditOpportunityModal
              isOpen={editModalOpen}
              onClose={() => setEditModalOpen(false)}
              id={id}
            />
          )}
          <Link to="/Leave">
            <button className="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600 focus:outline-none">
              Back
            </button>
          </Link>
        </div>
      </div>
    </div>
  );
};

export default LeaveDetail;
