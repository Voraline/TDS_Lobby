-- Script path: ReplicatedStorage.Assets.Rewards.DEFEAT_GRAVE_DIGGER
-- Decompile time: 0.28 ms

return {
    Reward = "75 Exp",
    Badge = 2124572793,
    Claim = function(a1) -- Line: 6
        local Session = a1.Session
        if Session then
            local Player = Session.Player
            if Player then
                local Experience = Player:FindFirstChild("Experience")
                if Experience then
                    Experience.Value = Experience.Value + 75
                end
            end
        end
    end,
}