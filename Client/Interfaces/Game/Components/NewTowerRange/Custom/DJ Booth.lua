-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Custom.DJ Booth
-- Decompile time: 2.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DJRangeRing = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Classes.DJRangeRing)
local useEffect = (require(ReplicatedStorage.Shared.UI.React)).useEffect
local useOneShot = require(ReplicatedStorage.Client.Interfaces.Hooks.useOneShot)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useReplicatorBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorBinding)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local u44 = {}
u44.Purple = Color3.fromRGB(216, 154, 255)
u44.Red = Color3.fromRGB(255, 96, 96)
u44.Green = Color3.fromRGB(105, 255, 88)
local v1 = {HideDefaultRing = true, RequiresTowerReplicator = true, ShowDefaultRingWhenLowQuality = true}

local function getMaxBars(a1) -- Line: 28 -- types: a1: number?
    if a1 and a1 >= 6 then
        return 99
    end
    return 49
end

function v1.Render(a1) -- Line: 42
    -- upvalues: useTagReplicatorInstance (val), useReplicatorBinding (val), useOneShot (val), useReactBindings (val)
    -- upvalues: u44 (val), useEffect (val), DJRangeRing (val)
    local u24
    local Model = a1.Model
    local Range = a1.Range
    local RangeRef = a1.RangeRef
    local u13 = useReplicatorBinding(useTagReplicatorInstance(Model, "TowerReplicator", "Tower"), "Track", "Purple")
    local u18 = not (a1.isLowQuality == true)
    if not u18 then
        u24 = 0
    else
        local QualityMode = a1.QualityMode
        u24 = if not QualityMode then 49 else if not (QualityMode >= 6) then 49 else 99
    end
    local u35, u36 = useOneShot(0, 1, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), 0, true)
    local v1 = useReactBindings
    local v2 = {u13}
    local v3 = {u24, a1.SetRangeColor, u18}
    v1(function(a1_2) -- Line: 62 -- upvalues: u18 (val), u24 (val), u44 (upval), a1 (val)
        if u18 and u24 > 0 then
            return
        end
        local v1 = u44[a1_2]
        if v1 then
            a1.SetRangeColor(v1)
        end
    end, v2, v3)
    v1 = useEffect
    v2 = {u24, a1.SetRangeColor, u18, u13}
    v1(function() -- Line: 73 -- upvalues: u18 (val), u24 (val), u44 (upval), u13 (val), a1 (val)
        if u18 and u24 > 0 then
            return
        end
        task.defer(function() -- Line: 78 -- upvalues: u44 (upval), u13 (upval), a1 (upval)
            local v1 = u44[u13:getValue()]
            if v1 then
                a1.SetRangeColor(v1)
            end
        end)
    end, v2)
    v1 = useEffect
    v2 = {
        u24,
        Model,
        a1.RangeColor,
        a1.SetRangeColor,
        Range,
        u35,
        RangeRef,
        u18,
        u13,
    }
    v1(function() -- Line: 86
        -- upvalues: u18 (val), DJRangeRing (upval), u24 (val), Model (val), Range (val), u35 (val), a1 (val)
        -- upvalues: RangeRef (val), u13 (val), u44 (upval)
        if not u18 then
            return
        end
        local u15 = DJRangeRing.new({
            MaxBars = u24,
            Model = Model,
            Range = Range,
            RangeAnimation = u35,
            RangeColor = a1.RangeColor,
            RangeRef = RangeRef,
            SetRangeColor = a1.SetRangeColor,
            Track = u13,
            TrackColors = u44,
        })
        return function() -- Line: 103 -- upvalues: u15 (val)
            u15:Destroy()
        end
    end, v2)
    v2 = {Range}
    useReactBindings(function(a1) -- Line: 118 -- upvalues: u36 (val)
        u36()
    end, v2)
    return nil
end

return v1