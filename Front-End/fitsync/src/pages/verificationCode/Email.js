import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { toast } from "react-toastify";
import Loading from "../../components/Loading";

// import axios from "axios";

const Email = ({ onNext }) => {
  // Input that are taken from the user ################################################################
  const [Email, setEmail] = useState("");
  const onInputChange = (e) => {
    setEmail(e.target.value);
  };
  // loading ################################################################
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    const bgLoadingElements = document.getElementsByClassName("Email");
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
  // Submit ################################################################
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      setLoading(true);
      const response = await fetch(
        "https://fitsync.onrender.com/api/auth/forgetPassword",
        {
          method: "POST",
          headers: { "content-type": "application/json" },
          body: JSON.stringify({
            email: Email,
          }),
        }
      );
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      const data = await response.json();
      toast.success("Registered successfully");
      console.log(data.status);
      onNext(Email);
      setLoading(false);
    } catch (err) {
      toast.error("Failed" + err.message);
    }
  };

  return (
    <div>
      {loading ? <Loading /> : null}
      <div className="Email">
        <Link to="/login">
          <button className="Back">
            <i className="fa-solid fa-angle-left"></i>
          </button>
        </Link>
        <div className="image d-flex justify-content-center align-items-center">
          <img src="./images/key.png" alt="Key" />
        </div>
        <h1>Forgot your password ?</h1>
        <p>Please enter your email to reset the password </p>
        <form onSubmit={handleSubmit}>
          <div className="field position-relative mt-5">
            <i className="far fa-envelope fa-lg "></i>
            <input
              type="email"
              name="Email"
              onChange={onInputChange}
              value={Email}
              placeholder="Email"
            />
          </div>
          <input type="submit" value="Reset Password" />
        </form>
      </div>
    </div>
  );
};

export default Email;
