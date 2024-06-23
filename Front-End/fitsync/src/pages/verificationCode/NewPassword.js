import React, { useEffect, useReducer, useState } from "react";
import { toast } from "react-toastify";
import Loading from "../../components/Loading";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEye } from "@fortawesome/free-solid-svg-icons";
import { faEyeSlash } from "@fortawesome/free-solid-svg-icons";

const NewPassword = ({ onPrevious, onNext, token }) => {
  console.log("token", token);
  // Input that are taken from the user ################################################################
  const reducer = (prev, next) => ({ ...prev, ...next });
  const [{ password, passwordConfirm }, setpassword] = useReducer(reducer, {
    password: "",
    passwordConfirm: "",
  });
  const onInputChange = (e) => {
    const inputName = e.target.name;
    const value = e.target.value;
    setpassword({ [inputName]: value });
  };
  // showPassword ################################################################
  const [
    { showPassword1, showPassword2, typePassword1, typePassword2 },
    setShowPassword,
  ] = useReducer(reducer, {
    showPassword1: false,
    showPassword2: false,
    typePassword1: "password",
    typePassword2: "password",
  });
  useEffect(() => {
    if (showPassword1) {
      setShowPassword({
        showPassword1: true,
        typePassword1: "text",
      });
    } else {
      setShowPassword({
        showPassword1: false,
        typePassword1: "password",
      });
    }

    if (showPassword2) {
      setShowPassword({
        showPassword2: true,
        typePassword2: "text",
      });
    } else {
      setShowPassword({
        showPassword2: false,
        typePassword2: "password",
      });
    }
  }, [showPassword1, showPassword2]);
  const togglePasswordVisibility1 = () => {
    setShowPassword({ showPassword1: !showPassword1 });
  };
  const togglePasswordVisibility2 = () => {
    setShowPassword({ showPassword2: !showPassword2 });
  };
  // loading ################################################################
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    const bgLoadingElements = document.getElementsByClassName("NewPassword");
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
        "https://fitsync.onrender.com/api/auth/resetPassword",
        {
          method: "POST",
          headers: {
            "content-type": "application/json",
            Authorization: `Bearer ${token}`,
          },
          body: JSON.stringify({
            password: password,
            passwordConfirm: passwordConfirm,
          }),
        }
      );
      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }
      const data = await response.json();
      toast.success("Registered successfully");
      console.log("resetPassword", data);
      console.log(data.status);

      onNext(data.status);
      setLoading(false);
    } catch (err) {
      toast.error("Failed" + err.message);
    }
  };

  return (
    <div>
      {loading ? <Loading /> : null}
      <div className="NewPassword">
        <div className="text-center">
          <button className="Back" onClick={onPrevious}>
            <i className="fa-solid fa-arrow-left"></i>
          </button>
          <div className="image d-flex justify-content-center align-items-center">
            <img src="./images/key.png" alt="Key" />
          </div>
          <h1>Set a new password</h1>
          <p>
            Create a new password. Ensure it differs from previous ones for
            security
          </p>
        </div>
        <form onSubmit={handleSubmit} className="text-start">
          <div className="password position-relative mt-5">
            <img src="./images/Lock.png" alt="Lock" />
            <input
              type={typePassword1}
              name="password"
              onChange={onInputChange}
              value={password}
              placeholder="Password"
              minLength={8}
              required
            />
            <button type="button" onClick={togglePasswordVisibility1}>
              {showPassword1 ? (
                <FontAwesomeIcon icon={faEye} />
              ) : (
                <FontAwesomeIcon icon={faEyeSlash} />
              )}
            </button>
          </div>

          <p className="characters-8 ">Must be at least 8 characters</p>

          <div className="password position-relative">
            <img src="./images/Lock.png" alt="Lock" />
            <input
              type={typePassword2}
              name="passwordConfirm"
              onChange={onInputChange}
              value={passwordConfirm}
              placeholder="Confirm Password"
              minLength={8}
              required
            />
            <button type="button" onClick={togglePasswordVisibility2}>
              {showPassword2 ? (
                <FontAwesomeIcon icon={faEye} />
              ) : (
                <FontAwesomeIcon icon={faEyeSlash} />
              )}
            </button>
          </div>

          <input type="submit" value="Update Password" />
        </form>
      </div>
    </div>
  );
};

export default NewPassword;
