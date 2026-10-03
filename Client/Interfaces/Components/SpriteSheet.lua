-- Script path: ReplicatedStorage.Client.Interfaces.Components.SpriteSheet
-- Decompile time: 2.58 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local createElement = React.createElement
local u32 = {}
local u33 = nil

local function connectToStep(a1) -- Line: 50
    -- upvalues: u33 (ref), HttpService (val), RunService (val), u32 (val)
    if not u33 then
        u33 = HttpService:GenerateGUID(false)
        RunService:BindToRenderStep(u33, Enum.RenderPriority.First.Value, function(a1) -- Line: 54 -- upvalues: u32 (upval), RunService (upval), u33 (upval) -- types: a1: number
            if not next(u32) then
                RunService:UnbindFromRenderStep(u33)
                u33 = nil
                return
            end
            for k in pairs(u32) do
                k(a1)
            end
        end)
    end
    u32[a1] = true
    return function() -- Line: 69 -- upvalues: u32 (upval), a1 (val)
        u32[a1] = nil
    end
end

local function extractProps(a1, a2) -- Line: 74 -- types: a1: table, a2: table
    local v1 = {}
    for i, j in a2 do
        v1[j] = a1[j]
        a1[j] = nil
    end
    return v1
end

return function(a1) -- Line: 85
    -- upvalues: useReactBinding (val), React (val), connectToStep (val), createElement (val)
    local v1 = table.clone(a1)
    local v2 = {}
    for i, j in {"elementType", "sheets", "looped", "playing", "from", "frameRate"} do
        v2[j] = v1[j]
        v1[j] = nil
    end
    local v3, u25 = useReactBinding("")
    local v4, u29 = useReactBinding(Vector2.zero)
    local v5, u33 = useReactBinding(Vector2.zero)
    local v6 = v2.elementType or "ImageLabel"
    local sheets = v2.sheets
    if not sheets then
        sheets = {}
    end
    local u42 = v2.looped ~= false
    local u46 = v2.playing ~= false
    local from = v2.from
    local u50 = v2.frameRate or 60
    local v7 = {sheets, u46, u42, from, u50}
    React.useEffect(function() -- Line: 103
        -- upvalues: u46 (val), from (val), connectToStep (upval), u50 (val), sheets (val), u42 (val), u29 (val)
        -- upvalues: u25 (val), u33 (val)
        if not u46 then
            return
        end
        local u1 = 0
        local u3 = from or 1
        local u4 = 1
        local u5 = 0
        local u6 = nil
        u6 = (connectToStep(function(a1) -- Line: 114
            -- upvalues: u1 (ref), u50 (upval), sheets (upval), u4 (ref), u3 (ref), from (upval), u5 (ref), u42 (upval)
            -- upvalues: u6 (ref), u29 (upval), u25 (upval), u33 (upval)
            u1 = u1 + a1
            if u1 < 1 / u50 then
                return
            end
            local v1 = sheets[u4]
            if not v1 then
                return
            end
            local grid = v1.grid
            local v2 = (u3 - 1) % grid.X
            local v3 = math.floor((u3 - 1) / grid.X)
            local max = v1.max or grid.X * grid.Y
            if max < u3 then
                v2 = 0
                v3 = 0
                u3 = from or 1
                u4 = u4 % #sheets + 1
                v1 = sheets[u4]
                local grid_2 = v1.grid
                u5 = u5 + 1
                if not u42 then
                    u6()
                    return
                end
            end
            local size = v1.size
            u29(size)
            u25((("rbxassetid://%*"):format(v1.id)))
            u33(Vector2.new(v2 * size.X, v3 * size.Y))
            u1 = 0
            u3 = u3 + 1
        end))
        return u6
    end, v7)
    v1.Image = v3
    v1.ImageRectSize = v4
    v1.ImageRectOffset = v5
    return createElement(v6, v1, {})
end