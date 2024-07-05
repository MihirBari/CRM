import React from "react";
import { useNavigate } from "react-router-dom";
import Table from "./tableSeller";
import { IoMdAddCircle } from "react-icons/io";
import LeaveTable from "./LeaveTable";

const Maiin = () => {
  const navigate = useNavigate();

  const handleAddClick = () => {
    navigate("/addLeave");
  };

  return (
    <>
      <div className=" flex-1 p-7">
        <div>
          <h1 className="text-2xl font-semibold text-center">
            Leave Applications
          </h1>
        </div>
        <div style={{ float: "right" }}>
          <IoMdAddCircle size={40} onClick={handleAddClick} />
        </div>
        <div style={{ marginTop: "70px" }}>
          {/* <Table /> */}
          <LeaveTable />
        </div>
      </div>
    </>
  );
};

export default Maiin;
