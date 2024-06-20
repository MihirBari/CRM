import React from 'react';
import SideNavBar from '../Sidebar/Navbar';
import Maiin from './maiin';  // Assuming that 'maiin' is a component and not a typo
import { Footer } from '../Footer';

const Alert = () => {
  return (
    <>
    <div className="flex h-screen overflow-hidden">
    <SideNavBar />
    <div className="flex-1 overflow-x-hidden overflow-y-auto">
      <Maiin />
    </div>
  </div>
  <div>
 <Footer />
  </div>
  </>
  );
}

export default Alert;
