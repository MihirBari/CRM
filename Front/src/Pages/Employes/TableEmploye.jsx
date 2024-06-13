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

const TableEmploye = () => {
  const [users, setUsers] = useState([]);
  const navigate = useNavigate();
  const [exportModalIsOpen, setExportModalIsOpen] = useState(false);
  const [filterModalIsOpen, setFilterModalIsOpen] = useState(false);
  const [filteredUsers, setFilteredUsers] = useState([]);

  const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false);
  const [deleteItemId, setDeleteItemId] = useState(null);
  const [filters, setFilters] = useState({
    name: "",
    surname: ""
  });

  const handleCiFilterClick = () => {
    setFilterModalIsOpen(true);
  };
  const handleDeleteClick = (name, surname) => {
    setDeleteItemId({ name, surname });
    setShowDeleteConfirmation(true);
  };
  
  const handleDeleteConfirmation = () => {
    if (!deleteItemId) return;
  
    axios({
      method: "delete",
      url: `${API_BASE_URL}/api/Employes/deleteEmployes`,
      data: { name: deleteItemId.name, surname: deleteItemId.surname },
      headers: {
        "Content-Type": "application/json",
      },
    })
      .then((response) => {
        window.location.reload();
        toast.success("Deleted Successfully");
      })
      .catch((error) => {
        toast.error("Error deleting employee");
      });
  };
  
  const handleCloseDeleteConfirmation = () => {
    setDeleteItemId(null);
    setShowDeleteConfirmation(false);
  };
  
  useEffect(() => {
    const fetchEmployes = async () => {
      const controller = new AbortController();
      const signal = controller.signal;
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Employes/allEmployes`,
          {
            params: filters,
            signal: signal,
          }
        );
        setUsers(response.data.products);
        setFilteredUsers(response.data.products)
      } catch (err) {
        if (axios.isCancel(err)) {
          console.log("Request canceled", err.message);
        } else {
          console.error("Error fetching employes:", err);
        }
      }
      return () => {
        controller.abort();
      };
    };

    fetchEmployes();
  }, [filters]);

  const handleEditClick = (id) => {
    navigate(`edit/${id}`);
  };

 

  const columns = [
    {
      name: "ID",
      selector: (row) => row.id,
      sortable: true,
      width: "100px",
    },
    {
      name: "Name",
      selector: (row) => row.name,
      sortable: true,
      width: "150px",
    },
    {
      name: "Surname",
      selector: (row) => row.surname,
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
        <MdDelete onClick={() => handleDeleteClick(row.name, row.surname)}>Delete</MdDelete>
      ),
      button: true,
    },
  ];

  const handleExportButtonClick = () => {
    setExportModalIsOpen(true);
  };

  const handleExportModalClose = () => {
    setExportModalIsOpen(false);
  };

  const handleApplyFilters = (filters) => {
    setFilters(filters);
  };

  const resetFilters = () => {
    setFilters({
      name: "",
      surname: ""
    });
  };

  return (
    <>
      <div className="filter-container">
        {/* <button onClick={handleCiFilterClick} className="bg-blue-500 text-white px-4 py-2 rounded ml-2 m-2">
          <CiFilter /> Filter
        </button>
        <button
          onClick={handleExportButtonClick}
          className="bg-blue-500 text-white px-4 py-2 rounded ml-2 m-2"
        >
          Export
        </button> */}
      </div>
      <DataTable columns={columns} data={users} />
      <FilterModal
        isOpen={filterModalIsOpen}
        onClose={() => setFilterModalIsOpen(false)}
        onApplyFilters={handleApplyFilters}
        resetFilters={resetFilters}
      />
      <ExportTable
        isOpen={exportModalIsOpen}
        onClose={handleExportModalClose}
        data={filteredUsers}
      />
      <DeleteConfirmationDialog
        isOpen={showDeleteConfirmation}
        onClose={handleCloseDeleteConfirmation}
        onDelete={() => handleDeleteConfirmation(deleteItemId)}
      />
    </>
  );
};

export default TableEmploye;
