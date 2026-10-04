-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Music.MusicContent
-- Decompile time: 12.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MusicController = require(ReplicatedStorage.Client.Controllers.Shared.MusicController)
local MusicEntry = require(script.Parent.MusicEntry)
local React = require(ReplicatedStorage.Shared.UI.React)
local Searchbox = require(script.Parent.Parent.Searchbox)
local fzy = require(ReplicatedStorage.Shared.Modules.fzy)
local useSandboxWhitelist = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist)
local createElement = React.createElement
local useState = React.useState
return function() -- Line: 13
    -- upvalues: useState (val), useSandboxWhitelist (val), MusicController (val), React (val), createElement (val)
    -- upvalues: MusicEntry (val), Searchbox (val), fzy (val)
    local v1, u3 = useState(Enum.SortOrder.Name)
    local u6, u7 = useState(nil)
    local Music = useSandboxWhitelist("Music")
    local Tracks = MusicController.Tracks
    local v2 = {Tracks}
    local u18 = React.useMemo(function() -- Line: 20 -- upvalues: Tracks (val)
        local v1 = {}
        for i in Tracks do
            table.insert(v1, i)
        end
        return v1
    end, v2)
    local v3 = {u6, Tracks, Music}
    local v4 = React.useMemo(function() -- Line: 30 -- upvalues: u6 (val), Tracks (val), Music (val), createElement (upval), MusicEntry (upval)
        local v1 = {}
        for i in u6 or Tracks do
            if Music[i] then
                v1[i] = (createElement(MusicEntry, {enabled = true, idx = 1, id = i}))
            end
        end
        return v1
    end, v3)
    local v5 = {u18}
    local u32 = React.useCallback(function(a1) -- Line: 48 -- upvalues: u18 (val), u7 (val)
        local v1 = {}
        for i, j in u18 do
            if a1(j) then
                v1[j] = true
            end
        end
        u7(v1)
    end, v5)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }, {
        searchbox = createElement(Searchbox, {
            Text = "Search for Music",
            OnSearch = function(a1) -- Line: 68 -- upvalues: u7 (val), u3 (val), fzy (upval), u18 (val), u32 (val) -- types: a1: string
                if a1 == "" then
                    u7(nil)
                    u3(Enum.SortOrder.Name)
                    return
                end
                local u13 = fzy.filter(a1, u18, false, true)
                table.sort(u13, function(a1, a2) -- Line: 77
                    local v1 = a1[3]
                    return a2[3] < v1
                end)
                u32(function(a1) -- Line: 81 -- upvalues: u13 (val), u18 (upval)
                    for i, j in u13 do
                        if u18[j[1]] == a1 and j[2] then
                            return true
                        end
                    end
                    return false
                end)
                u3(Enum.SortOrder.LayoutOrder)
            end,
        }),
        content = createElement("ScrollingFrame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            TopImage = "",
            BottomImage = "",
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, -45),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
        }, {
            padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 5),
                PaddingBottom = UDim.new(0, 5),
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5),
            }),
            gridLayout = createElement("UIGridLayout", {
                CellSize = UDim2.fromOffset(148, 148),
                CellPadding = UDim2.fromOffset(5, 5),
                SortOrder = v1,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                FillDirection = Enum.FillDirection.Horizontal,
            }),
            content = createElement(React.Fragment, {}, v4),
        }),
    })
end