// Toggle between sign-up and sign-in forms
document.querySelectorAll('.img-btn').forEach(button => {
  button.addEventListener('click', function() {
      const container = document.querySelector('.cont');
      container.classList.toggle('s-signup');
  });
});

// Sign Up
document.getElementById('signUpBtn').addEventListener('click', function() {
  const name = document.getElementById('nameInput').value;
  const email = document.getElementById('signupEmailInput').value;
  const password = document.getElementById('signupPasswordInput').value;
  const confirmPassword = document.getElementById('confirmPasswordInput').value;

  if (password !== confirmPassword) {
      window.alert("Passwords do not match. Please try again.");
      return;
  }

  // Your sign-up logic here
});

// Sign In
document.getElementById('signInBtn').addEventListener('click', function() {
  const email = document.getElementById('emailInput').value;
  const password = document.getElementById('passwordInput').value;

  // Your sign-in logic here
});

// Import necessary Firebase modules
import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-auth.js";
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/10.11.0/firebase-analytics.js";
 
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
function signUp(name, email, password) {
  return createUserWithEmailAndPassword(auth, email, password);
}

// Function to handle user sign-in
function signIn(email, password) {
  return signInWithEmailAndPassword(auth, email, password);
}
