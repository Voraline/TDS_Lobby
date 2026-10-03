-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.MobileNavButton
-- Decompile time: 0.97 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local Value = Fusion.Value
local Tween = Fusion.Tween
local MobileNavButton = Elements.MobileNavButton
return function(a1) -- Line: 12
    -- upvalues: MobileNavButton (val), Value (val), Tween (val), Computed (val), Hydrate (val), OnEvent (val)
    -- upvalues: Children (val)
    local v1 = MobileNavButton:Clone()
    local Selected = a1.Selected
    if not Selected then
        Selected = Value(true)
    end
    local v2 = Tween(Computed(function() -- Line: 18 -- upvalues: Selected (val)
        if Selected:get() then
            return 0.5
        end
        return 0.9
    end), TweenInfo.new(0.2), Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local v3 = Hydrate(v1)
    local v4 = {
        Size = a1.Size,
        Position = a1.Positiion,
        AnchorPoint = a1.AnchorPoint,
        BackgroundTransparency = v2,
        LayoutOrder = a1.LayoutOrder,
    }
    local Activated = OnEvent("Activated")
    v4[Activated] = a1.Clicked
    v4[Children] = {
        Hydrate(v1.Value)({Text = a1.Text}),
        (Hydrate(v1.Icon)({Image = a1.Icon})),
    }
    return v3(v4)
end