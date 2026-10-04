-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Toasts
-- Decompile time: 4.41 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Hooks = Interfaces.Hooks
local Components = Interfaces.Components
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local ToastController = require(ReplicatedStorage.Client.Controllers.Shared.ToastController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Toast = require(Components.Toast)
local useSound = require(Hooks.useSound)
local useViewEnabled = require(Hooks.useViewEnabled)
local createElement = React.createElement
local useEffect = React.useEffect
local useCallback = React.useCallback
local useState = React.useState
local useMemo = React.useMemo
local Toast_2 = NewNetwork.Channel("Toast")
return function() -- Line: 35
    -- upvalues: useViewEnabled (val), useSound (val), useState (val), useCallback (val), table (val), HttpService (val)
    -- upvalues: useEffect (val), Toast_2 (val), ToastController (val), useMemo (val), createElement (val), Toast (val)
    -- upvalues: React (val)
    local Hotbar = useViewEnabled("Hotbar")
    local v1 = useViewEnabled("")
    local u10 = useSound("Notification", true)
    local u13, u14 = useState({})
    local v2 = {u13}
    local u19 = useCallback(function(a1) -- Line: 43 -- upvalues: u10 (val), u14 (val), table (upval), HttpService (upval)
        u10()
        u14(function(a1_2) -- Line: 46 -- upvalues: table (upval), HttpService (upval), a1 (val)
            local v1 = table.clone(a1_2)
            table.insert(v1, {
                id = HttpService:GenerateGUID(false),
                title = a1.title,
                icon = a1.icon,
                description = a1.description,
                duration = a1.duration,
            })
            return v1
        end)
    end, v2)
    local v3 = {u19}
    useEffect(function() -- Line: 61 -- upvalues: Toast_2 (upval), u19 (val), ToastController (upval)
        local u5 = Toast_2:onEvent("Show", function(a1) -- Line: 62 -- upvalues: u19 (upval)
            u19(a1)
        end)
        local u9 = ToastController.onToastNotification(function(a1) -- Line: 66 -- upvalues: u19 (upval)
            u19(a1)
        end)
        return function() -- Line: 70 -- upvalues: u5 (val), u9 (val)
            u5()
            u9()
        end
    end, v3)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(400, 400),
        Position = UDim2.new(1, 0, 1, -40),
        AnchorPoint = Vector2.new(1, 1),
        Visible = Hotbar or v1,
    }, {
        list = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            Padding = UDim.new(0, 10),
        }),
        items = createElement(React.Fragment, {}, (useMemo(function() -- Line: 76 -- upvalues: table (upval), u13 (val), createElement (upval), Toast (upval), u14 (val)
            return table.reduce(u13, function(a1, a2, a3) -- Line: 77 -- upvalues: table (upval), createElement (upval), Toast (upval), u14 (upval)
                table.insert(a1, createElement(Toast, {
                    title = a2.title,
                    description = a2.description,
                    icon = a2.icon,
                    duration = a2.duration,
                    layoutOrder = a3,
                    onLeave = function() -- Line: 86 -- upvalues: u14 (upval), table (upval), a2 (val)
                        u14(function(a1) -- Line: 87 -- upvalues: table (upval), a2 (upval)
                            return table.filter(a1, function(a1) -- Line: 88 -- upvalues: a2 (upval)
                                return a1.id ~= a2.id
                            end)
                        end)
                    end,
                }))
                return a1
            end, {})
        end, {u13}))),
    })
end