import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import SideNavBar from '../Sidebar/Navbar';
import SellerDetails from './LeaveDetail';
import axios from 'axios';
import API_BASE_URL from "../../config";

const ViewLeave = () => {
  const { id } = useParams(); 
  const [product, setProduct] = useState(null);

  useEffect(() => {
    const fetchData = () => {
      axios.get(`${API_BASE_URL}/api/Leave/showOneApplicationLeave/${id}`)
        .then(response => {
          console.log('API Response:', response);
          setProduct(response.data[0]);
        })
        .catch(error => {
          console.error('Error fetching product data:', error);
        });
    };
  
    fetchData();
  }, [id]);

  return (
    <>
      <div className="flex h-screen overflow-hidden">
        <SideNavBar />
        <div className="flex-1 overflow-x-hidden overflow-y-auto">
          <div className="mb-4">
            <h1 className="text-2xl font-semibold text-center">Expense</h1>
          </div>

          {product && <SellerDetails product={product} />}
        </div>
      </div>
    </>
  );
};

export default ViewLeave;