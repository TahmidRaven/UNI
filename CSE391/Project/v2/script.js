document.querySelector('.img-btn').addEventListener('click', function() {
  document.querySelector('.cont').classList.toggle('s-signup');
});

// script.js

// Sign Up
document.querySelector('.submit').addEventListener('click', function() {
  const email = document.querySelector('input[name="email"]').value;
  const password = document.querySelector('input[name="password"]').value;

  signUp(email, password)
    .then((userCredential) => {
      // Signed up successfully
      const user = userCredential.user;
      window.alert("Success! Account created.");
    })
    .catch((error) => {
      // Handle sign-up errors
      window.alert("Error occurred. Try again.");
    });
});

// Sign In
document.querySelector('.m-in').addEventListener('click', function() {
  const email = document.querySelector('input[name="email"]').value;
  const password = document.querySelector('input[name="password"]').value;

  signIn(email, password)
    .then((userCredential) => {
      // Signed in successfully
      const user = userCredential.user;
      window.alert("Success! Welcome back!");
    })
    .catch((error) => {
      // Handle sign-in errors
      window.alert("Error occurred. Try again.");
    });
});
// firebaseauth.js

// Import necessary Firebase modules
import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-auth.js";
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-analytics.js";

// Your web app's Firebase configuration
const firebaseConfig = {
apiKey: "AIzaSyB-TLVVUE2xsppuu9rWYN7tLJSyT3aPNaw",
authDomain: "kaijuuweb.firebaseapp.com",
projectId: "kaijuuweb",
storageBucket: "kaijuuweb.appspot.com",
messagingSenderId: "460667924970",
appId: "1:460667924970:web:93716a198a37ceefe3c293",
measurementId: "G-RDZKKYDSJZ"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);

// Get a reference to the Firebase authentication service
const auth = getAuth(app);

// Function to handle user sign-up
export function signUp(email, password) {
return createUserWithEmailAndPassword(auth, email, password);
}

// Function to handle user sign-in
export function signIn(email, password) {
return signInWithEmailAndPassword(auth, email, password);
}
