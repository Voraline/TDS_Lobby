-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useLastInputType
-- Decompile time: 1.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local UI = ReplicatedStorage.Shared.UI
local React = require(UI.React)
local useState = React.useState
return function() -- Line: 9 -- upvalues: useState (val), UserInputService (val), React (val)
    local v1, u6 = useState(UserInputService:GetLastInputType())
    React.useEffect(function() -- Line: 12 -- upvalues: UserInputService (upval), u6 (val)
        local u5 = UserInputService.LastInputTypeChanged:Connect(u6)
        return function() -- Line: 15 -- upvalues: u5 (ref)
            u5:Disconnect()
            u5 = nil
        end
    end, {})
    return v1
end