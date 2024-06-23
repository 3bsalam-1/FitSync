import React, { useReducer, useState } from "react";
import "./ForgetPassword.css";
import Email from "./Email";
import Verification from "./Verification";
import NewPassword from "./NewPassword";
import Reset from "./Reset";
import { useNavigate } from "react-router-dom";

const ForgetPassword = () => {
  const link = useNavigate();
  const [currentPage, setCurrentPage] = useState(1);
  const reduce = (prev, next) => ({ ...prev, ...next });
  const [answers, setAnswers] = useReducer(reduce, {});

  const handleNext = (e, name) => {
    setAnswers({ [name]: e });
    setCurrentPage(currentPage + 1);
  };
  const handlePrevious = () => {
    setCurrentPage(currentPage - 1);
  };

  const handleSubmit = () => {
    link("/login");
  };

  return (
    <div className="ForgetPassword ">
      <nav className="sticky-top container">
        <div className="logo d-flex align-items-center">
          <img src="./images/logo.png" alt="logo"></img>
          <p>
            Fit<span>s</span>ync
          </p>
        </div>
      </nav>
      <div className="box-card text-center">
        {currentPage === 1 ? (
          <Email onNext={(Email) => handleNext(Email, "Email")} />
        ) : currentPage === 2 ? (
          <Verification
            onPrevious={handlePrevious}
            onNext={(tokenEmail) => handleNext(tokenEmail, "tokenEmail")}
            Email={answers.Email}
          />
        ) : currentPage === 3 ? (
          <NewPassword
            onPrevious={handlePrevious}
            onNext={(status) => handleNext(status, "status")}
            token={answers.tokenEmail}
          />
        ) : (
          <Reset onSubmit={handleSubmit} />
        )}
      </div>
    </div>
  );
};

export default ForgetPassword;
