-- Script path: ReplicatedStorage.Client.Controllers.Shared.CustomPromptController.KeyImageResolver
-- Decompile time: 0.99 ms

local UserInputService = game:GetService("UserInputService")
local KeyMappings = require(script.Parent.KeyMappings)
return function(a1, a2) -- Line: 5 -- upvalues: KeyMappings (val), UserInputService (val)
    if a1 == Enum.ProximityPromptInputType.Gamepad then
        return KeyMappings.GamepadButtons[a2.GamepadKeyCode]
    end
    if a1 == Enum.ProximityPromptInputType.Touch then
        return KeyMappings.TouchTapIcon
    end
    local StringForKeyCode = UserInputService:GetStringForKeyCode(a2.KeyboardKeyCode)
    local v1 = KeyMappings.KeyboardButtons[a2.KeyboardKeyCode]
    local v2 = KeyMappings.KeyCodes[a2.KeyboardKeyCode]
    if v1 then
        return v1
    end
    if v2 then
        StringForKeyCode = v2
    end
    return nil, StringForKeyCode
end