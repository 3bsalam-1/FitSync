import React from "react";
import { Navigate } from "react-router-dom";

const PrivateRouteHome = ({ children }) => {
  const authToken = sessionStorage.getItem("authToken"); // survey
  return authToken ? children : <Navigate to="/" />;
};
export default PrivateRouteHome;
