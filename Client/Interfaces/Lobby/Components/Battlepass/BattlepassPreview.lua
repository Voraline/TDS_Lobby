-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassPreview
-- Decompile time: 19.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local CrateDisplayName = require(ReplicatedStorage.Client.Interfaces.CrateDisplayName)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local BattlepassItem = require(script.Parent.BattlepassItem)
local ImageLabel = require(Components.ImageLabel)
local Tooltip = require(Components.Tooltip)
local Event = React.Event
local Spring = ReactFlow.Spring
local useTween = ReactFlow.useTween
local useSpring = ReactFlow.useSpring
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local useMemo = React.useMemo
local useBinding = React.useBinding
local useEffect = React.useEffect
local useRef = React.useRef
local createElement = React.createElement
local memo = React.memo
local u53 = {}
u53.Default = UDim2.fromScale(0.25, 0.25)
u53.Completed = UDim2.fromScale(0.4, 0.4)
local u64 = memo(function(a1) -- Line: 40 -- upvalues: createElement (val), ImageLabel (val)
    local v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Active = false,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v1.Position = Position
    v1.Size = UDim2.fromScale(1.002, 1)
    v1.Visible = a1.Visible
    local v2 = {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.054, 0)})}
    local v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        disableSpinner = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local icon_2 = not (typeof(a1.icon) ~= "string") and a1.icon or ("rbxassetid://%*"):format(a1.icon)
    v3.Image = icon_2
    v3.ImageTransparency = a1.Transparency
    v3.ImageColor3 = a1.color
    v3.Position = UDim2.fromScale(0.8, 0.2)
    v3.ScaleType = Enum.ScaleType.Fit
    v3.Size = a1.Size
    v2.imageLabel = createElement(ImageLabel, v3)
    return createElement("Frame", v1, v2)
end)
return (memo(function(a1) -- Line: 74
    -- upvalues: useRef (val), useState (val), useGroupAnimation (val), useAnimation (val), Spring (val)
    -- upvalues: useBinding (val), u53 (val), useSpring (val), useTween (val), CrateDisplayName (val), useMemo (val)
    -- upvalues: table (val), useEffect (val), createElement (val), Event (val), u64 (val), ImageLabel (val)
    -- upvalues: Tooltip (val), BattlepassItem (val), React (val)
    local v1
    local v2 = useRef()
    local u5, u6 = useState(false)
    local v3, u29 = useGroupAnimation({
        pressing = useAnimation({scale = Spring({target = 0.95, speed = 30, damper = 0.6})}),
        hovering = useAnimation({scale = Spring({target = 1.05, speed = 30, damper = 0.6})}),
        idle = useAnimation({scale = Spring({target = 1, speed = 30, damper = 0.6})}),
    }, {scale = 1})
    local clicked = a1.clicked
    local Transparency = a1.Transparency or useBinding(0)
    local v4 = a1.removeBG == true
    local v5 = a1.slice == true
    local item = a1.item
    local v6 = ""
    local color = a1.color
    if not color then
        color = Color3.fromRGB(42, 255, 97)
    end
    local lockedColor = a1.lockedColor or Color3.fromRGB(58, 58, 58)
    local iconVisible = if a1.iconVisible == nil then true else a1.iconVisible
    local v7 = a1.premium == true
    local v8 = a1.completed == true
    local v9 = a1.locked == true
    local v10 = a1.selected == true
    local v11 = nil
    local v12 = 1197061307
    local Default = u53.Default
    if not item then
        if v9 then
            color = lockedColor
        end
    elseif v8 then
        color = Color3.fromRGB(42, 255, 97)
        v11 = color
        v12 = 119365628513374
        Default = u53.Completed
    elseif v9 then
        color = lockedColor
    end
    if v9 then
        v12 = if not v7 then 1197061307 else 1197061307
        Default = u53.Default
        v11 = Color3.new(1, 1, 1)
    end
    if a1.reference then
        a1.reference.current = v2.current
    end
    local v13, u156 = useSpring({start = 0, target = 0, speed = 15, damper = 0.4})
    local v14, u176 = useTween({
        info = TweenInfo.new(0.2, Enum.EasingStyle.Sine),
        start = color,
        target = color,
    })
    if item then
        v1 = (item.type:sub(1, 1):upper()) .. item.type:sub(2)
        if v1 == "Nametag" then
            v1 = "Tag"
        end
        if item.type == "tower" then
            v6 = ("%* %*"):format(item.tower, v1)
        elseif item.type == "skin" then
            v6 = ("%* %* Skin"):format(item.skin, item.tower)
        elseif item.type == "crate" then
            local v15 = item.amount and 1 < item.amount and ("x%* "):format(item.amount) or ""
            v6 = v15 .. CrateDisplayName.withSuffix(item.name)
        elseif item.type == "stat" then
            v6 = ("%* %*"):format(item.amount, if item.stat ~= "Experience" then item.stat else "XP")
        elseif item.type == "flair" then
            v6 = ("[ %* ]"):format(item.name)
        elseif item.type ~= "badge" then
            v6 = ("%* %*"):format(item.name, v1)
        end
    end
    local v16 = {item, u5}
    v1 = useMemo(function() -- Line: 178 -- upvalues: item (val), table (upval), iconVisible (val), u5 (val)
        if not item then
            return nil
        end
        return table.merge({}, item, {
            ZIndex = 2,
            Visible = iconVisible,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.868, 0.868),
            playing = u5,
        })
    end, v16)
    local v17 = {v12}
    useEffect(function() -- Line: 193 -- upvalues: u156 (val)
        u156({force = 1.5})
    end, v17)
    v17 = {color}
    useEffect(function() -- Line: 197 -- upvalues: u176 (val), color (ref)
        u176({target = color})
    end, v17)
    v17 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.9,
        LayoutOrder = a1.LayoutOrder or 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }
    local Size = a1.Size or UDim2.fromScale(1, 0.404)
    v17.Size = Size
    v17.SizeConstraint = a1.SizeConstraint
    v17.Position = a1.Position
    v17.AnchorPoint = a1.AnchorPoint
    v17.Text = ""
    v17.ref = v2
    v17.ZIndex = a1.ZIndex

    v17[Event.MouseButton1Down] = function() -- Line: 219 -- upvalues: u5 (val), clicked (val), u29 (val)
        if u5 and clicked then
            u29("pressing")
        end
    end

    v17[Event.MouseButton1Up] = function() -- Line: 225 -- upvalues: clicked (val), u5 (val), u29 (val)
        if clicked then
            if not u5 then
                u29("idle")
            else
                u29("hovering")
            end
        end
        if u5 and clicked then
            clicked()
        end
    end

    v17[Event.MouseEnter] = function() -- Line: 239 -- upvalues: clicked (val), u6 (val), u29 (val)
        if clicked then
            u6(true)
            u29("hovering")
        end
    end

    v17[Event.MouseLeave] = function() -- Line: 246 -- upvalues: clicked (val), u6 (val), u29 (val)
        if clicked then
            u6(false)
            u29("idle")
        end
    end

    local v18 = {
        aspectRatio = if not a1.AspectRatio then nil else createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio}),
    }
    local v19 = {BackgroundTransparency = 1}
    local innerSize = a1.innerSize or UDim2.fromScale(1, 1)
    v19.Size = innerSize
    v19.Position = UDim2.fromScale(0.5, 0.5)
    v19.AnchorPoint = Vector2.new(0.5, 0.5)
    local v20 = {scale = createElement("UIScale", {Scale = v3.scale})}
    local v21 = {
        Visible = iconVisible and (v9 or v8),
        Transparency = Transparency,
        Position = v13:map(function(a1) -- Line: 272
            return UDim2.fromScale(0.5, 0.5 - a1)
        end),
        Size = v13:map(function(a1) -- Line: 275 -- upvalues: Default (ref)
            return UDim2.fromScale(Default.X.Scale, Default.Y.Scale + a1)
        end),
        icon = v12,
        color = v11 or Color3.new(1, 1, 1),
        premium = v7,
    }
    v20.locked = createElement(u64, v21)
    local v22 = not v4
    if v22 then
        v21 = {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            Image = "rbxassetid://85205412837336",
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        local bgSize = a1.bgSize or UDim2.fromScale(1.6, 1.61)
        v21.Size = bgSize
        v21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v21.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v21.ImageColor3 = v14
        v21.ImageTransparency = Transparency
        v21.ScaleType = v5 and Enum.ScaleType.Slice or nil
        v21.SliceCenter = v5 and Rect.new(249, 245, 249, 245) or nil
        v22 = createElement(ImageLabel, v21)
    end
    v20.bG = v22
    v22 = v1 and createElement(Tooltip, {
        Header = "Reward",
        Name = ("%*BattlepassTooltip"):format(v1.tower or v1.stat or v1.name),
        Subject = v6,
    })
    v20.tooltip = v22
    if not v1 then
        v22 = nil
    else
        local merge = table.merge
        v22 = createElement(BattlepassItem, merge({}, v1, {
            Transparency = if not v9 then Transparency else if v10 then Transparency else Transparency:map(function(a1) -- Line: 316
                return 1 - 0.4 * (1 - a1)
            end),
        })) or nil
    end
    v20.item = v22
    v20.children = createElement(React.Fragment, {}, a1.children)
    v18.content = createElement("Frame", v19, v20)
    return (createElement("TextButton", v17, v18))
end))