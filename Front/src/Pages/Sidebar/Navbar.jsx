import React, { useContext, useState } from "react";
import { Link, useLocation } from "react-router-dom";
import Logout from "../Logout";
import { AuthContext } from "../../context/AuthContext";
import { FaBars } from "react-icons/fa";
import './SideNavBar.css'; // Ensure this file exists with appropriate styling

const SideNavBar = () => {
  const { currentUser } = useContext(AuthContext);
  const [open, setOpen] = useState(false);
  const [activeTab, setActiveTab] = useState(0);
  const location = useLocation(); // To get the current path

  const Menus = [
    { title: "User", src: "User", link: "/user" },
    { title: "Profile", src: "User", link: "/Profile" },
    { title: "Summary", src: "Chart_fill", link: "/Summary" },
    { title: "Customer", src: "Chat", link: "/Customer" },
    { title: "Opportunity", src: "Setting", link: "/Opportunity" },
    { title: "Alert", src: "Setting", link: "/Alert" },
    { title: "PO", src: "Setting", link: "/PO" },
    { title: "Leave", src: "Setting", link: "/Leave" },
    { title: "Calendar", src: "Calendar", link: "/Calendar" },
    { title: "Employees", src: "User", link: "/Employes" },
  ];

  const handleTabClick = (index) => {
    setActiveTab(index);
  };

  let filteredMenus = [];

  if (currentUser?.role === "admin") {
    filteredMenus = Menus;
  } else if (currentUser?.role === "moderator") {
    filteredMenus = Menus.filter(
      (menu) => menu.title !== "Employes" && menu.title !== "User"
    );
  } else {
    filteredMenus = Menus.filter(
      (menu) => menu.title === "Leave" || menu.title === "Calendar" | menu.title === "Profile"
    );
  }

  return (
    <div className="sidenav-container">
      <div className="hamburger" onClick={() => setOpen(!open)}>
        <FaBars color="black" />
      </div>
      <div className={`sidenav ${open ? "open" : ""}`}>
        <img
          src={require("../../assets/control.png")}
          className={`absolute cursor-pointer -right-3 top-9 w-7 border-dark-purple
            border-2 rounded-full ${!open && "rotate-180"}`}
          onClick={() => setOpen(!open)}
          alt=""
        />
        <div className="flex gap-x-4 items-center">
          <img
            src={require("../../assets/techsa.png")}
            className={`cursor-pointer duration-500 techsa-logo`}
            alt=""
          />
          <h1
            className={`text-white origin-left font-medium text-xl duration-200 ${!open && "scale-0"}`}
          >
            Dashboards
          </h1>
        </div>
        <ul className="pt-6">
          {filteredMenus.map((Menu, index) => (
            <Link to={Menu.link} key={index} onClick={() => handleTabClick(index)}>
              <li
                className={`flex rounded-md p-2 cursor-pointer hover:bg-light-white text-white text-l items-center gap-x-6 
                ${location.pathname === Menu.link ? "bg-light-white" : ""}`}
              >
                <img src={require(`../../assets/${Menu.src}.png`)} alt="" />
                <span className={`${!open && "hidden"} origin-left duration-200`}>
                  {Menu.title}
                </span>
              </li>
            </Link>
          ))}
        </ul>
        <div className="flex rounded-md p-2 cursor-pointer hover:bg-light-white text-white text-l items-center gap-x-6">
          <span className={`${!open && "hidden"} origin-left duration-200 flex items-center`}>
            <Logout />
            <span className="ml-6">Logout</span>
          </span>
        </div>
      </div>
    </div>
  );
};

export default SideNavBar;
