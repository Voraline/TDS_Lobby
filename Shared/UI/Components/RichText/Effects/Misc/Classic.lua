-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Classic
-- Decompile time: 1.52 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {DesiredType = "Word", Particle = "Classic"}
local u16 = Random.new()

function v1.render(a1) -- Line: 11 -- upvalues: Create (val), Children (val), u16 (val)
    local v1 = a1.container:Get()
    if v1 == a1.root then
        v1 = a1.labels:Get()[1]
    end
    for i, v in ipairs(a1.labels:Get()) do
        v.TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    local u31 = v1:FindFirstAncestorWhichIsA("BasePart")
    if u31 then
        local ForceField = u31:FindFirstChild("ForceField", true)
        if ForceField then
            ForceField:Emit(1)
        end
    end
    if u31 then
        local v2 = Create
        local v3 = {
            Name = "Frame",
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 1, 12),
            Size = UDim2.fromOffset(250, 15),
            Parent = v1,
        }
        v3[Children] = {
            Create("UIGradient", {
                Name = "UIGradient",
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 255, 69)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 255, 69)),
                    ColorSequenceKeypoint.new(0.501, Color3.fromRGB(252, 3, 0)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))),
                }),
                Offset = Vector2.new(0.2, 0),
            }),
        }
        local u117 = v2("Frame", v3)
        task.spawn(function() -- Line: 56 -- upvalues: u117 (val), u16 (upval), Create (upval), u31 (val)
            local v1
            while true do
                if not u117:IsDescendantOf(game) then
                    break
                end
                v1 = u16:NextInteger(0, 100) / 100
                if v1 < 0.1 then
                    Create("Sound", {
                        Volume = 0.5,
                        SoundId = "rbxassetid://17564423313",
                        PlayOnRemove = true,
                        Parent = u31,
                    }):Destroy()
                end
                u117.UIGradient.Offset = Vector2.new(v1 - 0.5, 0)
                task.wait(math.random(1, 4))
            end
        end)
    end
    Create("UIStroke", {Thickness = 4, Color = Color3.fromRGB(255, 38, 0), Parent = v1})
    return true
end

return v1