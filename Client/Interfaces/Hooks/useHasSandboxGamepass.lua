-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass
-- Decompile time: 1.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useGameStateBinding = require(script.Parent.useGameStateBinding)
local useReactBindings = require(script.Parent.useReactBindings)
local useState = React.useState
return function() -- Line: 9 -- upvalues: useState (val), useGameStateBinding (val), useReactBindings (val)
    local v1, u3 = useState(false)
    local u7 = useGameStateBinding("SandboxAdminGamepassOwners", {})
    local u11 = useGameStateBinding("SandboxAdmins", {})
    local v2 = {u7, u11}
    useReactBindings(function() -- Line: 15 -- upvalues: u3 (val), u7 (val), u11 (val)
        local v1 = tostring(game.Players.LocalPlayer.UserId)
        local v2 = true
        if u7:getValue()[v1] ~= true then
            v2 = u11:getValue()[v1] == true
        end
        u3(v2)
    end, v2)
    return v1
end