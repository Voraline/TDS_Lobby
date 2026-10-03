-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useKeyBinding
-- Decompile time: 1.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local u17 = RunService:IsRunning()
local KeyCode = require(ReplicatedStorage.Shared.Modules.KeyCode)
local u29 = nil
if u17 then
    u29 = require(ReplicatedStorage.Client.Modules.HotKey)
end
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useBinding = React.useBinding
return function(a1, a2, a3, a4, a5, a6) -- Line: 21
    -- upvalues: useBinding (val), u17 (val), useEffect (val), u29 (ref), GameState (val), KeyCode (val)
    -- upvalues: UserInputService (val)
    local u6 = a5 or false
    local v1, u10 = useBinding(false)
    local v2, u13 = useBinding()
    local v3, u16 = useBinding()
    if not u17 then
        return v1, v2
    end
    local v4 = useEffect
    local v5 = {a1, a2, a4, GameState.State.HotkeysDisabled, u6}
    v4(function() -- Line: 39
        -- upvalues: u29 (upval), a1 (val), a6 (val), u13 (val), u16 (val), u6 (ref), GameState (upval), a4 (val)
        -- upvalues: u10 (val), a3 (val), a2 (val)
        local u4 = u29.new(a1, a6)
        u13(u4.KeyCode)
        u16(u4.ConsoleKeyCode)
        u4.KeyCodeChanged:Connect(function(a1) -- Line: 44 -- upvalues: u13 (upval)
            u13(a1)
        end)
        u4.Pressed:Connect(function(a1) -- Line: 48 -- upvalues: u6 (upval), GameState (upval), a4 (upval), u10 (upval), a3 (upval), a2 (upval)
            if u6 then
                return
            end
            if GameState.State.HotkeysDisabled and a4 then
                return
            end
            u10(a1)
            if a3 then
                a3(a1)
            end
            if not a1 and a2 then
                a2()
            end
        end)
        return function() -- Line: 68 -- upvalues: u4 (val)
            u4:Destroy()
        end
    end, v5)
    return v1, (v2:map(function(a1) -- Line: 74 -- upvalues: KeyCode (upval)
        return a1 and KeyCode(a1) or ""
    end)), (v3:map(function(a1) -- Line: 77 -- upvalues: UserInputService (upval)
        return a1 and UserInputService:GetImageForKeyCode(a1)
    end))
end