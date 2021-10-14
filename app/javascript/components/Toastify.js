import React, {useEffect} from 'react'
import PropTypes from "prop-types"
import { ToastContainer, toast } from 'react-toastify';
import { ToastyConfiguration } from './ToastifyConfiguration';
import 'react-toastify/dist/ReactToastify.css';

const Toastify = ({ greeting }) => {
  useEffect(() => {
    toast(greeting, ToastyConfiguration)
  }, [greeting]);

  return (
    <>
      <ToastContainer/>
    </>
  );
}

Toastify.propTypes = {
  greeting: PropTypes.string.isRequired
};

export default Toastify
