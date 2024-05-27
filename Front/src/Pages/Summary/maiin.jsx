import React, { useState, useEffect } from "react";
import axios from "axios";
import API_BASE_URL from "../../config";
import FilterModal from "./FilterModal";
import { CiFilter } from "react-icons/ci";

const Main = () => {
  const [filterModalIsOpen, setFilterModalIsOpen] = useState(false);
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filteredUsers, setFilteredUsers] = useState([]);
  const [aggregates, setAggregates] = useState({});
  const [filters, setFilters] = useState({
    type: "",
    LicenseType: "",
    licenseFrom: "",
    licenseTo: "",
  });

  const calculateAggregates = (data) => {
    const totalEntity = new Set(data.map((user) => user.customer_entity)).size;
    const totalLicenseType = new Set(data.map((user) => user.License_type)).size;
    const totalType = new Set(data.map((user) => user.type)).size;
    const totalValue = data.reduce((acc, user) => acc + user.value, 0);

    return {
      TotalEntity: totalEntity,
      TotalLicenseType: totalLicenseType,
      TotalType: totalType,
      TotalValue: totalValue,
    };
  };

  const onApplyFilters = (filteredData) => {
    setFilteredUsers(filteredData);
    setAggregates(calculateAggregates(filteredData));
    setFilterModalIsOpen(false);
  };

  const initialFilters = {
    type: "",
    LicenseType: "",
    licenseFrom: "",
    licenseTo: "",
  };

  const handleCiFilterClick = () => {
    setFilterModalIsOpen(true);
  };

  useEffect(() => {
    const fetchOpportunities = async () => {
      try {
        const response = await axios.get(
          `${API_BASE_URL}/api/Opportunity/showOpportunity`,
          {
            params: filters,
          }
        );
        setUsers(response.data.products);
        const initialAggregates = calculateAggregates(response.data.products);
        setAggregates(initialAggregates);
        setFilteredUsers(response.data.products);
        setLoading(false);
      } catch (err) {
        console.error("Error fetching opportunities:", err);
        setLoading(false);
      }
    };

    fetchOpportunities();
  }, [filters]);

  return (
    <div className="h-screen flex-1 p-7">
      <div>
        <h1 className="text-2xl font-semibold text-center">Summary</h1>
      </div>
      <div style={{ float: "right" }}>
        <CiFilter
          size={40}
          style={{ marginLeft: "25px" }}
          onClick={handleCiFilterClick}
        />
        <FilterModal
          isOpen={filterModalIsOpen}
          onClose={() => setFilterModalIsOpen(false)}
          onApplyFilters={onApplyFilters}
          filters={filters}
          resetFilters={() => setFilters(initialFilters)}
        />
      </div>

      <div>
        {loading ? (
          <div>Loading...</div>
        ) : users.length === 0 ? (
          <div className="text-xl font text-center">Please add details.</div>
        ) : (
          <div>
            <div style={{ display: "flex", justifyContent: "space-between", padding: "10px", backgroundColor: "#f0f0f0", marginBottom: "10px" }}>
              <div>
                <h2>Entity</h2>
              </div>
              <div>
                <h2>Opportunity Type</h2>
              </div>
              <div>
                <h2>License Type</h2>
              </div>
              <div>
                <h2>Total Amount</h2>
              </div>
            </div>
            {Array.isArray(users) &&
              filteredUsers.map((user) => (
                <div
                  key={user.id}
                  style={{
                    border: "1px solid #ccc",
                    padding: "10px",
                    margin: "10px",
                    height: "auto",
                    width: "90%",
                    display: "flex",
                    flexWrap: "wrap",
                    justifyContent: "space-between",
                  }}
                >
                  <div>{user.customer_entity}</div>
                  <div>{user.type}</div>
                  <div>{user.License_type}</div>
                  <div>{user.value}</div>
                </div>
              ))}
              <h2>Totals:</h2>
            <div style={{   border: "1px solid #ccc",
                    padding: "10px",
                    margin: "10px",
                    height: "auto",
                    width: "90%",
                    display: "flex",
                    flexWrap: "wrap",
                    justifyContent: "space-between",}}>
              
              <div> {aggregates.TotalEntity}</div>
              <div>{aggregates.TotalType}</div>
              <div> {aggregates.TotalLicenseType}</div>
              <div> {aggregates.TotalValue}</div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default Main;
