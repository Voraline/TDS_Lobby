-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Firework
-- Decompile time: 2.04 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local v1 = {DesiredType = "Word", Particle = "Firework"}
local u14 = {
    FireworkColor1 = {EmitCount = 1},
    ImageBase = {EmitCount = 1, EmitDelay = 0.1},
    SoftGlow = {EmitCount = 1, EmitDelay = 0.1},
    TinySprklesColor1 = {EmitCount = 22, EmitDelay = 0.1},
    TinySprklesColor2 = {EmitCount = 22, EmitDelay = 0.1},
}

local function emit(a1) -- Line: 29 -- upvalues: u14 (val) -- types: a1: userdata
    local v1, v2
    for i, j in a1:GetChildren() do
        if j:IsA("ParticleEmitter") then
            v1 = u14[j.Name]
            if v1 then
                v2 = v1.EmitDelay or 0
                local u23 = v1.EmitCount or 0
                local u25 = v1.EmitDuration or 0
                task.delay(v2, function() -- Line: 44 -- upvalues: j (val), u23 (val), u25 (val)
                    if j:IsA("ParticleEmitter") then
                        j:Emit(u23)
                    end
                    if u25 > 0 then
                        task.defer(function() -- Line: 50 -- upvalues: j (upval), u25 (upval)
                            j.Enabled = true
                            task.wait(u25)
                            j.Enabled = false
                        end)
                    end
                end)
            end
        end
    end
end

function v1.getColor(a1) -- Line: 60
    return ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.1, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.12, Color3.fromRGB(4, 211, 0)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(4, 211, 0)),
        ColorSequenceKeypoint.new(0.22, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.32, Color3.fromRGB(4, 211, 0)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(4, 211, 0)),
        ColorSequenceKeypoint.new(0.42, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.52, Color3.fromRGB(4, 211, 0)),
        ColorSequenceKeypoint.new(0.599, Color3.fromRGB(4, 211, 0)),
        ColorSequenceKeypoint.new(0.62, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.72, Color3.fromRGB(4, 211, 0)),
        ColorSequenceKeypoint.new(0.811, Color3.fromRGB(0, 255, 21)),
        ColorSequenceKeypoint.new(0.82, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.92, Color3.fromRGB(4, 211, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 211, 0))),
    })
end

function v1.render(a1) -- Line: 85 -- upvalues: Create (val), emit (val)
    local v1 = a1.container:Get()
    if v1 == a1.root then
        v1 = a1.labels:Get()[1]
    end
    if not a1.createdAt then
        a1.createdAt = tick()
        a1.lastFirework = 0
    end
    if not a1.created then
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
        end
        Create("UIGradient", {Rotation = -25, Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Name = "UIStroke", Thickness = 4, Color = Color3.fromRGB(81, 35, 147), Parent = v1})
        a1.created = true
    end
    if a1.adornee then
        local v2 = tick() - a1.createdAt
        if v2 > 0.7 then
            a1.createdAt = tick()
            repeat
            until (Random.new():NextInteger(1, 7)) ~= a1.lastFirework
            local v3 = a1.adornee:FindFirstChild((("Firework%*"):format(v2)))
            a1.lastFirework = v2
            emit(v3)
        end
    end
end

return v1