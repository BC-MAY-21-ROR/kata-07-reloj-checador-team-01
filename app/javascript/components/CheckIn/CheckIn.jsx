import React, { useState } from 'react';
import { Form, Formik, Field, ErrorMessage } from "formik";
import { initialValues, FormCheckSchema } from "./CheckInSchema";
import Toastify from '../Toastify';
import axios from 'axios';

const Checkin = ({ authenticity_token, checkIn, checkOut }) => {
  const [errorMessage, setErrorMessage] = useState('');
  const [successMessage, setSuccessMessage] = useState('');
  const checkInEmployee = secret => {
    axios.post('/check-in', {
      private_number: secret
    }).then((res) => {
      const { message } = res.data;
      setSuccessMessage(message[0])
    }
    ).catch((err) => {
      const { message } = err.response.data;
      setErrorMessage(message)
    }
    )
  }
  const checkOutEmployee = secret => {
    axios.post('/check-out', {
      private_number: secret
    }).then((res) => {
      const { message } = res.data[0];
      setSuccessMessage(message)
    }
    ).catch((err) => {
      const { message } = err.response.data;
      setErrorMessage(message)
    }
    )
  }
  const onsubmit = (values, { resetForm }) => {
    //Token to prevent CSRF Attacks
    const token = document.querySelector('[name=csrf-token]').content
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token
    if (!values.code) return;
    const secret_code = values.code;
    checkInEmployee(secret_code);
    setSuccessMessage('');
    setErrorMessage('');
    resetForm({});
  };
  return (
    <>
      {errorMessage !== '' && <Toastify greeting={errorMessage}></Toastify>}
      {successMessage !== '' && <Toastify greeting={successMessage}></Toastify>}
      <Formik
        onSubmit={onsubmit}
        initialValues={initialValues}
        validationSchema={FormCheckSchema}
        className="flex flex-col"
      >
        <Form>
          <Field
            className="mb-6 h-10 text-center focus:ring-1 focus:ring-light-blue-400 focus:outline-none w-full 
            placeholder-gray-500 border border-gray-200 rounded-md md:mt-6 md:w-auto md:h-12"
            type="text"
            name="code"
            placeholder="Secret Code"
          />

          <ErrorMessage
            name="code"
            component="div"
            className="bg-red-300 text-red-800 p-2 mb-2"
          />
          <div className="flex flex-col md:flex md:flex-row">
            <button
              className="mb-4 h-10 rounded-md bg-blue-400 text-white md:w-3/5 md:h-12 md:mb-6"
              type="submit"
            >
              CHECK IN
            </button>
            <button
              className="h-10 rounded-md bg-blue-400 text-white md:ml-8  md:w-3/5 md:h-12"
              type="submit"
            >
              CHECK OUT
            </button>
          </div>
        </Form>
      </Formik>
    </>
  );
};
export default Checkin;
