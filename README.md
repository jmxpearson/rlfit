rlfit
=====

Simple Matlab code to fit reinforcement learning models to choice data.

This will be simple to start. Working inward:

`example.m` runs a simple use case of learning in a standard delta-rule reinforcement learning model. It requires you to specify a function that calculates action values for each choice based on a set of parameters, the choice history, and the outcome history. Outcomes can be of multiple kinds, so long as they are on the same scale. The function expects one outcome type per column. Parameters to the Q function do not include the softmax parameter.

`rlfit.m` is the basic interface function. It accepts a function handle that calculates action values, choice and outcome history, and constraints on the parameters of the model (again, excluding the softmax parameter). `rlfit` scales the action values, fits the model multiple times from random restarts, takes the maximum log likelihood across all fits, and returns the log likelihood, action values, and fitted parameters from the best model. You can use these to calculate AIC and BIC, if needed.

`multmin.m` handles fitting the model multiple times using random starting points in the allowed parameter space.

`LL_softmax.m` handles calculation of the log likelihood of the softmax choice function. It includes some asymptotic expansions that avoid NaNs in the case of very large or very small action values, when the probabilities are very close to 0 or 1.

Models
-----
`Q_model.m` is the standard delta-rule RL model with a single parameter, the learning rate.

`Q_two_outcome.m` is a model where the agent learns from two outcomes, each with its own learning rate, and is assumed to interpolate between them according to a third parameter.
