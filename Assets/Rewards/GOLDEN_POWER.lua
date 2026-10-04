-- Script path: ReplicatedStorage.Assets.Rewards.GOLDEN_POWER
-- Decompile time: 0.33 ms

return {
    Reward = "1000 Coins",
    Badge = 2124572809,
    Claim = function(a1) -- Line: 6
        local Session = a1.Session
        if Session then
            local Player = Session.Player
            if Player then
                local Coins = Player:FindFirstChild("Coins")
                if Coins then
                    Coins.Value = Coins.Value + 1000
                end
            end
        end
    end,
}