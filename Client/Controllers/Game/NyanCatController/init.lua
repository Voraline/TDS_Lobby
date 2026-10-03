-- Script path: ReplicatedStorage.Client.Controllers.Game.NyanCatController
-- Decompile time: 0.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u11 = require(ReplicatedStorage.Shared.Modules.Maid).new()

local function update() -- Line: 7 -- upvalues: u11 (val)
    if not workspace:GetAttribute("NyanCats") then
        u11:Sweep()
        return
    end
    u11:Mark(((require(script.NyanCats)).create()))
end

;(workspace:GetAttributeChangedSignal("NyanCats")):Connect(update)
task.spawn(update)
return {}