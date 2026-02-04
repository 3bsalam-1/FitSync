# FitSync Backend API

The **FitSync Backend** is a robust RESTful API built with **Node.js** and **Express.js**, serving as the central hub for the FitSync ecosystem. It manages user authentication, data persistence, and communication between the mobile app, web dashboard, and AI service.

## 🛠 Technology Stack
*   **Runtime**: Node.js
*   **Framework**: Express.js
*   **Database**: MongoDB (via Mongoose)
*   **Authentication**: Passport.js (Google/Facebook OAuth), JWT (JSON Web Tokens)
*   **Security**: Helmet, XSS-Clean, Express-Mongo-Sanitize, Rate Limiting
*   **Logging**: Morgan (Development)

## 📂 Project Structure
```bash
Back-End/
├── config/             # Database connection & Passport strategies
├── controllers/        # Business logic for API endpoints
├── models/             # Mongoose schemas (User, Activity, etc.)
├── routes/             # API Route definitions
├── utils/              # Helper functions (AppError, standard responses)
└── app.js              # Application entry point
```

## 🚀 Getting Started

### Prerequisites
*   Node.js (v14+)
*   MongoDB Instance (Local or Atlas)

### Environment Variables
Create a `.env` file in the root of `Back-End/` with the following variables:
```env
PORT=3000
DATABASE=mongodb://localhost:27017/fitsync
JWT_SECRET=your-very-secure-secret
JWT_EXPIRES_IN=90d
GOOGLE_CLIENT_ID=your-google-id
GOOGLE_CLIENT_SECRET=your-google-secret
FACEBOOK_APP_ID=your-facebook-id
FACEBOOK_APP_SECRET=your-facebook-secret
```

### Installation
1.  Navigate to the backend directory:
    ```bash
    cd Back-End
    ```
2.  Install dependencies:
    ```bash
    npm install
    ```

### Running the Server
*   **Development** (with Nodemon):
    ```bash
    npm start
    ```
*   **Production**:
    ```bash
    node app.js
    ```

## 📡 API Endpoints

### Authentication (`/api/auth`)
*   `POST /signup`: Register a new user.
*   `POST /login`: Authenticate existing user.
*   `GET /logout`: Logout user.

### User Management (`/api/user`)
*   `GET /me`: Get current user profile.
*   `PATCH /updateMe`: Update user details.
*   `DELETE /deleteMe`: Deactivate account.

### Health Data
*   `POST /api/userInfo`: Submit health metrics (weight, height, etc.).
*   `GET /api/vitalsignal`: Retrieve recorded vital signals.
*   `GET /api/activity`: Retrieve log of user activities.

## 🔒 Security Features
*   **Data Sanitization**: Prevents NoSQL injection and XSS attacks.
*   **Rate Limiting**: Limits repeated requests to prevent brute-force attacks.
*   **Secure Headers**: set via `helmet`.