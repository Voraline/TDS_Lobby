-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.init.story
-- Decompile time: 0.53 ms

local RunService = game:GetService("RunService")
local Parent = require(script.Parent)
return function(a1) -- Line: 4 -- upvalues: Parent (val), RunService (val)
    local Frame = Instance.new("Frame")
    Frame.Position = UDim2.fromScale(0.5, 0.5)
    Frame.Size = UDim2.new(1, 0, 0, 40)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundTransparency = 1
    Frame.Parent = a1
    local u28 = Parent({
        textScale = 1,
        use2DParticles = true,
        animate = true,
        textSettings = {Font = "GothamBold"},
        text = string.format("<%s>%s</%s> LOL", "polluted", "Bear", "polluted"),
        Parent = Frame,
    })
    local u34 = RunService.RenderStepped:Connect(function(a1) -- Line: 28 -- upvalues: u28 (val) -- types: a1: number
        u28:Step(a1)
    end)
    return function() -- Line: 32 -- upvalues: u34 (val), u28 (val), Frame (val)
        u34:Disconnect()
        u28:Destroy()
        Frame:Destroy()
    end
end