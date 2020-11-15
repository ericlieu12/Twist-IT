# Twist-IT
<b> What is it? </b> <br>
This is a modern version of the popular game Bop-it created using xCode and Swift! <br>
<b> How does it work </b>
Users are given instructions, such as Tilt (phone) Up, Twist Right, Rotate Down, etc, and a few seconds to react to the instruction. If they fail the instruction, they lose. If they complete the instruction,
they gain a point. This continues until they fail! <br>
<b> Features </b>
<ol>
<li> High Score Functionality </li>
<li> 9 different characters </li>
<li> 3 different levels, 5 different musics, instructions screen </li>
<li> Complete Animations </li>
<li> Smooth user experience </li>
</ol>
<b> How was it made? </b> <br>
Using xCode and Swift. To read in user movement of phone (like Turn Left, Twist Right, etc.), I used the Core Motion framework provided by Apple. This framework allows the
phone to act like a gyroscope. So, tilting is X axis, twisting is Y axis, and rotating is Z axis. <br>
High Score functionality functions off of using User Defaults. Every time a high score is achieved, it is saved to User Defaults for next time. <br>
Music and settings (like levels and characters) are also saved using User Defaults. If you choose a music, your choice is saved in User Defaults for next time you launch the app. <br>
<br> <Copyright </b> <br>
Noone is allowed to reproduce my code unless you have explicit written permission by me.

