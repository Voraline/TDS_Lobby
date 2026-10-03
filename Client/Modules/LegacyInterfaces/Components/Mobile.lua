-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Mobile
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u10 = {Index = 1, Initialized = false}
u10.IndexChanged = Signal.new()
u10.Signals = {
    Run = Signal.new(),
    Emote = Signal.new(),
    Sticker = Signal.new(),
    Communication = Signal.new(),
    Rotate = Signal.new(),
    Trash = Signal.new(),
}
u10.Buttons = u10

function u10.Init() -- Line: 23 -- upvalues: u10 (val)
    if u10.Initialized then
        return
    end
    u10.Initialized = true
end

function u10.Enable(a1) -- Line: 31 -- upvalues: u10 (val) -- types: a1: number
    u10.Index = a1
    u10.IndexChanged:Fire(a1)
end

task.spawn(u10.Init)
return u10