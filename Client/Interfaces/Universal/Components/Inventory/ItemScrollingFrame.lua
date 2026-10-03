-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.ItemScrollingFrame
-- Decompile time: 1.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 16
    -- upvalues: useScale (val), React (val), TweenService (val), createElement (val)
    local v1 = useScale(1, nil, true)
    local u9 = React.useRef(nil)
    local useEffect = React.useEffect
    local v2 = {a1.selected, u9}
    useEffect(function() -- Line: 21 -- upvalues: u9 (val), a1 (val), TweenService (upval)
        local current = u9.current
        if not current then
            return
        end
        if a1.selected and a1.selected ~= "" then
            local u6 = true
            task.defer(function() -- Line: 32 -- upvalues: u6 (ref), current (val), a1 (upval), TweenService (upval)
                if not u6 then
                    return
                end
                local towerContainer = current:FindFirstChild("towerContainer")
                if towerContainer and towerContainer:IsA("GuiObject") then
                    local v1 = towerContainer:FindFirstChild(a1.selected, true)
                    if v1 and v1:IsA("GuiObject") then
                        local v2 = v1.AbsolutePosition.Y - current.AbsolutePosition.Y - towerContainer.AbsolutePosition.Y
                        TweenService:Create(
                            current,
                            TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                            {
                                CanvasPosition = Vector2.new(0, (math.clamp(v2, 0, (1 / 0)))),
                            }
                        ):Play()
                        return
                    end
                    return
                end
            end)
            return function() -- Line: 61 -- upvalues: u6 (ref)
                u6 = false
            end
        end
    end, v2)
    if a1.Visible == false then
        return
    end
    return createElement("ScrollingFrame", {
        Active = true,
        BackgroundTransparency = 1,
        BottomImage = "",
        BorderSizePixel = 0,
        MidImage = "rbxassetid://95591733073455",
        ScrollBarThickness = 4,
        TopImage = "",
        Visible = a1.Visible,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
        Position = UDim2.fromScale(0.500246, 0.54092),
        ScrollBarImageColor3 = Color3.fromRGB(172, 172, 172),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Size = UDim2.fromScale(0.985791, 0.918161),
        ref = u9,
    }, {
        towerContainer = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 0),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Wraps = true,
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 16 * v1),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            items = createElement(React.Fragment, nil, a1.children),
            uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 20 * v1)}),
        }),
        padding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12 * v1),
            PaddingTop = UDim.new(0, 8 * v1),
        }),
    })
end)