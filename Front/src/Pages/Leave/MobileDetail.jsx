import React, { useState, useEffect } from 'react';
import axios from 'axios';
import API_BASE_URL from "../../config";
import EditOpportunityModal from './editLeaveModal';

const MobileDetail = ({ product }) => {
  const [editModalOpen, setEditModalOpen] = useState(false);
  const [editProduct, setEditProduct] = useState(null);

  useEffect(() => {
    // Fetch product data if not already fetched
    if (product && !editProduct) {
      fetchProductData(product.id); // Pass product.id to fetchProductData
    }
  }, [product, editProduct]);

  const fetchProductData = async (id) => {
    try {
      const response = await axios.get(`${API_BASE_URL}/api/Leave/showOneApplicationLeave/${id}`);
      setEditProduct(response.data);
      console.log(response.data)
    } catch (error) {
      console.error('Error fetching product data for editing:', error);
    }
  };

  const handleEditClick = () => {
    // Open the modal if product data is already fetched
    if (editProduct) {
      setEditModalOpen(true);
    } else {
      // Fetch product data when Edit button is clicked
      fetchProductData(product.id); // Pass product.id to fetchProductData
      setEditModalOpen(true); // Open the modal even if data fetching fails
    }
  };

  const formatDate = (dateString) => {
    if (!dateString) return ''; // Handle cases where dateString is null or undefined
    const date = new Date(dateString);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
  };

  if (!product) {
    return <div>Loading...</div>; // Add a loading state or handle as needed
  }

  const { name, surname, status, fromDate, toDate, type, duration, days, description, history } = product;

  return (
    <div className="flex flex-col justify-center items-center mt-8">
      <div className="max-w-md w-full bg-white p-6 rounded-lg shadow-md">
        <p className="text-gray-600 mb-2">Name: {name} {surname}</p>
        <p className="text-gray-600 mb-2">Status: {status}</p>
        <p className="text-gray-600 mb-2">From Date: {formatDate(fromDate)}</p>
        <p className="text-gray-600 mb-2">To Date: {formatDate(toDate)}</p>
        <p className="text-gray-600 mb-2">Leave Type: {type}</p>
        <p className="text-gray-600 mb-2">License Type: {duration}</p>
        <p className="text-gray-600 mb-2">Closure Time: {days}</p>
        <p className="text-gray-600 mb-2">Description: {description}</p>
        <p className="text-gray-600 mb-2">Comments: {history}</p>
        <div className="flex items-center justify-around mt-4">
          <button onClick={handleEditClick} className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 focus:outline-none">
            Edit
          </button>
          {editModalOpen && (
            <EditOpportunityModal
              isOpen={editModalOpen}
              onClose={() => setEditModalOpen(false)}
              product={editProduct}
              id={product.id} // Pass product.id to EditOpportunityModal
            />
          )}
        </div>
      </div>
    </div>
  );
};

export default MobileDetail;
