ScreenSaver-in-ARMSIM
=====================

This project replicates the iconic Windows screensaver where the word "Windows" bounces off the screen's edges in ARMSIM. The code works perfectly and provides a fun visual effect.

Requirements
------------

-   **ARMSIM** simulator is required to run this screensaver.

Usage
-----

1.  Clone this repository to your local machine.
2.  Load the `screensaver.s` file into **ARMSIM**.
3.  Run the simulation to see the bouncing **"W"** animation.

Code Explanation
----------------

The provided assembly code defines the behavior of the screensaver. Here are the key components:

-   **A**: Represents the letter **"W"** that bounces around the screen.
-   **X movement (r6)** and **Y movement (r7)** control the direction of the letter.
-   The **mode (r5)** determines the movement pattern:
    -   **m1**: Moves diagonally with both X and Y increments.
    -   **m2**: Moves diagonally with X increment and Y decrement.
    -   **m3**: Moves diagonally with X decrement and Y increment.
    -   **m4**: Moves diagonally with both X and Y decrements.
-   The `ANIM` subroutine handles the animation loop.
-   The `DELAY` subroutine introduces a delay for smoother animation.
-   The `VERT` and `HORI` sections handle bouncing off vertical and horizontal walls.

Feel free to customize the code or enhance the screensaver further!
