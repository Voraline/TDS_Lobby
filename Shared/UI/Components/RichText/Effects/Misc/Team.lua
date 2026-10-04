-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Team
-- Decompile time: 1.67 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "PVPTag",
    getColor = function(a1) -- Line: 7
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 55)),
            ColorSequenceKeypoint.new(0.449, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.55, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.551, Color3.fromRGB(0, 76, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 195, 255))),
        })
    end,
    onCreate = function(self) -- Line: 19
        local adornee = self.adornee
        if not adornee then
            return
        end
        local v1 = (adornee:WaitForChild("Display")):FindFirstChild("1", true)
        local v2 = {size = 1.25, squash = -1.75}
        local v3 = {size = 0.7, squash = -0.5}
        if v1 and v1:IsA("TextLabel") then
            local v4 = string.len(v1.Text)
            if v4 <= 6 then
                v2.size = 0.75
                v2.squash = -0.75
                v3.size = 0.6
                v3.squash = -0.4
            elseif not (v4 > 6) then
                if v4 > 10 and v4 <= 14 then
                    v2.size = 1
                    v2.squash = -1.5
                    v3.size = 0.6
                    v3.squash = -0.5
                end
            elseif v4 <= 10 then
                v2.size = 1.1
                v2.squash = -1.1
                v3.size = 0.8
                v3.squash = -0.5
            elseif v4 > 10 and v4 <= 14 then
                v2.size = 1
                v2.squash = -1.5
                v3.size = 0.6
                v3.squash = -0.5
            end
        end
        for i, j in adornee:GetDescendants() do
            if j:IsA("ParticleEmitter") then
                if j.Name == "Base" then
                    j.Size = NumberSequence.new(v2.size)
                    j.Squash = NumberSequence.new(v2.squash)
                elseif j.Name == "Lightning" then
                    j.Size = NumberSequence.new(v3.size)
                    j.Squash = NumberSequence.new(v3.squash)
                end
            end
        end
    end,
    render = function(a1) -- Line: 66 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Rotation = 33, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 3, Color = Color3.fromRGB(65, 65, 65), Parent = v1})
        if not a1.created then
            task.defer(function() -- Line: 90 -- upvalues: a1 (val)
                a1:onCreate()
            end)
            a1.created = true
        end
        return true
    end,
    cleanUp = function(a1) -- Line: 100
        local adornee = a1.adornee and a1.adornee:FindFirstChildWhichIsA("Attachment")
        if adornee then
            adornee:Destroy()
        end
    end,
}