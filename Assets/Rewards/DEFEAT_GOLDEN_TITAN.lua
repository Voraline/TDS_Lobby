-- Script path: ReplicatedStorage.Assets.Rewards.DEFEAT_GOLDEN_TITAN
-- Decompile time: 0.21 ms

return {
    Reward = "150 Exp",
    Badge = 2124572795,
    Claim = function(a1) -- Line: 6
        local Session = a1.Session
        if Session then
            local Player = Session.Player
            if Player then
                local Experience = Player:FindFirstChild("Experience")
                if Experience then
                    Experience.Value = Experience.Value + 150
                end
            end
        end
    end,
}