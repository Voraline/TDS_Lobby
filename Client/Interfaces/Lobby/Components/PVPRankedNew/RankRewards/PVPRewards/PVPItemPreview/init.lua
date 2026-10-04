-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.RankRewards.PVPRewards.PVPItemPreview
-- Decompile time: 27.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local CrateDisplayName = require(ReplicatedStorage.Client.Interfaces.CrateDisplayName)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useConfetti = require(Hooks.useConfetti)
local useSound = require(Hooks.useSound)
local ImageLabel = require(Components.ImageLabel)
local PVPItem = require(script.PVPItem)
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
local u61 = {}
u61.Default = UDim2.fromScale(0.25, 0.25)
u61.Completed = UDim2.fromScale(0.4, 0.4)
local u70 = {}
u70[1] = {
    Amount = 40,
    Lifetime = 1,
    Force = 20,
    Radius = 5,
    Direction = Vector2.new(-0.9, 0),
}
local u78 = memo(function(a1) -- Line: 54 -- upvalues: createElement (val), ImageLabel (val)
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
return (memo(function(a1) -- Line: 88
    -- upvalues: useSound (val), useRef (val), useConfetti (val), u70 (val), useState (val), useGroupAnimation (val)
    -- upvalues: useAnimation (val), Spring (val), useBinding (val), u61 (val), useSpring (val), useTween (val)
    -- upvalues: CrateDisplayName (val), useMemo (val), table (val), useEffect (val), createElement (val), Event (val)
    -- upvalues: u78 (val), ImageLabel (val), Tooltip (val), PVPItem (val), React (val)
    local v1
    local Obtain = useSound("Obtain")
    local u5 = useRef()
    local u8, u9 = useConfetti(u70)
    local u12, u13 = useState(false)
    local v2, u36 = useGroupAnimation({
        pressing = useAnimation({scale = Spring({target = 0.95, speed = 30, damper = 0.6})}),
        hovering = useAnimation({scale = Spring({target = 1.05, speed = 30, damper = 0.6})}),
        idle = useAnimation({scale = Spring({target = 1, speed = 30, damper = 0.6})}),
    }, {scale = 1})
    local clicked = a1.clicked
    local Transparency = a1.Transparency or useBinding(0)
    local v3 = a1.removeBG == true
    local v4 = a1.slice == true
    local item = a1.item
    local v5 = ""
    local color = a1.color
    if not color then
        color = Color3.fromRGB(42, 255, 97)
    end
    local lockedColor = a1.lockedColor or Color3.fromRGB(58, 58, 58)
    local iconVisible = if a1.iconVisible == nil then true else a1.iconVisible
    local v6 = a1.premium == true
    local u77 = a1.completed == true
    local v7 = a1.locked == true
    local v8 = a1.selected == true
    local u91 = useRef(u77)
    local v9 = nil
    local v10 = 1197061307
    local Default = u61.Default
    if not item then
        if v7 then
            color = lockedColor
        end
    elseif u77 then
        color = Color3.fromRGB(42, 255, 97)
        v9 = color
        v10 = 119365628513374
        Default = u61.Completed
    elseif v7 then
        color = lockedColor
    end
    if v7 then
        v10 = if not v6 then 1197061307 else 1197061307
        Default = u61.Default
        v9 = Color3.new(1, 1, 1)
    end
    if a1.reference then
        a1.reference.current = u5.current
    end
    local v11, u166 = useSpring({start = 0, target = 0, speed = 15, damper = 0.4})
    local v12, u186 = useTween({
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
            v5 = ("%* %*"):format(item.tower, v1)
        elseif item.type == "skin" then
            v5 = ("%* %* Skin"):format(item.skin, item.tower)
        elseif item.type == "crate" then
            local v13 = item.amount and 1 < item.amount and ("x%* "):format(item.amount) or ""
            v5 = v13 .. CrateDisplayName.withSuffix(item.name)
        elseif item.type == "stat" then
            v5 = ("%* %*"):format(item.amount, if item.stat ~= "Experience" then item.stat else "XP")
        elseif item.type == "flair" then
            v5 = ("[ %* ]"):format(item.name)
        elseif item.type ~= "badge" then
            v5 = ("%* %*"):format(item.name, v1)
        end
    end
    local v14 = {item, u12}
    v1 = useMemo(function() -- Line: 197 -- upvalues: item (val), table (upval), iconVisible (val), u12 (val)
        if not item then
            return nil
        end
        return table.merge({}, item, {
            ZIndex = 2,
            Visible = iconVisible,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.868, 0.868),
            playing = u12,
        })
    end, v14)
    local v15 = {v10}
    useEffect(function() -- Line: 212 -- upvalues: u166 (val)
        u166({force = 1.5})
    end, v15)
    v15 = {color}
    useEffect(function() -- Line: 216 -- upvalues: u186 (val), color (ref)
        u186({target = color})
    end, v15)
    v15 = {u77, item}
    useEffect(function() -- Line: 222 -- upvalues: u77 (val), u91 (val), item (val), u9 (val), Obtain (val)
        local v1 = false
        if u77 ~= u91.current then
            v1 = u77
        end
        u91.current = u77
        if v1 and item then
            u9()
            Obtain()
            return
        end
    end, v15)
    v15 = {u8, u5}
    useEffect(function() -- Line: 234 -- upvalues: u8 (val), u5 (val)
        if u8.current and u5.current then
            u8.current.Parent = u5.current
            return
        end
    end, v15)
    v15 = {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        LayoutOrder = a1.LayoutOrder or 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
    }
    local Size = a1.Size or UDim2.fromScale(1, 0.404)
    v15.Size = Size
    v15.SizeConstraint = a1.SizeConstraint
    v15.Position = a1.Position
    v15.AnchorPoint = a1.AnchorPoint
    v15.Text = ""
    v15.ref = u5
    v15.ZIndex = a1.ZIndex

    v15[Event.MouseButton1Down] = function() -- Line: 258 -- upvalues: u12 (val), clicked (val), u36 (val)
        if u12 and clicked then
            u36("pressing")
        end
    end

    v15[Event.MouseButton1Up] = function() -- Line: 264 -- upvalues: clicked (val), u12 (val), u36 (val)
        if clicked then
            if not u12 then
                u36("idle")
            else
                u36("hovering")
            end
        end
        if u12 and clicked then
            clicked()
        end
    end

    v15[Event.MouseEnter] = function() -- Line: 278 -- upvalues: clicked (val), u13 (val), u36 (val)
        if clicked then
            u13(true)
            u36("hovering")
        end
    end

    v15[Event.MouseLeave] = function() -- Line: 285 -- upvalues: clicked (val), u13 (val), u36 (val)
        if clicked then
            u13(false)
            u36("idle")
        end
    end

    local v16 = {
        aspectRatio = if not a1.AspectRatio then nil else createElement("UIAspectRatioConstraint", {AspectRatio = a1.AspectRatio}),
    }
    local v17 = {BackgroundTransparency = 1}
    local innerSize = a1.innerSize or UDim2.fromScale(1, 1)
    v17.Size = innerSize
    v17.Position = UDim2.fromScale(0.5, 0.5)
    v17.AnchorPoint = Vector2.new(0.5, 0.5)
    local v18 = {scale = createElement("UIScale", {Scale = v2.scale})}
    local v19 = {
        Visible = iconVisible and (v7 or u77),
        Transparency = Transparency,
        Position = v11:map(function(a1) -- Line: 311
            return UDim2.fromScale(0.5, 0.5 - a1)
        end),
        Size = v11:map(function(a1) -- Line: 314 -- upvalues: Default (ref)
            return UDim2.fromScale(Default.X.Scale, Default.Y.Scale + a1)
        end),
        icon = v10,
        color = v9 or Color3.new(1, 1, 1),
        premium = v6,
    }
    v18.locked = createElement(u78, v19)
    local v20 = not v3
    if v20 then
        v19 = {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            Image = "rbxassetid://85205412837336",
            disableSpinner = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        local bgSize = a1.bgSize or UDim2.fromScale(1.6, 1.61)
        v19.Size = bgSize
        v19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        v19.BorderColor3 = Color3.fromRGB(0, 0, 0)
        v19.ImageColor3 = v12
        v19.ImageTransparency = Transparency
        v19.ScaleType = v4 and Enum.ScaleType.Slice or nil
        v19.SliceCenter = v4 and Rect.new(249, 245, 249, 245) or nil
        v20 = createElement(ImageLabel, v19)
    end
    v18.bG = v20
    v20 = v1 and createElement(Tooltip, {
        Header = "Reward",
        Name = ("%*BattlepassTooltip"):format(v1.tower or v1.stat or v1.name),
        Subject = v5,
    })
    v18.tooltip = v20
    if not v1 then
        v20 = nil
    else
        local merge = table.merge
        v20 = createElement(PVPItem, merge({}, v1, {
            Transparency = if not v7 then Transparency else if v8 then Transparency else Transparency:map(function(a1) -- Line: 355
                return 1 - 0.4 * (1 - a1)
            end),
        })) or nil
    end
    v18.item = v20
    v18.children = createElement(React.Fragment, {}, a1.children)
    v16.content = createElement("Frame", v17, v18)
    return (createElement("TextButton", v15, v16))
end))