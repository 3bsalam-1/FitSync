import React from "react";
import { Navigate } from "react-router-dom";

const PrivateRouteUserverify = ({ children }) => {
  const Userverify = sessionStorage.getItem("Userverify"); // UserVerification
  return Userverify ? children : <Navigate to="/" />;
};
export default PrivateRouteUserverify;
