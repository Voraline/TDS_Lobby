-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.KingpinBountyCrosshair
-- Decompile time: 16.98 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local memo = React.memo
local useBinding = React.useBinding
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local useSpring = ReactFlow.useSpring

local function getThumbnailUserId(a1) -- Line: 54 -- types: a1: number
    if a1 < 0 then
        return 16983447
    end
    return a1
end

local u40 = memo(function(a1) -- Line: 58
    -- upvalues: useMemo (val), Players (val), useSpring (val), useEffect (val), createElement (val)
    local v1 = useMemo
    local v2 = {a1.UserId}
    v1 = v1(function() -- Line: 59 -- upvalues: Players (upval), a1 (val)
        local v1 = Players
        local UserId = a1.UserId
        return v1:GetUserThumbnailAsync(if not (UserId < 0) then UserId else 16983447, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
    end, v2)
    local v3, u9 = useSpring({start = 0, target = 0, speed = 18, damper = 0.55})
    useEffect(function() -- Line: 74 -- upvalues: u9 (val)
        u9({start = 0, target = 1, force = 4})
    end, {})
    return createElement("Frame", {
        BackgroundTransparency = 0.5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(70, 70, 70),
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.fromScale(1, 1),
    }, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1, DominantAxis = Enum.DominantAxis.Height}),
        scale = createElement("UIScale", {Scale = v3}),
        image = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = v1,
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Crop,
            Size = UDim2.fromScale(1, 1),
        }, {corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
        corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
        stroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.35, Color = Color3.fromRGB(185, 185, 185)}),
    })
end)

local function createPlayerThumbnailEntries(a1) -- Line: 123 -- types: a1: table?
    local v1 = {}
    if a1 then
        local v2
        local v3 = {}
        local v4 = nil
        local v5 = nil
        for i, j in a1, v4, v5 do
            v2 = (v3[j] or 0) + 1
            v3[j] = v2
            table.insert(v1, {
                Key = if v2 ~= 1 then ("Player_%*_%*"):format(j, v2) else ("Player_%*"):format(j),
                LayoutOrder = i,
                UserId = j,
            })
        end
    end
    return v1
end

local function createPlayerThumbnailLayout() -- Line: 147 -- upvalues: createElement (val)
    return {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
end

local function createPlayerThumbnail(a1) -- Line: 159 -- upvalues: createElement (val), u40 (val) -- types: a1: table
    return createElement(u40, {LayoutOrder = a1.LayoutOrder, UserId = a1.UserId})
end

return memo(function(a1) -- Line: 166
    -- upvalues: useSpring (val), useBinding (val), Comma (val), useMemo (val), createPlayerThumbnailEntries (val)
    -- upvalues: useState (val), createPlayerThumbnailLayout (val), useRef (val), useEffect (val), createElement (val)
    -- upvalues: u40 (val), RunService (val)
    local v1, u4 = useSpring({target = 0.78, start = 0.78, speed = 24, damper = 0.55})
    local v2, u8 = useBinding(0)
    local u11, u12 = useSpring({target = 35, start = 35, speed = 8, damper = 1})
    local v3, u16 = useSpring({target = 0, start = 0, speed = 18, damper = 0.35})
    local v4, u20 = useSpring({target = 0, start = 0, speed = 18, damper = 0.35})
    local u22 = a1.BountyReward or 0
    local v5, u26 = useSpring({start = 0, speed = 14, damper = 0.9, target = u22})
    local BountyReward = a1.BountyReward and v5:map(function(a1) -- Line: 205 -- upvalues: u22 (val), Comma (upval)
        local v1 = math.clamp(math.round(a1), 0, u22)
        return "$" .. Comma((tostring(v1)))
    end)
    local v6 = useMemo
    local v7 = {a1.Players}
    local u37 = v6(function() -- Line: 210 -- upvalues: createPlayerThumbnailEntries (upval), a1 (val)
        return (createPlayerThumbnailEntries(a1.Players))
    end, v7)
    local v8, u42 = useState((createPlayerThumbnailLayout()))
    local u45 = useRef(a1.ResetKey)
    local v9 = useEffect
    local v10 = {u37, a1.ResetKey}
    v9(function() -- Line: 217
        -- upvalues: u45 (val), a1 (val), u37 (val), u42 (val), createPlayerThumbnailLayout (upval)
        -- upvalues: createElement (upval), u40 (upval)
        local u5 = u45.current ~= a1.ResetKey
        u45.current = a1.ResetKey
        local u9 = {}
        for i, j in u37 do
            u9[j.Key] = true
        end
        local u20 = {}
        u42(function(a1) -- Line: 227 -- upvalues: createPlayerThumbnailLayout (upval), u5 (val), u9 (val), u20 (val)
            local v1 = createPlayerThumbnailLayout()
            if u5 then
                return v1
            end
            for i, j in a1 do
                if i ~= "uIListLayout" and u9[i] then
                    u20[i] = true
                    v1[i] = j
                end
            end
            return v1
        end)
        local u28 = task.spawn(function() -- Line: 244 -- upvalues: u37 (upval), u20 (val), u42 (upval), createElement (upval), u40 (upval)
            for i, j in u37 do
                if not u20[j.Key] then
                    u20[j.Key] = true
                    u42(function(a1) -- Line: 251 -- upvalues: j (val), createElement (upval), u40 (upval)
                        if a1[j.Key] then
                            return a1
                        end
                        local v1 = table.clone(a1)
                        local v2 = j
                        v1[j.Key] = (createElement(u40, {LayoutOrder = v2.LayoutOrder, UserId = v2.UserId}))
                        return v1
                    end)
                    task.wait(0.1)
                end
            end
        end)
        return function() -- Line: 264 -- upvalues: u28 (val)
            if coroutine.status(u28) ~= "dead" then
                task.cancel(u28)
            end
        end
    end, v10)
    local BountyReward_2 = a1.BountyReward and Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local v11 = useEffect
    local v12 = {a1.ResetKey}
    v11(function() -- Line: 277 -- upvalues: u4 (val), u12 (val), u20 (val), u16 (val), u8 (val), RunService (upval), u11 (val)
        u4({start = 1.35, target = 0.78})
        u12({start = 720, target = 35})
        u20({start = 0, target = 0, force = -4.5})
        u16({start = 60, target = 0})
        u8(0)
        local u15 = 0
        local u21 = RunService.RenderStepped:Connect(function(a1) -- Line: 302 -- upvalues: u15 (ref), u11 (upval), u8 (upval)
            u15 = (u15 + a1 * u11:getValue()) % 360
            u8(u15)
        end)
        return function() -- Line: 307 -- upvalues: u21 (val)
            u21:Disconnect()
        end
    end, v12)
    v11 = useEffect
    v12 = {a1.ResetKey, a1.BountyReward}
    v11(function() -- Line: 312 -- upvalues: u22 (val), u26 (val)
        u26({
            start = 0,
            target = u22,
            force = if not (u22 > 0) then 0 else math.max(u22 * 3, 80),
        })
    end, v12)
    v11 = createElement
    v12 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v12.Size = Size
    local v13 = {}
    local v14 = createElement
    local v15 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 0.7),
        Position = UDim2.fromScale(0.5, 0.7),
    }
    local v16 = {scale = createElement("UIScale", {Scale = v1})}
    local v17 = createElement
    local v18 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://94243200363217",
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local Color = a1.Color or Color3.new(1, 1, 1)
    v18.ImageColor3 = Color
    v18.Position = v4:map(function(a1) -- Line: 345
        return UDim2.fromScale(0.5, 0.5 - a1)
    end)
    v18.Rotation = v2
    v18.ScaleType = Enum.ScaleType.Fit
    v18.Size = UDim2.fromScale(1, 1)
    v16.target = v17("ImageLabel", v18)
    v17 = createElement
    v18 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://89927635116559",
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local Color_2 = a1.Color or Color3.new(1, 1, 1)
    v18.ImageColor3 = Color_2
    v18.Position = v4:map(function(a1) -- Line: 359
        return UDim2.fromScale(0.5, 0.5 + a1)
    end)
    v18.Rotation = v3
    v18.ScaleType = Enum.ScaleType.Fit
    v18.Size = UDim2.fromScale(0.45, 0.45)
    v16.dollar = v17("ImageLabel", v18)
    v13.iconContainer = v14("Frame", v15, v16)
    local BountyReward_3 = a1.BountyReward
    if BountyReward_3 then
        v14 = createElement
        v15 = {
            BackgroundTransparency = 1,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, 38),
            Position = v4:map(function(a1) -- Line: 373
                return UDim2.fromScale(0.5, 0.3 + a1)
            end),
        }
        v16 = {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 4),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            moneyIcon = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Image = ("rbxassetid://%*"):format(5547581690),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromOffset(32, 32),
            }),
        }
        v17 = createElement
        v18 = {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            TextScaled = false,
            TextSize = 24,
            TextTransparency = 1,
            ZIndex = 2,
            AutomaticSize = Enum.AutomaticSize.X,
            FontFace = BountyReward_2,
            Size = UDim2.fromOffset(0, 36),
            Text = BountyReward,
        }
        local v19 = {}
        local v20 = createElement
        local v21 = {
            BackgroundTransparency = 1,
            TextScaled = false,
            TextSize = 24,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = BountyReward_2,
            Position = UDim2.fromScale(0.5, 0.5),
            Rotation = v3:map(function(a1) -- Line: 412
                return -a1 / 2
            end),
            Size = UDim2.fromScale(1, 1),
            Text = BountyReward,
        }
        local Color_3 = a1.Color or Color3.fromRGB(69, 255, 97)
        v21.TextColor3 = Color_3
        local v22 = {}
        local v23 = createElement
        local v24 = {Thickness = 2}
        local StrokeColor = a1.StrokeColor or Color3.fromRGB(0, 96, 19)
        v24.Color = StrokeColor
        v24.LineJoinMode = Enum.LineJoinMode.Bevel
        v22.textStroke = v23("UIStroke", v24)
        v19.rewardText = v20("TextLabel", v21, v22)
        v16.textContainer = v17("TextLabel", v18, v19)
        BountyReward_3 = v14("Frame", v15, v16)
    end
    v13.rewardContainer = BountyReward_3
    v13.playersContainer = if not a1.Players or not (#a1.Players > 0) then nil else createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.fromScale(1, 0.15),
        Position = UDim2.fromScale(0.5, 0),
    }, v8)
    return v11("Frame", v12, v13)
end)