load("winners", "listOfWinners")
winnerList = listOfWinners;
numWinners = length(winnerList);
RoundsWonByPlayer1 = (winnerList == 1)'
RoundsWonByPlayer2 = (winnerList == 2)'
summerMatrix = tril(ones(numWinners))

player1Cumulative = summerMatrix * RoundsWonByPlayer1
player2Cumulative = summerMatrix * RoundsWonByPlayer2

plot(1:numWinners, player1Cumulative, 1:numWinners, player2Cumulative)
