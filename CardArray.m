classdef CardArray < handle


    properties
        cards;
    end

    properties (Constant)
        namesArray = ...
            ["Ace", string(2:10), "Jack", "Queen", "King"]' + ...
            " of " + ...
            ["Spades", "Hearts", "Diamonds", "Clubs"];
    end

        properties (Dependent)
        frontCard
    end

    methods
        function obj = CardArray(cards)
                obj.cards = cards;
        end

        function cardsString = OutputCards(obj)
            cardNames = obj.namesArray(obj.cards);
            cardsString = string(1:length(obj.cards)) + ". " + cardNames;
            cardsString = reshape(cardsString,[],1);
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
            [~, indices] = sort(mod(obj.cards, 13));
            obj.cards = obj.cards(indices);
        end
        function frontCard = get.frontCard(obj)
            frontCard = obj.namesArray(obj.cards(1));
        end
    end



end