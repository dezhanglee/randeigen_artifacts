This folder contains the code needed to generate the result in table 6.
There are 2 Python notebooks: 
- subpop_randeigen: the model trained using randeigen
- subpop_no_randeigen: the model trained without randeigen defense.

As the code implementation of "Subpopulation Data Poisoning Attacks" [1] was not provided, we implemented the attack for the image classification transfer learning task (section 5.3 of [1]) to the best of our ability, using the learning parameters given in the paper. 

For convenience (as the code takes a long time to run), we included the code outputs in the respective Python notebooks. In the last cell, the numbers below the epoch counter gives the model accuracy over clean data (ACC) and attack success rate (ASR). These numbers are similar to the reported numbers in the last two rows of Table 6. 

Note that due to the randomness involved in the attack, the results are non-deterministic but should be similar to the reported ones. 

Basic functionality test: Both notebooks should run successfully without any errors. 