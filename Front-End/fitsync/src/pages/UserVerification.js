import React, { useContext, useEffect, useState } from "react";
import { toast } from "react-toastify";
import { Global } from "../context/Global";
import Swal from "sweetalert2";
import "./verificationCode/ForgetPassword.css";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const UserVerification = () => {
  const { user, setUser } = useContext(Global);
  const link = useNavigate();
  // Input that are taken from the user ################################################################
  const [verification, setVerification] = useState({
    n1: "",
    n2: "",
    n3: "",
    n4: "",
    n5: "",
    n6: "",
  });
  const onInputChange = (e, field) => {
    const value = e.target.value;
    setVerification((prevVerification) => ({
      ...prevVerification,
      [field]: value,
    }));
  };
  // loading ################################################################
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    const bgLoadingElements = document.getElementsByClassName("box-card");
    if (loading) {
      for (let i = 0; i < bgLoadingElements.length; i++) {
        bgLoadingElements[i].classList.add("bg-Opacity");
      }
      console.log("loading...", bgLoadingElements.length);
    } else {
      for (let i = 0; i < bgLoadingElements.length; i++) {
        bgLoadingElements[i].classList.remove("bg-Opacity");
      }
      console.log("End", bgLoadingElements.length);
    }
  }, [loading]);
  // Copy and Paste ################################################################
  const handlePaste = (e) => {
    e.preventDefault();
    const pastedData = e.clipboardData.getData("text/plain").trim();
    if (pastedData.length !== 6 || !/^\d+$/.test(pastedData)) {
      alert("Invalid code format. Please paste a 6-digit numeric code.");
      return;
    }
    [...Array(6).keys()].forEach((index) =>
      setVerification((prevState) => ({
        ...prevState,
        [`n${index + 1}`]: pastedData.charAt(index),
      }))
    );
  };
  // console.log(user);
  // console.log(user.authToken);
  // console.log("firstTime", user.authToken.firstTime);
  // Submit ################################################################
  let authToken;
  const handleSubmit = async (e) => {
    e.preventDefault();
    const enteredCode = Object.values(verification).join("");

    try {
      setLoading(true);
      const response = await fetch(
        "https://fitsync.onrender.com/api/auth/verfiy",
        {
          method: "POST",
          headers: {
            "content-type": "application/json",
            Authorization: `Bearer ${user.authToken}`,
          },
          body: JSON.stringify({
            code: enteredCode,
          }),
        }
      );
      if (!response.ok) {
        Swal.fire({
          title: "Error",
          text: "Failed to login user",
          icon: "error",
        });
        setLoading(false);
        return;
      }
      const data = await response.json();
      authToken = data.token;
      toast.success("Registered successfully");
      console.log("Data", data);
      setUser({ authToken });
      setLoading(false);
      link("/WelcomScreen");
    } catch (err) {
      toast.error("Failed" + err.message);
    }
  };
  // Resend ################################################################
  const Resend = async () => {
    try {
      const response = await axios.get(
        "https://fitsync.onrender.com/api/auth/sendCodeVerify",
        {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${user.authToken}`,
          },
        }
      );
      console.log(response.data); // Assuming the response contains data
    } catch (error) {
      console.error("Error fetching Code:", error);
    }
  };
  return (
    <div className="ForgetPassword">
      <nav className="sticky-top container">
        <div className="logo d-flex align-items-center">
          <img src="./images/logo.png" alt="logo"></img>
          <p>
            Fit<span>s</span>ync
          </p>
        </div>
      </nav>
      <div className="box-card text-center">
        <div className="image d-flex justify-content-center align-items-center">
          <img src="./images/Email.png" alt="Email" />
        </div>
        <h1>Verification </h1>
        <p>
          We sent a reset link to <span>contact@dscode...com</span> enter 6
          digit code that mentioned in the email
        </p>
        <form onSubmit={handleSubmit}>
          <div className="UserVerification">
            {[...Array(6).keys()].map((index) => (
              <div key={index}>
                <input
                  className="n"
                  type="text"
                  value={verification[`n${index + 1}`]}
                  onChange={(e) => onInputChange(e, `n${index + 1}`)}
                  maxLength={1}
                  onPaste={handlePaste}
                  required
                />
              </div>
            ))}
          </div>
          <p className="text-center">
            Haven’t got the email yet?
            <button onClick={Resend}>Resend email</button>
          </p>
          <input type="submit" value="Verify Code" />
        </form>
      </div>
    </div>
  );
};

export default UserVerification;
