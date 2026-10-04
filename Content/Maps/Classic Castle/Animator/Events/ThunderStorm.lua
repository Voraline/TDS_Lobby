-- Script path: ReplicatedStorage.Content.Maps.Classic Castle.Animator.Events.ThunderStorm
-- Decompile time: 2.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TimescaleUtilities_2 = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u26 = {data = {}}
local u38 = Create("ColorCorrectionEffect", {
    Name = "ThunderStorm",
    Brightness = 0.3,
    Contrast = 0.1,
    Saturation = 0.1,
    Enabled = false,
    TintColor = Color3.fromRGB(255, 247, 26),
    Parent = game.Lighting,
})
u38:AddTag("DONT_TOUCH")
local u47 = Create("Sound", {SoundId = "rbxassetid://12222030", Volume = 1, Parent = workspace})
local u48 = {}
u48[1] = Color3.fromRGB(255, 238, 0)
local u55 = Random.new()

local function ShootLighting() -- Line: 35
    -- upvalues: u47 (val), u55 (val), u26 (val), u48 (val), u38 (val), TimescaleUtilities_2 (val), Laser (val)
    local Position, X, Z, v1, v2, v3, v4, v5
    for i = 1, (math.random(1, 3)) do
        u47.PlaybackSpeed = u55:NextNumber(0.93, 1.09)
        u47:Play()
        v2 = u26.map:GetExtentsSize() / 20
        Position = u26.map:GetPivot().Position
        X = Position.X
        Z = Position.Z
        v3 = Vector3.new(X + u55:NextNumber(-v2.X, v2.X), 200, Z + (u55:NextNumber(-v2.Z, v2.Z)))
        v4 = workspace:Raycast(v3, (Vector3.new(-0, -210, -0)))
        if not v4 then
            return
        end
        v5 = v4.Position + Vector3.new(u55:NextNumber(-4, 4), 0, (u55:NextNumber(-4, 4)))
        v1 = {
            Lifetime = 0.4,
            minWidth = 0.1,
            maxWidth = 2,
            Bursts = 1,
            Color = u48[math.random(1, #u48)],
            Start = v3,
            End = v5,
            Offset = Random.new():NextNumber(1, 2),
        }
        task.spawn(function() -- Line: 71 -- upvalues: u38 (upval), TimescaleUtilities_2 (upval)
            u38.Enabled = true
            TimescaleUtilities_2.Wait(0.2)
            u38.Enabled = false
            TimescaleUtilities_2.Wait(0.1)
            u38.Enabled = true
            TimescaleUtilities_2.Wait(0.2)
            u38.Enabled = false
        end)
        Laser:Lightning(v1)
        TimescaleUtilities_2.Wait(u55:NextNumber(1, 3))
    end
end

function u26.rewind(a1) -- Line: 86
    if a1._thread then
        task.cancel(a1._thread)
    end
end

function u26.start(a1) -- Line: 92 -- upvalues: TimescaleUtilities (val), ShootLighting (val)
    a1._thread = task.spawn(function() -- Line: 93 -- upvalues: TimescaleUtilities (upval), ShootLighting (upval)
        TimescaleUtilities.Wait(3)
        while true do
            ShootLighting()
            TimescaleUtilities.Wait(5)
        end
    end)
end

return u26