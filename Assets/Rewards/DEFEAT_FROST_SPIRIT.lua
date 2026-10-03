-- Script path: ReplicatedStorage.Assets.Rewards.DEFEAT_FROST_SPIRIT
-- Decompile time: 0.27 ms

return {
    Reward = "400 Exp",
    Badge = 2124652180,
    Claim = function(a1) -- Line: 6
        local Session = a1.Session
        if Session then
            local Player = Session.Player
            if Player then
                local Experience = Player:FindFirstChild("Experience")
                if Experience then
                    Experience.Value = Experience.Value + 400
                end
            end
        end
    end,
}