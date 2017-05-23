# COMP3419 Graphics and Multimedia - Lab Submission 2
Before you start to program this lab submission, please make sure you understand the basics of 3D graphics from last lab and finish the orbit simulator.

### Bouncing particles (Lab Submission 2 - Due Week 12)
In this task, program an interactive 3D animation with the following scenarios:
* When you click mouse at (x, y) on your screen shoot a 3D ball with a random texture (randomly load a texture from your texture pool).
* This ball flies away from the screen along the Z axis with a random direction according to the XY plane. It means this ball does not go straight ahead, but instead is shot away in a random direction. The gravity always effect the movement of this ball as long as it is in screen.
* While the ball moves away from the screen, it falls down to the ground due to the gravity.
* The space is constrained by 5 walls (left, right, ceiling, floor and a wall far ahead facing the screen). When the ball touches any of the wall, it bounces back and its new direction is computed considering its previous direction.
* You can shoot new balls into the screen while the previous balls are travelling.
* __*!*__ The ball spins while it is travelling. The direction of spinning is determined by its original direction and the bounces.
* __*!*__ When the balls touch each other, they bounce back as well.
* __*!*__ The potential energy (speed and height) of the ball decays according to the travelling time as well as the number of bounces.

__*NOTE*__
* The sources of this task are supposed to be submitted via the eLearning and counts for 5% of your total assessment. You are required to provide a working live demo of your work to your tutor during the lab week 12.
* Scenarios marked with __*!*__ are not assessable for this submission.
* It would be easier if you model the balls with a java class.
* Nice to embed some of the Kinematic equations when you calculate the speed and direction of the balls. For equations of motion, please refer to [https://en.wikipedia.org/wiki/Equations_of_motion](https://en.wikipedia.org/wiki/Equations_of_motion)
