// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBv2fNnBa_FhLuAqwjMjWaECtU4PwK7woE",
  authDomain: "test13-73bc4.firebaseapp.com",
  projectId: "test13-73bc4",
  storageBucket: "test13-73bc4.appspot.com",
  messagingSenderId: "801450604084",
  appId: "1:801450604084:web:a6bddfb328361e87017c61",
  measurementId: "G-0BQD9865GF"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);