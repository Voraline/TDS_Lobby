-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopNavigation
-- Decompile time: 0.33 ms

local u0 = {Coins = "Coins", Gems = "Gems"}
return {
    getCurrencySection = function(a1) -- Line: 12 -- upvalues: u0 (val) -- types: a1: string
        return u0[a1]
    end,
    findScrollOffset = function(a1, a2) -- Line: 16 -- types: a1: table, a2: string
        for i, j in a1 do
            if j.scrollTarget ~= a2 and j.sectionTitle ~= a2 then
                continue
            end
            return j.offset
        end
        return nil
    end,
}