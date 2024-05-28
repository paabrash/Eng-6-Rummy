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
        
        function [] = drawCard(obj, drawFromDiscard)
            switch drawFromDiscard
                case false
                    obj.drawPile.TransferCard(obj, 1);
                case true
                    obj.discardPile.TransferCard(obj,1);
            end
        end

        function [] = discard(obj, index)
            obj.discardPile.cards = [obj.cards(index), obj.discardPile.cards];
        end

        function winner = get.isWinning(obj)
            winner = true;
        end
    end


end