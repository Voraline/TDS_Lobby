-- Script path: ReplicatedStorage.Client.Interfaces.NPCViews.Components.NewSpriteSheet
-- Decompile time: 5.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useBinding = React.useBinding

local function extractProps(a1, a2) -- Line: 27 -- types: a1: table, a2: table
    local v1 = {}
    for i, j in a2 do
        v1[j] = a1[j]
        a1[j] = nil
    end
    return v1
end

return React.memo(function(a1) -- Line: 38 -- upvalues: useBinding (val), React (val), Maid (val), RunService (val), createElement (val)
    local v1 = table.clone(a1.native or {})
    local v2 = {}
    for i, j in {"elementType", "sheets", "looped", "playing", "from", "frameRate"} do
        v2[j] = a1[j]
        a1[j] = nil
    end
    local v3, u28 = useBinding("")
    local v4, u32 = useBinding(Vector2.zero)
    local v5, u36 = useBinding(Vector2.zero)
    local v6 = v2.elementType or "ImageLabel"
    local sheets = v2.sheets
    if not sheets then
        sheets = {}
    end
    local u45 = v2.looped ~= false
    local u49 = v2.playing ~= false
    local from = v2.from
    local u53 = v2.frameRate or 60
    local u57 = React.useRef(nil)
    local v7 = {u57}
    React.useEffect(function() -- Line: 56 -- upvalues: Maid (upval), sheets (val), u57 (val)
        local ImageLabel
        local u2 = Maid.new()
        for i, j in sheets do
            ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Image = ("rbxassetid://%*"):format(j.id)
            ImageLabel.Size = UDim2.fromOffset(23, 23)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.ImageTransparency = 0.99
            ImageLabel.Position = UDim2.fromScale(0.5, 0.1)
            ImageLabel.Parent = u57.current
            u2:Mark(ImageLabel)
        end
        return function() -- Line: 69 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v7)
    local useEffect_2 = React.useEffect
    local deps = a1.deps or {sheets, u49, u45, from, u53}
    useEffect_2(function() -- Line: 74
        -- upvalues: u49 (val), from (val), RunService (upval), u53 (val), sheets (val), u45 (val), u32 (val), u28 (val)
        -- upvalues: u36 (val)
        if not u49 then
            return
        end
        local u1 = 0
        local u3 = from or 1
        local u4 = 1
        local u5 = 0
        local u6 = nil
        u6 = RunService.Heartbeat:Connect(function(a1) -- Line: 85
            -- upvalues: u1 (ref), u53 (upval), sheets (upval), u4 (ref), u3 (ref), from (upval), u5 (ref), u45 (upval)
            -- upvalues: u6 (ref), u32 (upval), u28 (upval), u36 (upval)
            u1 = u1 + a1
            if u1 < 1 / u53 then
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
                if not u45 then
                    u6:Disconnect()
                    return
                end
            end
            local size = v1.size
            u32(size)
            u28((("rbxassetid://%*"):format(v1.id)))
            u36(Vector2.new(v2 * size.X, v3 * size.Y))
            u1 = 0
            u3 = u3 + 1
        end)
        return function() -- Line: 126 -- upvalues: u6 (ref)
            pcall(function() -- Line: 127 -- upvalues: u6 (upval)
                u6:Disconnect()
            end)
        end
    end, deps)
    v1.Image = v3
    v1.ImageRectSize = v4
    v1.ImageRectOffset = v5
    v1.ref = u57
    return createElement(v6, v1, a1.children)
end)