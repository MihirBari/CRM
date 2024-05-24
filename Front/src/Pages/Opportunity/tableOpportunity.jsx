import axios from "axios";
import React, { useEffect, useState } from "react";
import "./orders.css";
import DataTable, { createTheme } from "react-data-table-component";
import API_BASE_URL from "../../config";
import { MdDelete, MdEdit } from "react-icons/md";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import { CiFilter } from "react-icons/ci";
import FilterModal from "./FilterModal";
import ExportTable from "./ExportTable";
import DeleteConfirmationDialog from "./DeleteConfirmationDialog.jsx";

const TableOpportunity = () => {
  const [users, setUsers] = useState([]);
  const navigate = useNavigate();
  const [exportModalIsOpen, setExportModalIsOpen] = useState(false);
  const [filterModalIsOpen, setFilterModalIsOpen] = useState(false);
  const [filteredUsers, setFilteredUsers] = useState([]);
 
  const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false);
  const [deleteItemId, setDeleteItemId] = useState(null);
  const [filters, setFilters] = useState({
    customerEntities: "",
    type: "",
    LicenseType: "",
    value: "",
    closureTime: "",
    status: "",
    period:"",
    licenseFrom: "",
    licenseTo: "",
  });

  const handleCiFilterClick = () => {
    setFilterModalIsOpen(true);
  };

  const handleDeleteClick = (itemId) => {
    setDeleteItemId(itemId); // Set the itemId to be deleted
    setShowDeleteConfirmation(true); // Show the delete confirmation dialog
  };

  const handleDeleteConfirmation = (itemId) => {
    console.log("Deleting order with ID:", itemId);

    axios({
      method: "delete",
      url: `${API_BASE_URL}/api/Opportunity/deleteOpportunity`,
      data: { id: itemId }, // Include only the ID in the request payload
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        console.log("Delete successful. Deleted order_id:", itemId);
        window.location.reload();
        toast.success("Deleted Successfully");
      })
      .catch((error) => {
        console.error("Error deleting:", error);
        toast.error("Error deleting order");
      });
  };

  const handleCloseDeleteConfirmation = () => {
    setDeleteItemId(null);
    setShowDeleteConfirmation(false);
  };

  useEffect(() => {
    const fetchOrders = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Opportunity/showOpportunity`,
          {
            params: filters, // Pass filters as parameters to the backend
          }
        );
        setUsers(response.data.products);
        console.log(response.data.products);
        setFilteredUsers(response.data.products);
      } catch (err) {
        console.error("Error fetching orders:", err);
      }
    };

    // Fetch orders with filters when the component mounts
    fetchOrders();
  }, [filters]);

  const handleEditClick = (id) => {
    console.log("Editing order with ID:", id);

    navigate(`edit/${id}`);
  };

  const handleViewClick = (id) => {
    console.log("Viewing order with ID:", id);
    navigate(`view/${id}`);
  };

  const columns = [
    {
      name: "ID",
      selector: (row) => row.id,
      sortable: true,
      cell: (row) => (
        <span
          className="view-link"
          onClick={() => handleViewClick(row.id)}
          style={{ cursor: "pointer" }}
        >
          {row.id}
        </span>
      ),
      width: "60px",
    },
    {
      name: "Customer Entity",
      selector: (row) => row.customer_entity,
      sortable: true,
      width: "200px",
    },
    {
      name: "Opportunity Type",
      selector: (row) => row.type,
      sortable: true,
      width: "200px",
    },
    {
      name: "License Type",
      selector: (row) => row.License_type,
      sortable: true,
      width: "200px",
    },
    {
      name: "Value",
      selector: (row) => row.value,
      sortable: true,
      width: "150px",
    },
    {
      name: "Closure Time",
      selector: (row) => {
        const date = new Date(row.closure_time);
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
      name: "Opportunity Status",
      selector: (row) => row.status,
      sortable: true,
      width: "200px",
    },
    {
      name: "License From",
      selector: (row) => {
        const date = new Date(row.license_from);
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
      name: "License To",
      selector: (row) => {
        const date = new Date(row.license_to);
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
      name: "Edit",
      cell: (row) => (
        <MdEdit onClick={() => handleEditClick(row.id)}>Edit</MdEdit>
      ),
      button: true,
    },
    {
      name: "Delete",
      cell: (row) => (
        <MdDelete onClick={() => handleDeleteClick(row.id)}>Delete</MdDelete>
      ),
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
    setFilteredUsers(filteredData); // Set filteredTotalData
    setFilterModalIsOpen(false);
  };

  const initialFilters = {
    customerEntities: "",
    type: "",
    LicenseType:"",
    value: "",
    closureTime: "",
    status: "",
    licenseFrom: "",
    licenseTo: "",
  };

  const handleExportClick = () => {
    setExportModalIsOpen(true);
  };

  return (
    <div className="order">
      <div className="flex items-center">
        <button
          className="bg-blue-500 text-white px-4 py-2 rounded"
          onClick={handleExportClick}
        >
          Export
        </button>
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
      </div>
      <FilterModal
        isOpen={filterModalIsOpen}
        onClose={() => setFilterModalIsOpen(false)}
        onApplyFilters={onApplyFilters}
        resetFilters={() => setFilters(initialFilters)} // Pass initial filters to resetFilters
      />
      <DeleteConfirmationDialog
        isOpen={showDeleteConfirmation}
        onClose={handleCloseDeleteConfirmation}
        onDelete={() => {
          handleDeleteConfirmation(deleteItemId);
          handleCloseDeleteConfirmation();
        }}
      />
      <DataTable
        className="dataTable"
        columns={modifiedColumns}
        data={filteredUsers}
        customStyles={customStyles} // Pass the updated customStyles object here
        fixedHeaderScrollHeight="800px"
        striped
        theme="solarized"
        pagination
        highlightOnHover
        paginationPerPage={20}
        paginationRowsPerPageOptions={[20, 40, 60]}
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

export default TableOpportunity;