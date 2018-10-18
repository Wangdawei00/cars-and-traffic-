For this project, I have created 3 classes and 3 functions(including one main function).
The 'initialize' function initializes all parameters required for the project. The suggested parameters are given below.

Please input the number of all the cars: 30
Please input the probability of a car not stopping at a red/yellow light: 0.5
Please input the time interval for a yellow light: 8
Please input the time interval for a red/green light: 20
Please input the width of a single lane: (the crossroad has two lanes) 2 
Please input the length of the whole animation boundary:(the car moves forward 1 unit per second)  20
Please input the length of a single car: 2

Of course you can change these parameters to gain different game experience. However, the value of the last three parameters are suggested not changed if you want the crossroads and the cars to stay normal and beautiful.
This function randomly assign the number of cars coming from north, south, west and east, according to the total number of cars input by the user.

The width of a car is defined as two-thirds of a single lane's width to prevent unnecessary troubles.
There is no input for the time interval for a green light since the diagonal lights should behave the same. Thus, while a pair of lights is red, the other pair should be green, and their time interval should be the same, or it will cause chaos.
 

The 'plate2' function returns a random combination of six numbers and letters, where the first character must be a letter.
In the 'plate2' function, there is a subfunction named 'perm', which takes a string as the input and output all the possible permutation of the characters in that string. The algorithm is given below.

First we count the number of characters contained in the string( namely the length of the string). If there is only one character, the output will be the string itself. Else(if there are more than one characters) we run an iteration over all characters in the string. In each iteration, we remove that character, and get the all the permutation of the string without that character(by running our 'perm' function recursively). Then we add that character back and put it in the very beginning of each permutation. After the iteration, we will get what we want. As for reference, you can look at my source codes in the plate2 function, and I believe it's much easier to understand than the words above.

Car, Light and crossroads are three classes I use in the main function. 

The crossroads class has two properties, which are boun(representing the boundary length of the whole animation) and Lane_wid(representing the width of the Lane).It has a constructor, verifying these two properties. It has a function called 'draw', which draws the crossroad using the properties given above.

The Light class has three properties, namely r(a number, the radius of the circle representing the traffic light), pos(a 1*2 matrix, the position of the center of the circle) and col(a character, the color of the light). It has three functions. The 'ini_draw' function draws a circle representing the light. The 'setcolor' function takes a character representing the color as the input and changes the color of the light to the given color and then draws it. The 'color' function returns the color of the light.

For the car class, I have assigned many properties. pos(position), length, width, direction, plate and p is common and won't be explained. The property 'vio' indicates whether this car has violated the traffic rule and is initialized 0. 'presence' indicates whether the car is available. Only those cars with presence ==1 will be plotted. 'presented' shows whether the car has been available. It prevents the main function from making the same car appear twice or even more times.' judge' is a property used only in deciding whether to go in front of a yellow or red light. if 'judge'==1, it means that a decision has been made and the car will not decide it again. 

To run the game, you should run the Main function. 

In the Main function, the codes are seperated into different parts by comments. The steps are given as follows.

We first run the 'initialize' function, initializing all parameters needed. Then we create an instance of crossroads and draw it. Then we create four instances of Lights and also draw them. After that, we create four cell arrays of cars according to the parameters given by the 'initialize' function.
Then comes the main loop. We pause one second each time to clear the figure and re-draw everything on it. The color of the lights changes periodically according to the variable 'time'. Then we decide for each car whether to move or not. The algorithm is given in the README file in Milestone 2. Then we change all the cars that are "available" and are 'moving' a unit forward. Then we make new car present. Then we make cars that go beyond the boundary disappear. Then we draw all the cars present. Then we check for crash. Then we check if all the cars have appeared(if the program has finished successfully). Then the loop is over. After the loop, I print the plate of the cars involved in an accident(if any), and those who violated the traffic rules.

NOTATIONS: 1) I have significantly changed my codes after Milestone 2, i.e. I have used 'class' instead of 'function' to do many things. Hope it won't cause deduction. 
2) I believe that I didn't quite meet the requirement of Milestone 2, but I have satisfied it here, i.e. the algorithm of outputing every permutation of a given string. 
3) The Main function has more than 500 lines of codes and many of them are copied and pasted. I understand it's not a good habit of programing habit, but owing to a lack of time and ability, I have to do that. Hope you can give me some advice.
4) I have set a probability of 50% that a new car will appear at the beginning of road. 
5) My cars can't turn left or right, nor can they adjust their speed to prevent crash. In fact, if there is a car not stopping at a red or yellow light, there is probably an accident.
6) There won't be any rear crashes. If the cars get too close, the rear car will stop. 

BUG report: Actually I have no bugs in this program. There are some potential bugs, but the probability of having these bugs are very low and I decided to ignore them.
1) There might be two cars having the same plate. However, the probability of that case will be 0.00000008%, so it's unlikely to happen.
2) There might be a crash even if no car violated the traffic rules. This is because the last car before the yellow light didn' t finish crossing the road before the green light of the other side. However, I believe it can hardly be called a bug. It's just the cause of an unreasonable setting of time of the intervals of the lights(or can it? I'm not sure).