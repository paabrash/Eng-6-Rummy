classdef DrawPile < CardArray
    
    methods
        
        % Constructor
        function obj = DrawPile(isPrimaryComputer, cards)
            if isPrimaryComputer
                input = 1:52;
            else
                input = cards;
            end
            obj@CardArray(input)
        end

        % Deal a starting hand to each player and initialize the discard
        function DealHands(obj, handArray, discard)
            for dealNum = 1:7
                for handNum = 1:length(handArray)
                    obj.TransferCard(handArray(handNum), 1)
                end
                obj.TransferCard(discard, 1)
            end
        end


    end

end