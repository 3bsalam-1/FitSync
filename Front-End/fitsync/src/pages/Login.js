import React, { useEffect, useReducer, useState } from "react";
import "./Login.css";
import Loading from "../components/Loading";
import axios from "axios";
import { jwtDecode } from "jwt-decode";
import { toast } from "react-toastify";
import { Link, useNavigate } from "react-router-dom";
import { useGoogleLogin } from "@react-oauth/google";
import ErrorMessage from "../components/ErrorMessage";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEye } from "@fortawesome/free-solid-svg-icons";
import { faEyeSlash } from "@fortawesome/free-solid-svg-icons";

const Login = () => {
  const link = useNavigate();

  // Input that are taken from the user ################################################################
  const reducer = (prev, next) => ({ ...prev, ...next });
  const [{ username, password }, setState] = useReducer(reducer, {
    username: "",
    password: "",
  });
  const onInputChange = (e) => {
    const inputName = e.target.name;
    const value = e.target.value;
    setState({ [inputName]: value });
  };

  // showPassword ################################################################
  const [{ showPassword, typePassword }, setShowPassword] = useReducer(
    reducer,
    {
      showPassword: false,
      typePassword: "password",
    }
  );
  useEffect(() => {
    if (showPassword) {
      setShowPassword({
        showPassword: true,
        typePassword: "text",
      });
    } else {
      setShowPassword({
        showPassword: false,
        typePassword: "password",
      });
    }
  }, [showPassword]);
  const togglePasswordVisibility = () => {
    setShowPassword({ showPassword: !showPassword });
  };

  // Loading ################################################################
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

  // Error ################################################################
  const [{ error, message }, setErrorMessage] = useReducer(reducer, {
    error: false,
    message: "",
  });
  // submit ################################################################
  let authToken;
  const submit = async (e) => {
    e.preventDefault();
    try {
      setLoading(true);
      const response = await fetch(
        "https://fitsync.onrender.com/api/auth/login",
        {
          method: "POST",
          headers: { "content-type": "application/json" },
          body: JSON.stringify({
            email: username,
            password: password,
          }),
        }
      );
      if (!response.ok) {
        setLoading(false);
        const responseData = await response.json();
        setErrorMessage({ error: true, message: responseData.message });
        return;
      }
      setLoading(false);
      const data = await response.json();
      toast.success("Registered successfully");
      authToken = data.token;
      window.sessionStorage.setItem("authToken", authToken);
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
          // console.log("Error1: ", err);
        });
    },
    onError: (error) => setErrorMessage({ error: true, message: error }),
    // onError: (error) => console.log("Login Failed:", error),
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
      <div className="box-card text-center">
        <form onSubmit={submit}>
          <p className="Welcome">Welcome Back!</p>
          <h1>Sign In</h1>

          <div className="field position-relative">
            <img src="./images/Icon-Email.png" alt="Email" />
            <input
              type="email"
              name="username"
              onChange={onInputChange}
              value={username}
              placeholder="Email"
              required
            />
          </div>
          <div className="password position-relative">
            <img src="./images/Lock.png" alt="Lock" />
            <input
              type={typePassword}
              name="password"
              onChange={onInputChange}
              value={password}
              placeholder="Password"
              required
            />
            <button type="button" onClick={togglePasswordVisibility}>
              {showPassword ? (
                <FontAwesomeIcon icon={faEye} />
              ) : (
                <FontAwesomeIcon icon={faEyeSlash} />
              )}
            </button>
          </div>

          <p className="forgot text-end">
            <Link to="/ForgetPassword">Forgot Password?</Link>
          </p>
          <input type="submit" value="Sign In" />
        </form>
        <p>or</p>
        <div>
          <button
            className="Google btn btn-lg d-flex justify-content-around align-items-center"
            onClick={login}
          >
            <img src="./images/Google.png" alt="Google"></img>
            <span className="text-capitalize">Continue With Google</span>
          </button>
          <button className="Facebook btn btn-lg d-flex justify-content-around align-items-center">
            <img src="./images/Facebook2.png" alt="Facebook"></img>
            <span className="text-capitalize">Continue With Facebook</span>
          </button>
        </div>
      </div>
      <div className="text-center">
        Don’t have an account? <Link to="/signup">Sign up</Link>
      </div>
    </div>
  );
};

export default Login;
