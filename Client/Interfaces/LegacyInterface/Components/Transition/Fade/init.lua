-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Transition.Fade
-- Decompile time: 0.73 ms

local TweenService = game:GetService("TweenService")
local Property = require(script.Property)
return function(a1, a2, a3, a4) -- Line: 5 -- upvalues: Property (val), TweenService (val) -- types: a2: userdata, a4: boolean
    local v1, v2
    local v3 = (a3 or {}).Duration or 0.2
    local v4 = a1 == true
    local Descendants = a2:GetDescendants()
    if a4 then
        table.insert(Descendants, a2)
    end
    for i, v in ipairs(Descendants) do
        local u36 = {}
        Property(v, v4, function(a1, a2, a3) -- Line: 19 -- upvalues: v (val), u36 (val)
            v[a1] = a2
            u36[a1] = a3
        end)
        if next(u36) then
            v1 = TweenService
            v2 = TweenInfo.new(v3, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
            v1:Create(v, v2, u36):Play()
        end
    end
end