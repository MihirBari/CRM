import React from "react";
import { useNavigate } from "react-router-dom";
import TableExpense from "./tableExpense";
import TableCustomer from "./tableCustomer";
import { IoMdAddCircle } from "react-icons/io";
import CustomerTable from "./customerTable";


const Maiin = () => {
  const navigate = useNavigate();

  const handleAddClick = () => {
    navigate("/addCustomer");
  };

  return (
    <>
      <div className="h-screen flex-1 p-7">
        <div>
          <h1 className="text-2xl font-semibold text-center">Customer</h1>
        </div>
        <div style={{ float: "right" }}>
          <IoMdAddCircle size={40} onClick={handleAddClick} />
        </div>
        <div style={{ marginTop: "70px" }}>
          {/* <TableCustomer /> */}
          <CustomerTable />
        </div>
      </div>
      
    </>
  );
};

export default Maiin;
