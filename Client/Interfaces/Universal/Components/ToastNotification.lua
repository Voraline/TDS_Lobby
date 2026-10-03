-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.ToastNotification
-- Decompile time: 1.97 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u12 = require("./ToastMessage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sift = require(ReplicatedStorage.Packages.Sift)
require(ReplicatedStorage.Shared.Modules.Signal)
local createElement = React.createElement
local useState = React.useState
local useRef = React.useRef
local useEffect = React.useEffect

local function useNotificationList(a1) -- Line: 31
    -- upvalues: useState (val), useRef (val), useEffect (val), HttpService (val)
    local v1, u4 = useState({})
    local u7 = useRef(0)
    local onEvent = a1.onEvent
    local v2 = {onEvent}
    useEffect(function() -- Line: 37 -- upvalues: onEvent (val), u4 (val), u7 (val), HttpService (upval)
        if not onEvent then
            return
        end
        local u5 = onEvent:Connect(function(a1, a2) -- Line: 42 -- upvalues: u4 (upval), u7 (upval), HttpService (upval)
            u4(function(a1_2) -- Line: 43 -- upvalues: u7 (upval), HttpService (upval), a1 (val), a2 (val), u4 (upval)
                local v1 = table.clone(a1_2)
                local v2 = u7
                v2.current = v2.current + 1
                local u7_2 = {}
                u7_2.id = HttpService:GenerateGUID(false)
                u7_2.message = a1
                u7_2.order = -u7.current
                table.insert(v1, 1, u7_2)
                task.delay(a2 or 5, function() -- Line: 54 -- upvalues: u4 (upval), u7_2 (val)
                    u4(function(a1) -- Line: 55 -- upvalues: u7_2 (upval)
                        local v1 = table.find(a1, u7_2)
                        if not v1 then
                            return a1
                        end
                        local v2 = table.clone(a1)
                        table.remove(v2, v1)
                        return v2
                    end)
                end)
                while #v1 > 4 do
                    table.remove(v1)
                end
                return v1
            end)
        end)
        return function() -- Line: 75 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, v2)
    return v1
end

return React.memo(function(a1) -- Line: 83
    -- upvalues: Sift (val), useNotificationList (val), createElement (val), u12 (val), ReactFlow (val)
    local v1 = Sift.Dictionary.merge({
        BackgroundTransparency = 1,
        ZIndex = 10,
        Size = UDim2.fromScale(1, 0.1),
        Position = UDim2.fromScale(0.8, 0.3),
        AnchorPoint = Vector2.new(0.5, 0),
    }, a1.native or {})
    local v2 = {}
    for i, j in (useNotificationList({onEvent = a1.onEvent})) do
        v2[j.id] = (createElement(u12, {
            native = {
                TextScaled = true,
                Size = UDim2.fromScale(1, 0.1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextXAlignment = Enum.TextXAlignment.Center,
                LayoutOrder = j.order,
            },
            text = j.message,
        }))
    end
    return createElement("Frame", v1, {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0, 5),
        }),
        Content = createElement(ReactFlow.DynamicList, {children = v2}),
    })
end)