import React, { useContext, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import EditOpportunityModal from "./editLeaveModal";
import axios from "axios";
import API_BASE_URL from "../../config";
import { toast } from "react-toastify";
import DeleteConfirmationDialog from "./DeleteConfirmationDialog";
import { AuthContext } from "../../context/AuthContext";

const LeaveDetail = ({ product }) => {
  const [editModalOpen, setEditModalOpen] = useState(false); 
  const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false); 
  const [deleteItemId, setDeleteItemId] = useState(null);

  const { currentUser } = useContext(AuthContext);

  const handleEditClick = () => {
    setEditModalOpen(true); 
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
  
  const navigate =  useNavigate()

  const handleDeleteConfirmation = (itemId) => {
    axios
      .delete(`${API_BASE_URL}/api/Leave/deleteApplication`, { data: { id: itemId } })
      .then((response) => {
        console.log("Delete successful:", response.data);
        toast.success("Deleted Successfully");
        navigate("/Leave")
      })
      .catch((error) => {
        console.error("Error deleting:", error);
      });
  };

  // Function to handle closing the delete confirmation dialog
  const handleCloseDeleteConfirmation = () => {
    setDeleteItemId(null);
    setShowDeleteConfirmation(false);
  };

  const handleDeleteClick = (id) => {
    setDeleteItemId(id);
    setShowDeleteConfirmation(true);
  };

  const isApproved = status.toLowerCase() === "approved";
  const currentDate = new Date();
  const fromDateObj = new Date(fromDate);
  const isOneDayAfterFromDate = currentDate > new Date(fromDateObj.setDate(fromDateObj.getDate() + 1));

  const hideButtons = isApproved && isOneDayAfterFromDate && currentUser.role !== "admin";

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
          {!hideButtons  && (
            <>
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
              <button onClick={() => handleDeleteClick(id)}
                className="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 focus:outline-none"
                >Delete</button>
              <DeleteConfirmationDialog
                isOpen={showDeleteConfirmation}
                onClose={handleCloseDeleteConfirmation}
                onDelete={() => {
                  handleDeleteConfirmation(deleteItemId); // Call the delete confirmation function with the deleteItemId
                  handleCloseDeleteConfirmation(); // Close the dialog after deletion
                }}
              />
            </>
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
