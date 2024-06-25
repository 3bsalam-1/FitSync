import React from "react";

const Reset = ({ onSubmit }) => {
  return (
    <div className="reset">
      <div className="text-center">
        <div className="mt-4 image d-flex justify-content-center align-items-center">
          <img src="./images/True.png" alt="True" />
        </div>
        <h1>Password reset</h1>
        <p className="text-black mb-5 fw-normal">
          Your password has been successfully reset Click below to log in
          magically
        </p>
      </div>
      <button onClick={onSubmit}>Back to login</button>
    </div>
  );
};

export default Reset;
