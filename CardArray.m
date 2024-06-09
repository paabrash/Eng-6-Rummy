classdef CardArray < handle


    properties
        cards; % Array of numbers representing playing cards
    end

    properties (Constant)
        % Correspondence between card names & numbers
        namesArray = ...
            ["Ace", string(2:10), "Jack", "Queen", "King"]' + ...
            " of " + ...
            ["Spades", "Hearts", "Diamonds", "Clubs"];
        filenamesArray = ...
            ["A", string(2:10), "J", "Q", "K"]' + ...
            " " + ...
            ["SPADE", "HEART", "DIAMOND", "CLUB"];
    end

    properties (Dependent)
        topCard
        topCardFile
        lastCardFile
        secondCard
        filenames
    end

    methods
        function obj = CardArray(cards)
            if isnumeric(cards)
                obj.cards = cards;
            else
                print("Error: Cards vector not numeric")
            end
            
        end

        function cardsString = OutputCards(obj)
            cardNames = obj.namesArray(obj.cards);
            cardsString = reshape(cardNames,[],1);
        end

        function [] = printCards(obj)
            disp(obj.OutputCards);
        end

        function [] = Shuffle(obj)
            indices = randperm(length(obj.cards));
            obj.cards = obj.cards(indices);
        end

        function [] = TransferCard(obj, target, index)
            target.cards(end+1) = obj.cards(index);
            obj.cards(index) = [];
        end

        function [] = SortBySuit(obj)
            obj.cards = sort(obj.cards);
        end

        function [] = SortByRank(obj)
            [~, indices] = sort(mod(obj.cards - 1, 13));
            obj.cards = obj.cards(indices);
        end

        function index = findCard(obj, cardToFind)
            indices = 1:length(obj.cards);
            index = indices(obj.cards == cardToFind);
        end

        function file = fileFromIndex(obj, index)
            card = obj.cards(index);
            file = "images/cards/" + obj.filenamesArray(card) + ".svg";
        end

        function topCard = get.topCard(obj)
            if isempty(obj.cards)
                topCard = 0;
            else
                topCard = obj.cards(1);
            end

        end

        function topCardFile = get.topCardFile(obj)
            if isempty(obj.cards) || obj.cards(1) == 0
                topCardFile = "images/misc/cardPlacehold.png";
            else
                topCardFile = "images/cards/" + obj.filenamesArray(obj.cards(1)) + ".svg";
            end
        end

        function lastCardFile = get.lastCardFile(obj)
            if isempty(obj.cards) || obj.cards(1) == 0
                lastCardFile = "images/misc/cardPlacehold.png";
            else
                lastCardFile = "images/cards/" + obj.filenamesArray(obj.cards(end)) + ".svg";
            end
        end
        
        function secondCard = get.secondCard(obj)
            if isscalar(obj.cards) || isempty(obj.cards)
                secondCard = 0;
            else
                secondCard = obj.cards(2);
            end
        end

        function topCard = get.filenames(obj)
            topCard = reshape(obj.filenamesArray(obj.cards) + ".svg", 1, []);
        end
    end



end