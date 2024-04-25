// Get elements
const pomodoroElement = document.getElementById('pomodoro');
const startButton = document.getElementById('start');
const pauseButton = document.getElementById('pause');
const resetButton = document.getElementById('reset');
const pomodoroState = document.getElementById('pomodoro-state');

// Pomodoro timer variables
let minutes = 25;
let seconds = 0;
let timer;
let isPaused = true;
let completedSessions = 0; // Number of completed sessions
let phase = 'focus'; // Initial phase is focus session

// Function to update the timer display
function updateTimer() {
    pomodoroElement.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
}

// Function to update the Pomokaijuu state and progress text
function updatePomokaijuuState() {
    const progressText = isPaused ? 'Paused' : `${phase.charAt(0).toUpperCase() + phase.slice(1)} (${completedSessions}/4)`;
    pomodoroState.textContent = progressText;
}

// Function to start the timer
function startTimer() {
    if (isPaused) {
        isPaused = false;
        updatePomokaijuuState();
        timer = setInterval(() => {
            if (seconds === 0) {
                if (minutes === 0) {
                    clearInterval(timer);
                    // Timer finished
                    alert('Pomodoro completed!');
                    isPaused = true;
                    updatePomokaijuuState();
                    if (phase === 'focus') {
                        // Start a break session
                        phase = 'break';
                        completedSessions++;
                        if (completedSessions % 4 === 0) {
                            // Long break after 4 focus sessions
                            minutes = 15; // Adjust the duration of the long break as needed
                            alert('Take a long break!');
                        } else {
                            // Short break after each focus session
                            minutes = 5; // Adjust the duration of the short break as needed
                            alert('Take a short break!');
                        }
                    } else {
                        // Start a focus session
                        phase = 'focus';
                        minutes = 25; // Duration of focus session
                        alert('Get back to focusing!');
                    }
                    seconds = 0;
                    updateTimer();
                    updatePomokaijuuState(); // Update progress text
                } else {
                    minutes--;
                    seconds = 59;
                }
            } else {
                seconds--;
            }
            updateTimer();
        }, 1000);
    }
}

// Function to pause the timer
function pauseTimer() {
    clearInterval(timer);
    isPaused = true;
    updatePomokaijuuState();
}

// Function to reset the timer
function resetTimer() {
    clearInterval(timer);
    minutes = 25; // Initial duration for focus session
    seconds = 0;
    phase = 'focus'; // Reset phase to focus session
    completedSessions = 0; // Reset completed sessions to 0
    updateTimer();
    isPaused = true;
    updatePomokaijuuState();
}

// Event listeners for buttons
startButton.addEventListener('click', startTimer);
pauseButton.addEventListener('click', pauseTimer);
resetButton.addEventListener('click', resetTimer);

// Initial timer display
updateTimer();
updatePomokaijuuState();
