import React, { useEffect, useReducer, useState } from "react";
import "./Login.css";
import "./Signup.css";
import Loading from "../components/Loading";
import axios from "axios";
import { toast } from "react-toastify";
import { jwtDecode } from "jwt-decode";
import { Link, useNavigate } from "react-router-dom";
import { useGoogleLogin } from "@react-oauth/google";
import ErrorMessage from "../components/ErrorMessage";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEye } from "@fortawesome/free-solid-svg-icons";
import { faEyeSlash } from "@fortawesome/free-solid-svg-icons";

const Signup = () => {
  const link = useNavigate();
  // Input that are taken from the user ################################################################
  const reducer = (prev, next) => ({ ...prev, ...next });
  const [
    { firstName, lastName, username, email, password, passwordConfirm, agree },
    setState,
  ] = useReducer(reducer, {
    firstName: "",
    lastName: "",
    username: "",
    email: "",
    password: "",
    passwordConfirm: "",
    agree: false,
  });
  const onInputChange = (e) => {
    const inputName = e.target.name;
    const value = e.target.value;
    setState({ [inputName]: value });
  };
  // loading ################################################################
  const [loading, setLoading] = useState(false);
  useEffect(() => {
    const bgLoadingElements = document.getElementsByClassName("box-card");
    if (loading) {
      for (let i = 0; i < bgLoadingElements.length; i++) {
        bgLoadingElements[i].classList.add("bg-Opacity");
      }
    } else {
      for (let i = 0; i < bgLoadingElements.length; i++) {
        bgLoadingElements[i].classList.remove("bg-Opacity");
      }
    }
  }, [loading]);

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
  // Error ################################################################
  const [{ error, message }, setErrorMessage] = useReducer(reducer, {
    error: false,
    message: "",
  });
  // submit ################################################################
  let authToken;
  const submit = async (e) => {
    e.preventDefault();
    if (passwordConfirm !== password) {
      alert("Passwords don't match");
    } else {
      try {
        setLoading(true);
        const response = await fetch(
          "https://fitsync.onrender.com/api/auth/register",
          {
            method: "POST",
            headers: { "content-type": "application/json" },
            body: JSON.stringify({
              firstName: firstName,
              lastName: lastName,
              username: username,
              email: email,
              password: password,
              passwordConfirm: passwordConfirm,
            }),
          }
        );
        if (!response.ok) {
          setLoading(false);
          const responseData = await response.json();
          setErrorMessage({ error: true, message: responseData.message });
          return;
        }
        const data = await response.json();
        authToken = data.token; // Assign the token to the variable
        toast.success("Registered successfully");
        window.sessionStorage.setItem("authToken", authToken);
        setLoading(false);
        window.sessionStorage.setItem("Userverify", true);
        link("/UserVerification");
      } catch (err) {
        // toast.error("Failed" + err.message);
        setErrorMessage({
          error: true,
          message: "Failed to connect to the server",
        });
      }
    }
  };
  // Google signup ################################################################
  async function handleCallbackResponse(userData) {
    try {
      setLoading(true);
      const response = await fetch(
        "https://fitsync.onrender.com/api/auth/ContinueWithGoogle",
        {
          method: "POST",
          headers: { "content-type": "application/json" },
          body: JSON.stringify({
            name: userData.name,
            email: userData.email,
            avatar: userData.picture,
          }),
        }
      );
      if (!response.ok) {
        setLoading(false);
        const responseData = await response.json();
        setErrorMessage({ error: true, message: responseData.message });
        return;
      }
      const data = await response.json();
      authToken = data.token;
      toast.success("Registered successfully");

      authToken = data.token;
      window.sessionStorage.setItem("authToken", authToken);
      setLoading(false);
      let firstTime = jwtDecode(authToken).firstTime;
      if (firstTime) {
        window.sessionStorage.setItem("firstTime", firstTime);
        link("/WelcomScreen");
      } else {
        link("/Home");
      }
    } catch (err) {
      setErrorMessage({
        error: true,
        message: "Failed to connect to the server",
      });
    }
  }
  const login = useGoogleLogin({
    onSuccess: (response) => {
      axios
        .get(
          `https://www.googleapis.com/oauth2/v1/userinfo?access_token=${response.access_token}`,
          {
            headers: {
              Authorization: `Bearer ${response.access_token}`,
            },
          }
        )
        .then((res) => {
          handleCallbackResponse(res.data);
        })
        .catch((err) => {
          setErrorMessage({ error: true, message: err });
        });
    },
    onError: (error) => setErrorMessage({ error: true, message: error }),
  });
  return (
    <div>
      {loading ? <Loading /> : null}
      {error ? (
        <ErrorMessage
          message={message}
          ClosedError={(e) => setErrorMessage({ error: e, message: "" })}
        />
      ) : null}
      <nav className="sticky-top container">
        <div className="logo d-flex align-items-center">
          <img src="./images/logo.png" alt="logo"></img>
          <p>
            Fit<span>s</span>ync
          </p>
        </div>
      </nav>
      <div className="box-card text-center mt-4">
        <form onSubmit={submit}>
          <p className="Welcome">Hi!</p>
          <h1> Create your account</h1>
          <div className="field position-relative">
            <i className="fa-regular fa-user"></i>{" "}
            <input
              type="text"
              name="username"
              onChange={onInputChange}
              value={username}
              placeholder="User Name"
              required
            />
          </div>
          <div className="fname-lname">
            <div className="field position-relative">
              <i className="fa-regular fa-user"></i>{" "}
              <input
                className="mb-0"
                type="text"
                name="firstName"
                onChange={onInputChange}
                value={firstName}
                placeholder="First Name"
                required
              />
            </div>
            <div className="field position-relative">
              <i className="fa-regular fa-user"></i>{" "}
              <input
                className="mb-0"
                type="text"
                name="lastName"
                onChange={onInputChange}
                value={lastName}
                placeholder="Last Name"
                required
              />
            </div>
          </div>

          <div className="field position-relative">
            <img src="./images/Icon-Email.png" alt="Email" />
            <input
              type="email"
              name="email"
              onChange={onInputChange}
              value={email}
              placeholder="Email"
              required
            />
          </div>
          <div className="password position-relative">
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
          <div className="privacy d-flex align-items-center">
            <input
              type="checkbox"
              onChange={() => setState({ agree: !agree })}
              checked={agree}
            ></input>
            <label>
              I‘ve read and agree with <span>terms pf service</span> and our
              <span> privacy policy</span>
            </label>
          </div>
          <input type="submit" value="Sign Up" disabled={!agree} />
        </form>
        <p className="mt-3 mb-3 text-black-50">or</p>
        <div>
          <button
            className="Google btn btn-lg d-flex justify-content-around align-items-center"
            onClick={login}
          >
            <img src="./images/Google.png" alt="Google"></img>
            <span className="text-capitalize">Continue With Google</span>
          </button>
          <button className="Facebook btn btn-lg fw-bold d-flex justify-content-around align-items-center">
            <img src="./images/Facebook2.png" alt="Facebook"></img>
            <span className="text-capitalize">Continue With Facebook</span>
          </button>
        </div>
      </div>
      <div className="text-center">
        Do you have an account? <Link to="/login">Sign in</Link>
      </div>
    </div>
  );
};

export default Signup;
