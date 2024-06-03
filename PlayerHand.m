classdef PlayerHand < CardArray

    properties
        drawPile
        discardPile
    end

    properties (Dependent)
        isWinning
    end

    methods
        function obj = PlayerHand(cards, drawPile, discardPile)
            obj@CardArray(cards)
            obj.drawPile = drawPile;
            obj.discardPile = discardPile;
        end
        
        function [] = DrawCard(obj, drawFromDiscard)
            switch drawFromDiscard
                case false
                    if isempty(obj.drawPile.cards)
                        obj.drawPile.cards = obj.discardPile.cards;
                        obj.drawPile.Shuffle;
                        obj.drawPile.transferCard(obj.discardPile, 1);
                    end
                    obj.drawPile.TransferCard(obj, 1);
                case true
                    obj.discardPile.TransferCard(obj,1);
            end
        end

        function [] = discard(obj, index)
            obj.discardPile.cards = [obj.cards(index), obj.discardPile.cards];
            obj.cards(index) = [];
        end

        function swapCards(obj, indices)
            index1 = indices(1);
            index2 = indices(2);
            obj.cards([index1, index2]) = obj.cards([index2, index1]);
        end

        function winner = get.isWinning(obj)
            winner = true;
        end
    end


end