# FitSync - Comprehensive Fitness Synchronization Platform

FitSync is a holistic fitness ecosystem designed to bridge the gap between workout tracking, nutrition management, and AI-driven insights. It seamlessly integrates a cross-platform mobile application, a responsive web dashboard, a robust backend API, and advanced AI models to provide users with a personalized health experience.

## 🚀 Key Features

*   **Cross-Platform Mobile App**: Built with Flutter, offering a native experience on both Android and iOS. Tracks workouts, diet, and integrates with health data.
*   **Web Dashboard**: A React-based admin and user dashboard for detailed analytics, profile management, and visualization of fitness trends.
*   **AI-Powered Insights**:
    *   **Food Clustering**: Intelligent grouping of food items for better diet recommendations.
    *   **Workout Recommendations**: AI models to suggest workouts based on user goals and history.
    *   **Heart Beat Analysis**: Advanced analysis of heart rate data.
*   **Secure Authentication**: Robust user management using JWT, OAuth (Google, Facebook), and Passport.js.
*   **Real-Time Tracking**: Monitor progress with dynamic charts and logs.

## 🛠️ Technology Stack

FitSync utilizes a modern, full-stack architecture:

### 📱 Mobile (Flutter)
*   **Framework**: Flutter SDK (Dart)
*   **State Management**: Bloc
*   **Authentication**: Firebase Auth, Google Sign-In
*   **Integrations**: Health Connect, Local Notifications
*   **UI**: Cupertino Icons, Google Fonts, Syncfusion Charts

### 💻 Front-End (Web)
*   **Framework**: React.js
*   **Styling**: Vanilla CSS, FontAwesome
*   **Charts**: Chart.js, ApexCharts
*   **HTTP Client**: Axios

### 🔙 Back-End (API)
*   **Runtime**: Node.js
*   **Framework**: Express.js
*   **Database**: MongoDB (Mongoose ODM)
*   **Authentication**: Passport.js, JWT, BCrypt
*   **Security**: Helmet, XSS-Clean, Express-Rate-Limit

### � AI & Data Science
*   **Language**: Python
*   **API Framework**: FastAPI
*   **Libraries**: Pandas, Scikit-learn, NumPy, Diffusers, Transformers
*   **Notebooks**: Jupyter for data collection and model training

## 📂 Project Structure

```
FitSync/
├── Ai/                 # AI Models, Notebooks, and FastAPI Service
│   ├── api/            # FastAPI application
│   ├── data/           # Datasets (CSV, etc.)
│   └── models/         # Trained model files
├── Back-End/           # Node.js/Express Server
│   ├── config/         # DB and App Configuration
│   ├── controllers/    # Route Logic
│   ├── models/         # Mongoose Schemas
│   └── routes/         # API Endpoints
├── Front-End/          # React Web Application
│   └── fitsync/        # React Source Code
└── Mobile/             # Flutter Mobile Application
    └── fitsync/        # Dart Source Code
```

## 🏁 Getting Started

Follow these instructions to set up the project locally.

### Prerequisites
*   **Node.js** (v16+) & **npm**
*   **Flutter SDK** (v3.0+)
*   **Python** (v3.8+)
*   **MongoDB** (Local or Atlas URI)

### 1. Back-End Setup
Navigate to the backend directory and install dependencies:
```bash
cd Back-End
npm install
```
Create a `.env` file in `Back-End/` and configure your variables (PORT, MONGO_URI, JWT_SECRET, etc.).
Start the server:
```bash
npm start
```

### 2. Front-End Setup
Navigate to the frontend directory:
```bash
cd Front-End/fitsync
npm install
```
Start the React development server:
```bash
npm start
```

### 3. Mobile App Setup
Navigate to the mobile directory:
```bash
cd Mobile/fitsync
flutter pub get
```
Run the app on an emulator or physical device:
```bash
flutter run
```

### 4. AI Service Setup
Navigate to the AI API directory:
```bash
cd Ai/api
pip install -r requirements.txt
```
Start the FastAPI server:
```bash
uvicorn main:app --reload
```

## 📄 License

This project is licensed under the ISC License.
