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

        function topCard = get.topCard(obj)
            topCard = obj.filenamesArray(obj.cards(1)) + ".svg";
        end
        function topCard = get.filenames(obj)
            topCard = reshape(obj.filenamesArray(obj.cards) + ".svg", 1, []);
        end
    end



end