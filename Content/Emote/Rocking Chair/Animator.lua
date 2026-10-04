-- Script path: ReplicatedStorage.Content.Emote.Rocking Chair.Animator
-- Decompile time: 1.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u26 = {
    intro = "rbxassetid://71613044882249",
    loop = "rbxassetid://132189764188590",
    drink = "rbxassetid://115937733117583",
}
local u27 = {
    forwards = 77283182280600,
    backwards = 112561062173219,
    spawn = 106131052533767,
    drink = 78811629445116,
}
local u28 = {RockForwards = "forwards", RockBackwards = "backwards", Drink = "drink"}
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 28
    -- upvalues: table (val), u27 (val), EasySound (val), u26 (val), u28 (val), spr (val), EmitterManager (val)
    local RockingChair = a1.Character.Instance:WaitForChild("RockingChair")
    local Mug = RockingChair:WaitForChild("Mug")
    Mug.Transparency = 1
    a1._sounds = table.reduce(u27, function(a1, a2, a3) -- Line: 35 -- upvalues: EasySound (upval), RockingChair (val) -- types: a2: number, a3: string
        a1[a3] = (EasySound.Create({
            soundGroupName = "Emotes",
            volume = 0.5,
            id = a2,
            name = ("%*_SOUND"):format(a3),
            parent = RockingChair.PrimaryPart,
        }))
        return a1
    end, {})
    a1._loop = a1:PreloadTrack("rbxassetid://132189764188590")
    a1._drink = a1:PreloadTrack("rbxassetid://115937733117583")
    if a1.Local then
        local u28_2 = Random.new()
        a1._running = true
        a1._thread = task.spawn(function() -- Line: 54 -- upvalues: a1 (val), u28_2 (val)
            while a1._running do
                a1._loop.DidLoop:Wait()
                if not ((u28_2:NextNumber()) < 0.7) then
                    a1._loop:AdjustSpeed(0)
                    a1._drink:Play()
                    task.wait(3.9)
                    a1._loop:AdjustSpeed(1)
                end
            end
        end)
        a1.Maid:Mark(function() -- Line: 70 -- upvalues: a1 (val)
            a1._running = false
            task.cancel(a1._thread)
        end)
    end
    if not a1.Preview then
        a1._sounds.spawn:Play()
        for i, j in {"loop", "drink"} do
            a1:OnTrackPlayed(u26[j], function(a1_2) -- Line: 80 -- upvalues: u28 (upval), a1 (val) -- types: a1_2: userdata
                for i, j in u28 do
                    (a1_2:GetMarkerReachedSignal(i)):Connect(function() -- Line: 82 -- upvalues: a1 (upval), j (val)
                        a1._sounds[j]:Play()
                    end)
                end
            end)
        end
    end
    a1:OnTrackPlayed("rbxassetid://71613044882249", function(a1_2) -- Line: 90
        -- upvalues: RockingChair (val), spr (upval), EmitterManager (upval), Mug (val), a1 (val)
        RockingChair:ScaleTo(0.01)
        spr.target(RockingChair, 0.6, 2, {Scale = 1})
        task.delay(0.5, function() -- Line: 96 -- upvalues: EmitterManager (upval), Mug (upval)
            EmitterManager.Emit("WinterPoof", Mug.CFrame, 2)
            Mug.Transparency = 0
        end)
        task.wait(1.4)
        a1_2:Stop()
        a1:PlayTrack("rbxassetid://132189764188590")
    end)
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 109
    if self._sounds then
        for i, j in self._sounds do
            j:Destroy()
        end
    end
end

return v1