import React, { useState } from 'react';
import { toast } from 'react-toastify';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import API_BASE_URL from '../config';

const ForgetPassword = () => {
    const [email, setEmail] = useState('');
    const navigate = useNavigate();

    const handleChange = (e) => {
        setEmail(e.target.value);
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            await axios.post(`${API_BASE_URL}/api/user/requestResetPassword`, { email });
            toast.success('Password reset link sent to your email');
            navigate('/');
        } catch (error) {
            toast.error('Error sending password reset link');
        }
    };

    return (
        <div className='min-h-screen bg-gray-50 flex flex-col justify-center py-12 sm:px-6 lg:px-8'>
            <div className="sm:mx-auto sm:w-full sm:max-w-md">
                <h2 className='mt-6 text-center text-3xl font-extrabold text-gray-900'>
                    FORGOT PASSWORD
                </h2>
            </div>
            <div className='mt-8 sm:mx-auto sm:w-full sm:max-w-md'>
                <div className="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
                    <form className='space-y-6' onSubmit={handleSubmit}>
                        <div>
                            <label
                                htmlFor="email"
                                className="block text-sm font-medium text-gray-700"
                            >
                                Email address
                            </label>
                            <div className="mt-1">
                                <input
                                    type="email"
                                    name="email"
                                    autoComplete="email"
                                    required
                                    onChange={handleChange}
                                    placeholder='Enter your E-mail'
                                    className="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                />
                            </div>
                        </div>
                        <div>
                            <button
                                type="submit"
                                className="group relative w-full h-[40px] flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
                            >
                                Send reset link
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
};

export default ForgetPassword;