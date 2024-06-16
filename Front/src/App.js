import React, { useContext } from 'react';
import { Route, Routes, Navigate } from 'react-router-dom';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import './App.css';
import Login from './Pages/Login';
import User from './Pages/User/User.jsx';
import AddUser from './Pages/User/addUser.jsx';
import EditUser from './Pages/User/editUser.jsx';
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
import ProtectedRoute from './Pages/ProtectedRoute.jsx';
import Unauthorized from './Pages/Unauthorized.jsx';
import Calender from './Pages/Calender/Calender.jsx';
import ViewLeave from './Pages/Leave/ViewLeave.jsx';
import AddEmployes from './Pages/Employes/addEmployes.jsx';
import Employes from './Pages/Employes/Employes.jsx';
import EditEmployes from './Pages/Employes/edit.jsx';
import Register from './Pages/Register.jsx';
import ForgetPassword from './Pages/ForgetPassword.jsx';
import ResetPassword from './Pages/ResetPassword.jsx';

function App() {
  const { currentUser } = useContext(AuthContext);

  return (
    <>
      <Routes>
        <Route
          path='/'
          element={
            currentUser ? (
              currentUser.role === 'admin' || currentUser.role === 'moderator' ? (
                <Navigate to='/Customer' />
              ) : (
                <Navigate to='/Leave' />
              )
            ) : (
              <Login />
            )
          }
        />
        <Route path='/user' element={<ProtectedRoute adminOnly><User /></ProtectedRoute>} />
        <Route path='/user/edit/:id' element={<ProtectedRoute adminOnly><EditUser /></ProtectedRoute>} />
        <Route path='/adduser' element={<ProtectedRoute adminOnly><AddUser /></ProtectedRoute>} />
        <Route path='/Customer' element={<ProtectedRoute adminOnly><Expense /></ProtectedRoute>} />
        <Route path='/Summary' element={<ProtectedRoute adminOnly ><Summary /></ProtectedRoute>} />
        <Route path='/Leave' element={<ProtectedRoute><Seller /></ProtectedRoute>} />
        <Route path='/Alert' element={<ProtectedRoute adminOnly ><Alert /></ProtectedRoute>} />
        <Route path='/Opportunity' element={<ProtectedRoute adminOnly><Opportunity /></ProtectedRoute>} />
        <Route path='/PO' element={<ProtectedRoute adminOnly><PO /></ProtectedRoute>} />
        <Route path='/addExpense' element={<ProtectedRoute adminOnly><AddContact /></ProtectedRoute>} />
        <Route path='/addCustomer' element={<ProtectedRoute adminOnly><AddCustomer /></ProtectedRoute>} />
        <Route path='/addLeave' element={<ProtectedRoute><AddSeller /></ProtectedRoute>} />
        <Route path='/addOpportunity' element={<ProtectedRoute adminOnly ><AddOpportunity /></ProtectedRoute>} />
        <Route path='/Expense/edit/:id' element={<ProtectedRoute adminOnly><EditContact /></ProtectedRoute>} />
        <Route path='/Opportunity/view/:id' element={<ProtectedRoute adminOnly><ViewOpportunity /></ProtectedRoute>} />
        <Route path='/Customer/edit/:id' element={<ProtectedRoute adminOnly><EditCustomer /></ProtectedRoute>} />
        <Route path='/Leave/edit/:id' element={<ProtectedRoute><EditSeller /></ProtectedRoute>} />
        <Route path='/Leave/view/:id' element={<ProtectedRoute><ViewLeave /></ProtectedRoute>} />
        <Route path='/Opportunity/edit/:id' element={<ProtectedRoute adminOnly ><EditOpportunity /></ProtectedRoute>} />
        <Route path='/Customer/view/:customer_entity/:id' element={<ProtectedRoute adminOnly><CustomerDetailVeiw /></ProtectedRoute>} />
        <Route path='/Customer/:customer_entity' element={<ProtectedRoute adminOnly><CustomerDetail /></ProtectedRoute>} />
        <Route path='/Calendar' element={<ProtectedRoute ><Calender /></ProtectedRoute>} />
        <Route path='/Employes' element={<ProtectedRoute ><Employes /></ProtectedRoute>} />
        <Route path='/Employes/edit/:id' element={<ProtectedRoute ><EditEmployes /></ProtectedRoute>} />
        <Route path='/addEmployes' element={<ProtectedRoute ><AddEmployes /></ProtectedRoute>} />
        <Route path='/unauthorized' element={<Unauthorized />} />
        <Route path='/register' element={<Register />} />
        <Route path='/forgetPassword' element={<ForgetPassword />} />
        <Route path='/resetPassword/:token' element={<ResetPassword />} />
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
