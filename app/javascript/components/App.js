import React from "react"
import PropTypes from "prop-types"
import Checkin from "./CheckIn/CheckIn"
import 'react-toastify/dist/ReactToastify.css'

const App = () => {
  const authenticity_token = "";
  return (
    <>
      <Checkin authenticity_token={authenticity_token} />
    </>
  );
}

App.propTypes = {
  authenticity_token: PropTypes.string.isRequired
};
export default App;
