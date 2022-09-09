## Questions to respond to below:

1. Describe an algorithm to predict the ranking that a user U would give to a movie M assuming the user hasn't already ranked the movie in the dataset.

The algo could be going through the list of most_similar users for user U and check from the most simular users to see if they have ranked the movie M, and if they have, use the most similar user's rating as the prediction or using a weighted average of a range of similar users' ratings for movie M as the prediction.


2. Does your algorithms scale? You dont have to make it scale alot, I just want to see that you have an awareness of whether it does or does not, and why,

My algoritm does not scale very well. My runtime for popularity_list is too high. My run time is O(n^3) but I want to make it faster


3. What factors determine the execution time of your "most_similar" and "popularity_list" algorithms.

For my most_similar and popularity_list algorithms, I feel like I need to make the amount of times to go through the entire list of movies to be as little as possible.
