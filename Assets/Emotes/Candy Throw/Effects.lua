-- Script path: ReplicatedStorage.Assets.Emotes.Candy Throw.Effects
-- Decompile time: 0.45 ms

return {
    Grab = function(a1, a2) -- Line: 2
        local Basket = a2:FindFirstChild("Basket")
        if Basket then
            Basket.Handle.Crinkle:Play()
        end
    end,
    Throw = function(a1, a2, a3) -- Line: 10
        local Candy = a2:FindFirstChild("Candy")
        if Candy then
            local v1
            Candy.Handle.Throw:Play()
            for k, v in pairs(Candy.Handle:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v1 = Random.new():NextInteger(4, 8)
                    v:Emit(v1)
                end
            end
        end
    end,
}