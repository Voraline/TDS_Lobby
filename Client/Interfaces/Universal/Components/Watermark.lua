-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Watermark
-- Decompile time: 5.12 ms

local repeatTextUntilFullRow, repeatTextUntilMax
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local u23 = Color3.new(1, 1, 1)

function repeatTextUntilMax(a1, a2) -- Line: 19 -- upvalues: repeatTextUntilMax (val) -- types: a1: string, a2: number?
    local v1 = a2 or 1
    if #string.rep(a1, v1) >= 16000 then
        return (string.rep(a1, v1 - 1)), v1 - 1
    end
    return repeatTextUntilMax(a1, v1 + 1)
end

function repeatTextUntilFullRow(a1, a2, a3, a4, a5) -- Line: 29
    -- upvalues: TextService (val), repeatTextUntilFullRow (val)
    local v1 = a4.Y - a3
    if not (TextService:GetTextSize(string.rep(a1 .. " ", a5), 18, Enum.Font.GothamBold, (Vector2.new(a4.X, 10000))).Y <= v1)
        and not (a5 <= 1) then
        return repeatTextUntilFullRow(a1, a2, a3, a4, a5 - 1)
    end
    return (string.rep(a1 .. " ", a5)), a5
end

return function(a1) -- Line: 49
    -- upvalues: useState (val), useEffect (val), repeatTextUntilMax (val), createElement (val), u23 (val), React (val)
    -- upvalues: repeatTextUntilFullRow (val)
    local v1, v2, v3, v4, v5, v6, v7
    local u5, u6 = useState(workspace.CurrentCamera.ViewportSize)
    useEffect(function() -- Line: 53 -- upvalues: u5 (val), u6 (val)
        local u9 = (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 56 -- upvalues: u5 (upval), u6 (upval)
            local X = u5.X
            if workspace.CurrentCamera.ViewportSize.X < X then
                return
            end
            u6(workspace.CurrentCamera.ViewportSize)
        end)
        return function() -- Line: 64 -- upvalues: u9 (val)
            if u9.Connected then
                u9:Disconnect()
            end
        end
    end, {})
    local v8 = {}
    for i = 1, 4 do
        u19, u20 = useState(false)
        v2 = a1.Text .. " "
        if not (#string.rep(v2, 1) >= 16000) then
            v3, v4 = repeatTextUntilMax(v2, 2)
            v7 = v3
            v1 = v4
        else
            v7 = string.rep(v2, 0)
            v1 = 0
        end
        v2, u48 = useState(v7)
        u52, u53 = useState(v1)
        v5 = createElement
        v6 = {
            Size = UDim2.fromScale(1.25, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = v2,
            TextColor3 = u23,
            TextSize = 18,
            TextStrokeTransparency = 1,
            TextTransparency = 0.925,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            ZIndex = 9999,
            ClipsDescendants = true,
            AutoLocalize = false,
        }

        v6[React.Change.AbsoluteSize] = function(a1_2) -- Line: 101
            -- upvalues: u19 (val), u20 (val), repeatTextUntilFullRow (upval), a1 (val), u5 (val), u52 (val), u53 (val)
            -- upvalues: u48 (val)
            if u19 then
                return
            end
            u20(true)
            local v1, v2 = repeatTextUntilFullRow(a1.Text .. " ", u5, a1_2.TextSize, a1_2.AbsoluteSize, u52)
            u53(v2)
            u48(v1)
        end

        v5 = v5("TextLabel", v6)
        table.insert(v8, v5)
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 9999,
        Size = UDim2.fromScale(1, 1.25),
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, -0.1),
    }, {
        listLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 0),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        elements = React.createElement(React.Fragment, {}, v8),
    })
end