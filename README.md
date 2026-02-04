# FitSync - Holistic Fitness Synchronization Platform

FitSync is a comprehensive ecosystem designed to bridge the gap between workout tracking, nutrition management, and personalized health insights. By integrating a responsive web dashboard, a cross-platform mobile application, and an advanced AI engine, FitSync provides users with a seamless and intelligent fitness experience.

---

## 🚀 Key Features

*   **Cross-Platform Mobile App**: Native experience on iOS and Android for on-the-go tracking.
*   **Web Dashboard**: Detailed analytics and management portal for users and admins.
*   **AI-Driven Insights**:
    *   **Workout Recommendations**: Personalized routines based on goals and user history.
    *   **Dietary Analysis**: Food clustering and calorie estimation.
    *   **Health Monitoring**: Heart beat analysis and trend prediction.
*   **Real-Time Synchronization**: Seamless data sync between mobile and web platforms.
*   **Social Integration**: Community features and easy sharing.

---

## 🏗 System Architecture

FitSync operates on a modern full-stack architecture:

*   **Frontend (Web)**: React.js
*   **Mobile**: Flutter (Dart)
*   **Backend**: Node.js & Express.js
*   **Database**: MongoDB
*   **AI Engine**: Python (FastAPI)

---

## 🛠 Technology Stack

### Mobile (`/Mobile`)
*   **Framework**: Flutter
*   **State Management**: Bloc / Cubit
*   **Auth**: Firebase & Google Sign-In
*   **Integration**: Health Connect

### Frontend (`/Front-End`)
*   **Framework**: React.js
*   **Charts**: ApexCharts, Chart.js
*   **Icons**: FontAwesome
*   **State**: Context API / Local State

### Backend (`/Back-End`)
*   **Runtime**: Node.js
*   **Framework**: Express.js
*   **Security**: Passport.js, JWT, Helmet
*   **Storage**: Cloudinary (Images), MongoDB (Data)

### AI Service (`/Ai`)
*   **Framework**: FastAPI
*   **ML Libraries**: Scikit-learn, Pandas, NumPy
*   **Models**: Custom clustering and regression models

---

## 📂 Project Structure

```bash
FitSync/
├── Ai/                 # Python AI Service & Notebooks
│   ├── api/            # FastAPI Application
│   ├── data/           # Training Datasets
│   └── models/         # Serialized ML Models
├── Back-End/           # Node.js API Server
│   ├── config/         # Environment Config
│   ├── controllers/    # Request Handlers
│   ├── models/         # Database Schemas
│   └── routes/         # API Endpoints
├── Front-End/          # React Web App
│   └── fitsync/        # Source Code
└── Mobile/             # Flutter App
    └── fitsync/        # Source Code
```

---

## 🏁 Getting Started

### Prerequisites
*   Node.js (v18+)
*   Python (v3.9+)
*   Flutter SDK (v3.16+)
*   MongoDB Instance

### Installation

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/yourusername/FitSync.git
    cd FitSync
    ```

2.  **Setup Backend**
    ```bash
    cd Back-End
    npm install
    # Configure .env file
    npm start
    ```

3.  **Setup AI Service**
    ```bash
    cd ../Ai/api
    pip install -r requirements.txt
    uvicorn main:app --reload
    ```

4.  **Setup Frontend**
    ```bash
    cd ../../Front-End/fitsync
    npm install
    npm start
    ```

5.  **Setup Mobile**
    ```bash
    cd ../../Mobile/fitsync
    flutter pub get
    flutter run
    ```

---


## Credits

This project was proudly created by **Tech Dragons 🐲**.

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

