import axios from "axios";
import React, { useEffect, useState } from "react";
import "./orders.css";
import DataTable, { createTheme } from "react-data-table-component";
import API_BASE_URL from "../../config";
import { MdEdit, MdDelete } from "react-icons/md";
import { toast } from "react-toastify";
import { useNavigate } from "react-router-dom";
import { FaEye } from "react-icons/fa";
import ExportTable from "./ExportTable";
import FilterModal from "./FilterModal";
import { CiFilter } from "react-icons/ci";
import DeleteConfirmationDialog from "./DeleteConfirmationDialog";


const Users = () => {
  const [users, setUsers] = useState([]);
  const navigate = useNavigate();
  const [exportModalIsOpen, setExportModalIsOpen] = useState(false);
  const [filterModalIsOpen, setFilterModalIsOpen] = useState(false);
  const [filteredUsers, setFilteredUsers] = useState([]);
  const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false); // State variable for delete confirmation dialog
  const [deleteItemId, setDeleteItemId] = useState(null);
  const [filters, setFilters] = useState({
    name: "",
    surname:"",
    status: "",
    fromDate: "",
    toDate:"",
    duration:"",
    days:"",
    description:"",
    history:"",
    assignedTo:""
  });

  useEffect(() => {
    const fetchOrders = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Leave/showApplicationLeave`
        );
        //console.log(response.data)
        setUsers(response.data.dealers);
        setFilteredUsers(response.data.dealers);
      
      } catch (err) {
        console.error("Error fetching orders:", err);
      }
    };

    fetchOrders();
  }, []);


  const handleEditClick = (userId) => {
    navigate(`edit/${userId.id}`);
  };

  const handleDeleteConfirmation = (itemId) => {
    axios
      .delete(`${API_BASE_URL}/api/Leave/deleteApplication`, { data: { id: itemId } })
      .then((response) => {
        console.log("Delete successful:", response.data);
        toast.success("Deleted Successfully");
        window.location.reload();
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

  // Function to handle delete operation
  const handleDeleteClick = (row) => {
    setDeleteItemId(row.id);
    setShowDeleteConfirmation(true);
  };

  const handleViewClick = (row) => {
    navigate(`view/${row.id}`);
  };

  const handleViewClicked = (id) => {
    //console.log("Viewing order with ID:", id);
    navigate(`view/${id}`);
  };

  const handleExportClick = () => {
    setExportModalIsOpen(true);
  };

  const columns = [
    // {
    //   name: "Sr. No",
    //   selector: (_, index) => index + 1,
    //   sortable: false,
    //   width: "80px",
    // },
    {
      name: "ID",
      selector: (row) => row.id,
      sortable: true,
      cell: (row) => (
        <span
          className="view-link"
          onClick={() => handleViewClicked(row.id)}
          style={{ cursor: "pointer", width: "100%", height: "100%", display: "flex", alignItems: "center", justifyContent: "center" }}
        >
          {row.id}
        </span>
      ),
    
    },
    {
      name: "Name",
      selector: (row) => row.name,
      sortable: true,
    },
    {
      name: "Surname",
      selector: (row) => row.surname,
      sortable: true,
    },
    
    {
      name: "Status",
      selector: (row) => row.status,
      sortable: true,
      width: "150px",
    },
    {
      name: "From Date",
      selector: (row) => {
        const date = new Date(row.fromDate);
        return date.toLocaleString("en-Uk", {
          year: "numeric",
          month: "2-digit",
          day: "2-digit",
          timeZone: "IST",
        });
      },
      sortable: true,
      width: "150px",
    },
    {
      name: "To Date",
      selector: (row) => {
        const date = new Date(row.toDate);
        return date.toLocaleString("en-Uk", {
          year: "numeric",
          month: "2-digit",
          day: "2-digit",
          timeZone: "IST",
        });
      },
      sortable: true,
      width: "150px",
    },
    {
      name: "Duration",
      selector: (row) => row.duration,
      sortable: true,
    },
    {
      name: "Days",
      selector: (row) => row.days,
      sortable: true,
      width: "140px",
    },
    // {
    //   name: "Description",
    //   selector: (row) => row.description,
    //   sortable: true,
    //   width: "140px",
    // },
    // {
    //   name: "Comment",
    //   selector: (row) => row.history,
    //   sortable: true,
    //   width: "140px",
    // },
    // {
    //   name: "Created at",
    //   selector: (row) => {
    //     const date = new Date(row.created_at);
    //     return date.toLocaleString("en-Uk", {
    //       year: "numeric",
    //       month: "2-digit",
    //       day: "2-digit",
    //       timeZone: "IST",
    //     });
    //   },
    //   sortable: true,
    //   width: "150px",
    // },
    // {
    //   name: "Updated at",
    //   selector: (row) => {
    //     const date = new Date(row.update_at);
    //     return date.toLocaleString("en-Uk", {
    //       year: "numeric",
    //       month: "2-digit",
    //       day: "2-digit",
    //       timeZone: "IST",
    //     });
    //   },
    //   sortable: true,
    //   width: "150px",
    // },
    {
      name: "Edit",
      cell: (row) => <MdEdit onClick={() => handleEditClick(row)}>Edit</MdEdit>,
      button: true,
    },
    {
      name: "Delete",
      cell: (row) => (
        <MdDelete onClick={() => handleDeleteClick(row)}>Delete</MdDelete>
      ),
      button: true,
    },
    {
      name: "View",
      cell: (row) => <FaEye onClick={() => handleViewClick(row)} />,
      button: true,
    },
  ];

  const CustomHeader = ({ column }) => (
    <div title={column.name} style={{ whiteSpace: "normal" }}>
      {column.name}
    </div>
  );

  const modifiedColumns = columns.map((col) => ({
    ...col,
    header: <CustomHeader column={col} />,
  }));

  createTheme(
    "solarized",
    {
      text: {
        primary: "#FFFFFF",
        secondary: "#FFFFFF",
      },
      background: {
        default: "rgba(59,139,246,1)",
      },
      context: {
        background: "#cb4b16",
        text: "#FFFFFF",
      },
      divider: {
        default: "#073642",
      },
      action: {
        button: "rgba(0,0,0,.54)",
        hover: "rgba(59,139,246,1)",
        disabled: "rgba(0,0,0,.12)",
      },
    },
    "light"
  );

  const customStyles = {
    headCells: {
      style: {
        color: "rgb(255 255 255)",
        zIndex: "auto",
        "&:not(:last-of-type)": {
          borderRightStyle: "solid",
          borderRightWidth: "1px",
        },
      },
    },
    header: {
      style: {
        minHeight: "56px",
        fontSize: "25px",
      },
    },
    headRow: {
      style: {
        borderTopStyle: "solid",
        borderTopWidth: "1px",
      },
    },
    cells: {
      style: {
        "&:not(:last-of-type)": {
          borderRightStyle: "solid",
          borderRightWidth: "1px",
        },
        fontSize: "16px",
      },
    },
  };

  const onApplyFilters = (filteredData) => {
    setFilteredUsers(filteredData);
  
    setFilterModalIsOpen(false);
  };

  const initialFilters = {
     name: "",
    status: "",
    fromDate: "",
    toDate:"",
    duration:"",
    days:"",
    description:"",
    history:"",
    assignedTo:""
  };

  const handleCiFilterClick = () => {
    setFilterModalIsOpen(true);
  };

  const handleSearch = (e) => {
    const searchTerm = e.target.value.toLowerCase();
    const filteredData = users.filter(user => 
        user.name.toLowerCase().includes(searchTerm) || user.surname.toLowerCase().includes(searchTerm)
    );
    setFilteredUsers(filteredData);
};

  return (
    <div className="order">
      <div className="flex items-center">
        <div
          style={{ display: "flex", alignItems: "center", marginLeft: "10px" }}
        >
                <input
                type="text"
                placeholder="Search"
                onChange={handleSearch}
                className="p-2 rounded border border-gray-300 focus:outline-none focus:border-blue-500"
            />
          {/* <button
            className="bg-blue-500 text-white px-4 py-2 rounded"
            onClick={handleExportClick}
          >
            Export
          </button> */}
          <ExportTable
            data={filteredUsers}
            isOpen={exportModalIsOpen}
            onRequestClose={() => setExportModalIsOpen(false)}
          />
          <CiFilter
            size={40}
            style={{ marginLeft: "25px" }}
            onClick={handleCiFilterClick}
          />
          
          <FilterModal
            isOpen={filterModalIsOpen}
            onClose={() => setFilterModalIsOpen(false)}
            onApplyFilters={onApplyFilters}
            users={users}
            resetFilters={() => setFilters(initialFilters)}
          />
          
          <DeleteConfirmationDialog
            isOpen={showDeleteConfirmation}
            onClose={handleCloseDeleteConfirmation}
            onDelete={() => {
              handleDeleteConfirmation(deleteItemId); // Call the delete confirmation function with the deleteItemId
              handleCloseDeleteConfirmation(); // Close the dialog after deletion
            }}
          />
        </div>
      </div>
      <DataTable
        className="dataTable"
        columns={modifiedColumns}
        data={filteredUsers}
        //fixedHeader
        customStyles={customStyles} // Pass the updated customStyles object here
        fixedHeaderScrollHeight="800px"
        striped
        theme="solarized"
        pagination
        highlightOnHover
        paginationPerPage={10}
        paginationRowsPerPageOptions={[10, 20, 30]}
        paginationComponentOptions={{
          rowsPerPageText: "Rows per page:",
          rangeSeparatorText: "of",
          noRowsPerPage: false,
          selectAllRowsItem: false,
        }}
      />
    </div>
  );
};

export default Users;
