function isWinner = checkRummyHand(hand)
    % This function checks if the given hand in Rummy (7 cards) is a winning hand.
    % The hand is represented by numbers 1-52 in the order of hearts, diamonds, spades, and clubs.
    % Hearts: 1-13, Diamonds: 14-26, Spades: 27-39, Clubs: 40-52

    % Check if the input hand has 7 cards
    if length(hand) ~= 7
        error('Hand must contain exactly 7 cards.');
    end

    % Sort the hand
    hand = sort(hand);

    % Convert card numbers to ranks and suits
    ranks = mod(hand-1, 13) + 1; % Ranks from 1 to 13
    suits = ceil(hand / 13); % Suits from 1 to 4 (1: Hearts, 2: Diamonds, 3: Spades, 4: Clubs)

    % Create a table for card information
    cardTable = table(ranks', suits', 'VariableNames', {'Rank', 'Suit'});

    % Check for sets (3 or 4 of the same rank but different suits)
    sets = false;
    setval=0;
    for rank = 1:13
        if sum(cardTable.Rank == rank) >= 3
            setval=setval+sum(cardTable.Rank==rank);
            sets = true;
        end
    end

    % Check for runs (3 or more consecutive cards of the same suit)
    runs = false;
    runval=0;
    for suit = 1:4
        suitCards = cardTable.Rank(cardTable.Suit == suit);
        if length(suitCards) >= 3
            if checkConsecutive(suitCards)
                runval=runval+length(suitCards);
                runs = true;
            end
        end
    end

    % Winning condition: All 7 cards must form valid combinations (sets or runs)
    if sets==false & runs==false
        isWinner=false;
    end

    if sets==true & runs==true
        if setval+runval>=7
            isWinner=true;
        else
            isWinner=false;
        end
    end

    if sets==true & runs==false
        if setval==7
            isWinner=true;
        else
            isWinner=false;
        end
    end

    if sets==false & runs==true
        if runval==7
            isWinner=true;
        else
            isWinner=false;
        end
    end
end


function isConsecutive = checkConsecutive(cards)
    if any(cards == 1)
        % Add Ace as 14 to the list
        cards = [cards; 14];
    end
    sortedCards = sort(cards);
    isConsecutive = any(diff(sortedCards) == 1);
    % Check for all possible runs
    for startIdx = 1:length(sortedCards) - 2
        if all(diff(sortedCards(startIdx:startIdx + 2)) == 1)
            isConsecutive = true;
            return;
        end
    end
    isConsecutive = false;

end