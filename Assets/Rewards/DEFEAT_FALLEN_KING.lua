-- Script path: ReplicatedStorage.Assets.Rewards.DEFEAT_FALLEN_KING
-- Decompile time: 0.22 ms

return {
    Reward = "250 Exp",
    Badge = 2124572796,
    Claim = function(a1) -- Line: 6
        local Session = a1.Session
        if Session then
            local Player = Session.Player
            if Player then
                local Experience = Player:FindFirstChild("Experience")
                if Experience then
                    Experience.Value = Experience.Value + 250
                end
            end
        end
    end,
}