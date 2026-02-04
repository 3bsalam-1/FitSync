# FitSync Web Dashboard

The **FitSync Web Dashboard** is a responsive single-page application (SPA) built with **React.js**. It provides users with a comprehensive view of their fitness journey, including detailed analytics, profile management, and social features.

## 🛠 Technology Stack
*   **Framework**: React.js (Create React App)
*   **Routing**: React Router DOM (v6)
*   **State Management**: Context API / Local State
*   **Data Visualization**: ApexCharts, Chart.js
*   **Styling**: CSS3, FontAwesome
*   **HTTP Client**: Axios
*   **Notifications**: React Toastify, SweetAlert2

## 📂 Project Structure
```bash
Front-End/fitsync/
├── public/             # Static assets
└── src/
    ├── assets/         # Images and global styles
    ├── components/     # Reusable UI components
    ├── pages/          # Page views (Dashboard, Login, Profile, etc.)
    ├── context/        # React Context providers
    └── App.js          # Main component
```

## 🚀 Getting Started

### Prerequisites
*   Node.js (v14+)
*   npm

### Installation
1.  Navigate to the frontend directory:
    ```bash
    cd Front-End/fitsync
    ```
2.  Install dependencies:
    ```bash
    npm install
    ```

### Development
Start the development server with hot-reloading:
```bash
npm start
```
The app will be accessible at `http://localhost:3000`.

### Building for Production
Create an optimized production build:
```bash
npm run build
```
Build artifacts will be stored in the `build/` directory.

## ✨ Key Features
*   **Dashboard**: Overview of calories burned, steps taken, and sleep patterns.
*   **Activity Log**: Detailed history of workouts and exercises.
*   **Profile Management**: Update personal details and fitness goals.
*   **Visual Analytics**: Interactive charts to visualize progress over time.
