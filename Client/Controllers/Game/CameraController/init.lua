-- Script path: ReplicatedStorage.Client.Controllers.Game.CameraController
-- Decompile time: 2.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Handlers = script:WaitForChild("Handlers")
local u32 = {CurrentIndex = ""}
u32.Updated = Signal.new()
u32.Handlers = {}

function u32.init(a1) -- Line: 23 -- upvalues: Handlers (val)
    for k, v in pairs(Handlers:GetChildren()) do
        pcall(function() -- Line: 25 -- upvalues: a1 (val), v (val)
            a1.Handlers[v.Name] = (require(v))
        end)
    end
end

function u32:Set(a2, a3, ...) -- Line: 31 -- upvalues: u32 (val)
    if self.CurrentIndex ~= a2 then
        if self.Current then
            self.Current:Exit()
            self.Current = nil
            self.CurrentIndex = ""
        end
    elseif not a3 or self.Current then
        self.Current:Exit()
        self.Current = nil
        self.CurrentIndex = ""
    end
    if self.Handlers[a2] and a3 then
        self.Updated:Fire(a2, self.Handlers[a2])
        self.Current = self.Handlers[a2]:Enter(u32, ...)
        self.CurrentIndex = a2
        return self.Current
    end
end

function u32.Get(a1) -- Line: 49
    return a1.CurrentIndex, a1.Current
end

function u32.Halt(a1) -- Line: 53
    if a1.Current then
        a1.Current:Exit()
        a1.Current = nil
        a1.CurrentIndex = ""
    end
end

UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 62 -- upvalues: u32 (val)
    if a2 then
        return
    end
    if a1.KeyCode == Enum.KeyCode.Tab then
        u32:Set("Topdown", not (u32.CurrentIndex == "Topdown"))
    end
end)
return u32