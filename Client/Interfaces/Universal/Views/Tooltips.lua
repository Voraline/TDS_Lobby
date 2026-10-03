-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Tooltips
-- Decompile time: 3.72 ms

local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Mouse = Players.LocalPlayer:GetMouse()
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local TooltipWindow = require(ReplicatedStorage.Client.Interfaces.Components.TooltipWindow).TooltipWindow
local NewTooltipStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.NewTooltipStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local joinBindings = React.joinBindings
local createElement = React.createElement
local useRef = React.useRef
local useEffect = React.useEffect
local useState = React.useState
local u62 = React.memo(function(a1) -- Line: 44
    -- upvalues: useReactBinding (val), useReactBindings (val), Mouse (val), GuiService (val), useEffect (val)
    -- upvalues: createElement (val), TooltipWindow (val), joinBindings (val)
    local Element = a1.Element
    local Tooltip = a1.Tooltip
    local Visible = a1.Visible
    local v1, u7 = useReactBinding(Vector2.zero)
    local v2, u11 = useReactBinding(Vector2.zero)
    local v3 = {v1}
    local v4 = {Element}
    useReactBindings(function(a1) -- Line: 52 -- upvalues: Mouse (upval), Element (val), GuiService (upval), u11 (val) -- types: a1: userdata
        local v1 = Vector2.new(0, 1)
        local X = a1.X
        local Y = a1.Y
        local ViewSizeX = Mouse.ViewSizeX
        local ViewSizeY = Mouse.ViewSizeY
        local v2 = (Vector2.new(Element.AbsolutePosition.X, Element.AbsolutePosition.Y)) - GuiService:GetGuiInset()
        local v3 = X + v2.X
        if ViewSizeX - 400 < v3 then
            v1 = v1 + Vector2.new(1, 0)
        end
        v3 = Y + v2.Y
        if ViewSizeY - 400 < v3 then
            v1 = v1 + Vector2.new(0, 1)
        end
        u11(v1)
    end, v3, v4)
    v3 = {Element, Visible}
    useEffect(function() -- Line: 73 -- upvalues: Element (val), a1 (val), u7 (val)
        local u6 = Element.MouseEnter:Connect(a1.OnEnter)
        local u13 = Element.MouseLeave:Connect(a1.OnLeave)
        local u19 = Element.MouseMoved:Connect(function(a1, a2) -- Line: 77 -- upvalues: Element (upval), u7 (upval)
            local v1 = a1 - Element.AbsolutePosition.X
            local v2 = a2 - Element.AbsolutePosition.Y
            u7(Vector2.new(v1, v2))
        end)
        return function() -- Line: 84 -- upvalues: u6 (val), u13 (val), u19 (val)
            u6:Disconnect()
            u13:Disconnect()
            u19:Disconnect()
        end
    end, v3)
    if not Visible then
        return nil
    end
    return createElement(TooltipWindow, {
        Visible = true,
        Header = Tooltip.Header,
        Subject = Tooltip.Subject,
        Content = Tooltip.Content,
        AnchorPoint = v2,
        Position = (joinBindings({v2, v1})):map(function(a1) -- Line: 104 -- upvalues: Element (val), GuiService (upval)
            local v1, v2 = unpack(a1)
            if not Element then
                return UDim2.fromOffset(0, 0)
            end
            local v3 = Vector2.new(10, 0)
            local GuiInset = GuiService:GetGuiInset()
            local v4 = (UDim2.fromOffset(Element.AbsolutePosition.X, Element.AbsolutePosition.Y)) - UDim2.fromOffset(GuiInset.X, GuiInset.Y)
            if 0 < v1.X then
                v3 = v3 * Vector2.new(-1, 1)
            end
            if 0 < v1.Y then
                v3 = v3 * Vector2.new(1, -1)
            end
            return v4 + UDim2.fromOffset(v2.X + v3.X, v2.Y + v3.Y)
        end),
    })
end, function(a1, a2) -- Line: 127
    local v1 = false
    if a1.Element == a2.Element then
        v1 = false
        if a1.Tooltip == a2.Tooltip then
            v1 = a1.Visible == a2.Visible
        end
    end
    return v1
end)
return function(a1) -- Line: 133
    -- upvalues: useState (val), useRef (val), ReactCharm (val), NewTooltipStore (val), createElement (val), u62 (val)
    -- upvalues: React (val)
    local name
    local v1, u65 = useState("")
    local u7 = useRef(v1)
    u7.current = v1
    local v2 = {}
    for k, v in pairs((ReactCharm.useSignalState(NewTooltipStore.getState))) do
        name = v.name
        v2[name] = (createElement(u62, {
            Element = v.element,
            Tooltip = v.tooltip,
            UpdateTooltip = u65,
            Visible = v1 == v.name,
            OnEnter = function() -- Line: 150 -- upvalues: u7 (val), v (val), u65 (val)
                u7.current = v.name
                u65(v.name)
            end,
            OnLeave = function() -- Line: 155 -- upvalues: u7 (val), v (val), u65 (val)
                if u7.current == v.name then
                    u7.current = ""
                    u65("")
                end
            end,
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 1),
    }, {content = React.createElement(React.Fragment, {}, v2)})
end