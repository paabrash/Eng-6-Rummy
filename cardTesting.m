drawPile = CardArray(1:52);
discardPile = CardArray([]);

player1 = PlayerHand([], drawPile, discardPile);
player2 = PlayerHand([], drawPile, discardPile);





players = [player1, player2];

currentPlayer = 1;


game = true;

Deal(drawPile, discardPile, players);

while game

game = PlayerDraw(players(currentPlayer));

currentPlayer = mod(currentPlayer + 1, 2) + 1;

end

function [] = Deal(drawPile, discardPile, players)
for i = 1:7
    for j = 1:length(players)
        players(j).drawCard(false);
    end
end
drawPile.TransferCard(discardPile, 1);
end

function ender = PlayerDraw(player)
ender = false;
player.printCards()
disp("Current Discard:" + discardPile.frontCard);
playerInput = upper(input("Enter P to draw from the drawpile, D from the discard"));
switch playerInput
    case "P"
        player.drawCard(false);
    case "D"
        player.drawCard(true);
    case "E"
        ender = true;
    otherwise
        disp("Invalid input.")
        playerDraw(player)
end



end
