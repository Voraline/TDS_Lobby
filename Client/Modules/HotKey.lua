-- Script path: ReplicatedStorage.Client.Modules.HotKey
-- Decompile time: 6.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u31 = {}
local u32 = {}
u32.__index = u32

local function getSetting(a1, a2) -- Line: 13 -- upvalues: SettingsStore (val) -- types: a1: string
    local v1 = a2 or SettingsStore.getState()
    if not v1.Game then
        return nil
    end
    local v2 = v1.Game[a1]
    if type(v2) == "string" then
        return Enum.KeyCode[v2]
    end
    return v2
end

local function isValidInputType(a1) -- Line: 28
    local v1 = true
    if a1 ~= Enum.UserInputType.Keyboard then
        v1 = a1 == Enum.UserInputType.Gamepad1
    end
    return v1
end

function u32.new(a1, a2, a3) -- Line: 32
    -- upvalues: SettingsStore (val), Signal (val), Maid (val), u32 (val), Charm (val), UserInputService (val)
    -- upvalues: u31 (val)
    local v1
    local v2 = {Name = a1}
    local v3 = SettingsStore.getState()
    if v3.Game then
        local v4 = v3.Game[a1]
        v1 = if type(v4) ~= "string" then v4 else Enum.KeyCode[v4]
    else
        v1 = nil
    end
    v2.KeyCode = v1
    v2.ConsoleKeyCode = a2
    v2.KeyCodeChanged = Signal.new()
    v2.Pressed = Signal.new()
    v2.Maid = Maid.new()
    local u31_2 = setmetatable(v2, u32)
    u31_2.Maid:Mark(function() -- Line: 46 -- upvalues: u31_2 (val)
        u31_2.KeyCodeChanged:Destroy()
        u31_2.Pressed:Destroy()
    end)
    u31_2.Maid:Mark((Charm.listen(SettingsStore.getState, function(a1_2) -- Line: 51 -- upvalues: a1 (val), SettingsStore (upval), u31_2 (val)
        local v1
        local v2 = a1_2 or SettingsStore.getState()
        if v2.Game then
            local v3 = v2.Game[a1]
            v1 = if type(v3) ~= "string" then v3 else Enum.KeyCode[v3]
        else
            v1 = nil
        end
        if v1 ~= u31_2.KeyCode then
            u31_2.KeyCode = v1
            u31_2.KeyCodeChanged:Fire(v1)
        end
    end)))
    u31_2.Maid:Mark((UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 59 -- upvalues: a3 (val), u31_2 (val)
        if not a3 and a2 then
            return
        end
        local UserInputType = a1.UserInputType
        local v1 = true
        if UserInputType ~= Enum.UserInputType.Keyboard then
            v1 = UserInputType == Enum.UserInputType.Gamepad1
        end
        if not v1 then
            return
        end
        if a1.KeyCode == u31_2.KeyCode or a1.KeyCode == u31_2.ConsoleKeyCode then
            u31_2.Pressed:Fire(true)
        end
    end)))
    u31_2.Maid:Mark((UserInputService.InputEnded:Connect(function(a1, a2) -- Line: 73 -- upvalues: a3 (val), u31_2 (val)
        if not a3 and a2 then
            return
        end
        local UserInputType = a1.UserInputType
        local v1 = true
        if UserInputType ~= Enum.UserInputType.Keyboard then
            v1 = UserInputType == Enum.UserInputType.Gamepad1
        end
        if not v1 then
            return
        end
        if a1.KeyCode == u31_2.KeyCode or a1.KeyCode == u31_2.ConsoleKeyCode then
            u31_2.Pressed:Fire(false)
        end
    end)))
    u31[a1] = u31_2
    u31_2.Maid:Mark(function() -- Line: 88 -- upvalues: u31 (upval), a1 (val), u31_2 (val)
        if u31[a1] == u31_2 then
            u31[a1] = nil
        end
    end)
    return u31_2
end

function u32:Destroy() -- Line: 97
    self.Maid:Sweep()
end

function u32.GetAll() -- Line: 101 -- upvalues: u31 (val)
    return u31
end

return u32