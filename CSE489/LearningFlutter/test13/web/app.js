// Firebase UI configuration
const uiConfig = {
    signInSuccessUrl: '/',
    signInOptions: [
        firebase.auth.EmailAuthProvider.PROVIDER_ID,
        firebase.auth.GoogleAuthProvider.PROVIDER_ID
    ],
    tosUrl: '/terms-of-service',
    privacyPolicyUrl: '/privacy-policy'
};

// Initialize the FirebaseUI Widget using Firebase
const ui = new firebaseui.auth.AuthUI(firebase.auth());

// The start method will wait until the DOM is loaded
ui.start('#firebaseui-auth-container', uiConfig);

// Show a loading spinner while FirebaseUI loads
document.getElementById('loader').style.display = 'none';

// Registration Form
const registrationForm = document.getElementById('registration-form');

registrationForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const email = document.getElementById('registration-email').value;
    const password = document.getElementById('registration-password').value;

    firebase.auth().createUserWithEmailAndPassword(email, password)
        .then((userCredential) => {
            // Redirect to homepage after successful registration
            window.location.href = '/';
        })
        .catch((error) => {
            console.error('Registration error:', error.message);
        });
});

// Login Form
const loginForm = document.getElementById('login-form');

loginForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const email = document.getElementById('login-email').value;
    const password = document.getElementById('login-password').value;

    firebase.auth().signInWithEmailAndPassword(email, password)
        .then((userCredential) => {
            // Redirect to homepage after successful login
            window.location.href = '/';
        })
        .catch((error) => {
            console.error('Login error:', error.message);
        });
});
