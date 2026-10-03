-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Profiler
-- Decompile time: 2.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local ProfilerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ProfilerStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local createElement = React.createElement

local function formatTimes(a1) -- Line: 10 -- upvalues: table (val)
    local v1 = {}
    for i, j in a1 do
        table.insert(v1, {i, unpack(j)})
    end
    table.sort(v1, function(a1, a2) -- Line: 20
        local v1 = a1[1]
        return a2[1] < v1
    end)
    return v1
end

local function renderTimes(a1) -- Line: 27 -- upvalues: formatTimes (val), createElement (val), React (val)
    local Left, v1, v2, v3, v4
    local v5 = {}
    local v6 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    for i, j in formatTimes(a1) do
        v3 = {}
        v4 = 1 / #j
        for i2, v in ipairs(j) do
            Left = if i2 ~= 1 then if i2 ~= #j then Enum.TextXAlignment.Center else Enum.TextXAlignment.Right else Enum.TextXAlignment.Left
            v2 = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                Text = v,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Left,
                FontFace = v6,
                Size = UDim2.fromScale(v4, 1),
                Position = UDim2.fromScale(0.5, 0),
                LayoutOrder = i2,
            })
            v3[tostring(i2)] = v2
        end
        v1 = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 12)}, {
            uiListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 0),
            }),
            labels = React.createElement(React.Fragment, {}, v3),
        })
        v5[j[1]] = v1
    end
    return v5
end

return function(a1) -- Line: 85
    -- upvalues: ReactCharm (val), ProfilerStore (val), createElement (val), React (val), renderTimes (val)
    local v1 = ReactCharm.useSignalState(ProfilerStore.getState)
    local Visible = if a1.Visible ~= nil then a1.Visible else true
    if not _G.__DEV__ then
        return
    end
    local v2 = {BackgroundTransparency = 1, ZIndex = 999, Visible = Visible and next(v1) ~= nil}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(1, 1)
    v2.AnchorPoint = AnchorPoint
    v2.AutomaticSize = Enum.AutomaticSize.Y
    local Position = a1.Position or UDim2.new(1, -20, 1, -20)
    v2.Position = Position
    v2.Size = UDim2.fromOffset(300, 0)
    return createElement("Frame", v2, {
        title = createElement("TextLabel", {
            Text = "PROFILER",
            BackgroundTransparency = 1,
            TextScaled = true,
            TextStrokeTransparency = 0.8,
            Size = UDim2.new(1, 0, 0, 15),
            TextXAlignment = Enum.TextXAlignment.Left,
            Position = UDim2.fromOffset(0, -20),
            TextColor3 = Color3.new(1, 1, 1),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        }),
        content = createElement("Frame", {
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            Position = UDim2.fromOffset(0, 0),
            Size = UDim2.fromScale(1, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }, {
            uiPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                PaddingTop = UDim.new(0, 10),
            }),
            uiListLayout = createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5)}),
            content = React.createElement(React.Fragment, {}, (renderTimes(v1))),
        }),
    })
end