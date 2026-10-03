-- Script path: ReplicatedStorage.Assets.Rewards.DEFEAT_MOLTEN_BOSS
-- Decompile time: 0.31 ms

return {
    Reward = "100 Exp",
    Badge = 2124572794,
    Claim = function(a1) -- Line: 6
        local Session = a1.Session
        if Session then
            local Player = Session.Player
            if Player then
                local Experience = Player:FindFirstChild("Experience")
                if Experience then
                    Experience.Value = Experience.Value + 100
                end
            end
        end
    end,
}