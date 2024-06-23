import App from "./App";
import React from "react";
import ReactDOM from "react-dom/client";
import { GlobalProvider } from "./context/Global";
import { BrowserRouter } from "react-router-dom";
import { GoogleOAuthProvider } from "@react-oauth/google";

const root = ReactDOM.createRoot(document.getElementById("root"));

root.render(
  <React.StrictMode>
    <BrowserRouter>
      <GlobalProvider>
        <GoogleOAuthProvider clientId="402849239986-q62ii34ja4kb377hpnvn2uj1gim3fvvf.apps.googleusercontent.com">
          <App />
        </GoogleOAuthProvider>
      </GlobalProvider>
    </BrowserRouter>
  </React.StrictMode>
);
