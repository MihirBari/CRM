import React from 'react';
import { Route, Routes, Navigate } from 'react-router-dom';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import './App.css';
import Login from './Pages/Login';
import User from './Pages/User/User.jsx';
import AddUser from './Pages/User/addUser.jsx';
import EditUser from './Pages/User/editUser.jsx';
import { useContext } from 'react';
import { AuthContext } from './context/AuthContext.jsx';
import Expense from './Pages/Contact/Expense.jsx';
import AddContact from './Pages/Contact/AddContact.jsx';
import EditContact from './Pages/Contact/editContact.jsx';
import AddSeller from './Pages/Leave/addSeller.jsx';
import Seller from './Pages/Leave/Seller.jsx';
import EditSeller from './Pages/Leave/editSeller.jsx';
import AddCustomer from './Pages/Contact/addCustomer.jsx';
import EditCustomer from './Pages/Contact/editCustomer.jsx';
import CustomerDetail from './Pages/Contact/CustomerDetail.jsx';
import AddOpportunity from './Pages/Opportunity/addOpportunity.jsx';
import Opportunity from './Pages/Opportunity/Opportunity.jsx';
import EditOpportunity from './Pages/Opportunity/editOpportunity.jsx';
import Alert from './Pages/Alert/Alert.jsx';
import PO from './Pages/PO/PO.jsx';
import ViewOpportunity from './Pages/Opportunity/viewOpportunity.jsx';
import Summary from './Pages/Summary/Summary.jsx';
import CustomerDetailVeiw from './Pages/Opportunity/CustomerDetailVeiw.jsx';


function App() {
  const { currentUser } = useContext(AuthContext);

  return (
    <>
      <Routes>
        <Route path='/' element={currentUser ? <Navigate to='/Customer' /> : <Login />} />
        <Route path='/user' element={currentUser ? <User /> : <Navigate to='/' />} />
        <Route path='/user/edit/:id' element={currentUser ? <EditUser /> : <Navigate to='/' />} />
        <Route path='/adduser' element={ <AddUser /> } />
        <Route path='/Customer' element={currentUser ? <Expense /> : <Navigate to='/' />} />
        <Route path='/Summary' element={currentUser ? <Summary /> : <Navigate to='/' />} />
        <Route path='/Leave' element={currentUser ? <Seller /> : <Navigate to='/' />} />
        <Route path='/Alert' element={currentUser ? <Alert /> : <Navigate to='/' />} />
        <Route path='/Opportunity' element={currentUser ? <Opportunity /> : <Navigate to='/' />} />
        <Route path='/PO' element={currentUser ? <PO /> : <Navigate to='/' />} />
        <Route path='/addExpense' element={currentUser ? <AddContact /> : <Navigate to='/' />} />
        <Route path='/addCustomer' element={currentUser ? <AddCustomer /> : <Navigate to='/' />} />
        <Route path='/addLeave' element={currentUser ? <AddSeller /> : <Navigate to='/' />} />
        <Route path='/addOpportunity' element={currentUser ? <AddOpportunity /> : <Navigate to='/' />} />
        <Route path='/Expense/edit/:id' element={currentUser ? <EditContact /> : <Navigate to='/' />} />
        <Route path='/Opportunity/view/:id' element={currentUser ? <ViewOpportunity /> : <Navigate to='/' />} />
        <Route path='/Customer/edit/:id' element={currentUser ? <EditCustomer /> : <Navigate to='/' />} />
        <Route path='/Leave/edit/:id' element={currentUser ? <EditSeller /> : <Navigate to='/' />} />
        <Route path='/Opportunity/edit/:id' element={currentUser ? <EditOpportunity /> : <Navigate to='/' />} />
        <Route path='/Customer/view/:customer_entity/:id' element={currentUser ? <CustomerDetailVeiw /> : <Navigate to='/' />} />
        <Route path='/Customer/:customer_entity' element={currentUser ? <CustomerDetail /> : <Navigate to='/' />} />
      </Routes>
      
      <ToastContainer
        position='top-center'
        autoClose={2000}
        hideProgressBar
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme='dark'
      />
    </>
  );
}

export default App;

