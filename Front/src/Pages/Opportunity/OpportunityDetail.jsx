import React, { useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import EditOpportunityModal from './EditOpportunityModal';


const OpportunityDetail = ({ product }) => {
  const {id} = useParams()
  const [editModalOpen, setEditModalOpen] = useState(false); // State to manage modal open/close

  const handleEditClick = () => {
    console.log("Clicked")
    setEditModalOpen(true); // Open the modal when Edit button is clicked
  };

  const {
    customer_entity,
    description,
    name,
    phone,
    email,
    type,
    value,
    closure_time,
    status,
    period,
    license_from,
    license_to,
  } = product;


  return (
    <div className="flex flex-col justify-center items-center mt-8">
      <div className="max-w-md w-full bg-white p-6 rounded-lg shadow-md">
        <Link to={`/Customer/${customer_entity}`}>
        <h2 className="text-xl font-semibold mb-2">Customer Entity : {customer_entity}</h2>
        </Link>
        <p className="text-gray-600 mb-2">Customer Name : {name}</p>
        <p className="text-gray-600 mb-2">Customer Email : {email}</p>
        <p className="text-gray-600 mb-2">Customer Phone : {phone}</p>
        <p className="text-gray-600 mb-2">Description : {description}</p>
        <p className="text-gray-800 font-semibold mb-2">Value:₹ {value} </p>
        <p className="text-gray-600 mb-2">Type : {type}</p>
        <p className="text-gray-600 mb-2">Closure Time : {closure_time}</p>
        <p className="text-gray-600 mb-2">Current Status : {status}</p>
        <p className="text-gray-600 mb-2">Comments : {period}</p>
        <p className="text-gray-600 mb-2">License From: {license_from}</p>
        <p className="text-gray-600 mb-2">License To : {license_to}</p>

        <div className="flex items-center justify-around mt-4">
     
        <button onClick={() => handleEditClick()} className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 focus:outline-none">
            Edit
          </button>
          {editModalOpen && <EditOpportunityModal isOpen={editModalOpen} onClose={() => setEditModalOpen(false)} />}
        
          <Link to="/Opportunity">
          <button className="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600 focus:outline-none">
            Back
          </button>
        </Link>
        </div>
      </div>
    </div>
  );
};

export default OpportunityDetail;
