# Stop-Watch-Timer-Using-FSM
A stopwatch timer built with an FSM (Finite State Machine) manages time tracking through defined states and transitions, using control signals like start, stop, and reset.

🎛️ Key Inputs:
clk: Clock input for timing.

reset: Resets the timer and FSM.

start_stop: Toggles between Run and Pause states.

clear: Clears the time to zero.

💡 Outputs:
seg[6:0]: Controls the segments of a 7-segment display.

an[3:0]: Enables each of the 4 digits of the display.

status_led: Indicates whether the stopwatch is running.

🔄 FSM States:
IDLE – Initial state, waiting for start.

RUN – Counting time.

PAUSE – Paused stopwatch.

RESET – Clears the counter to zero.

⚙️ Operation:
On power-up or reset, go to IDLE.

On start_stop, move to RUN.

On another start_stop, move to PAUSE.

On clear, go to RESET and return to IDLE.

📦 Hardware Implementation:
Designed using Verilog HDL.

Uses 7-segment display for showing time.

May require a clock divider to slow down the system clock for display and counting (e.g., 1Hz from 100MHz).
