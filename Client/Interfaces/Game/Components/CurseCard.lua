-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.CurseCard
-- Decompile time: 6.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PlayerVote = require(script.Parent.PlayerVote)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local memo = React.memo
local u37 = {}
u37[1] = {color = Color3.fromRGB(255, 42, 46)}
u37[2] = {color = Color3.fromRGB(153, 214, 68)}
u37[3] = {color = Color3.fromRGB(0, 255, 255)}
local useEffect = React.useEffect
return memo(function(a1) -- Line: 41
    -- upvalues: u37 (val), React (val), createElement (val), PlayerVote (val), ReactFlow (val), useSound (val)
    -- upvalues: useEffect (val), Maid (val), RunService (val)
    local v1, v2, v3
    local color = u37[a1.index].color
    local u10 = UDim2.fromScale(a1.index / 3 + -0.156194, 0.5)
    local v4, u15 = React.useBinding(0)
    local v5, u20 = React.useBinding(u10)
    local v6, u25 = React.useBinding(1)
    local v7 = {}
    for i, j in a1.votedFor do
        v7[j] = (createElement(PlayerVote, {userId = j}))
    end
    local v8, u41 = ReactFlow.useSpring({start = 1, target = 1, speed = 15, damper = 0.6})
    local v9, u46 = ReactFlow.useSpring({start = 1, target = 1, speed = 15, damper = 0.6})
    local v10, u51 = ReactFlow.useSpring({start = 1, target = 1, speed = 15, damper = 0.6})
    local v11, u56 = ReactFlow.useSpring({start = 0, target = 0, speed = 25, damper = 0.6})
    local v12, u61 = ReactFlow.useSpring({start = 0, target = 0, speed = 15, damper = 0.4})
    local v13, u66 = ReactFlow.useSpring({start = 1.5, target = 0, speed = 12, damper = 0.5})
    local CurseUIHover = useSound("CurseUIHover")
    local CurseUIClick = useSound("CurseUIClick")
    local u77 = a1.selected == a1.title
    local v14 = useEffect
    local v15 = {a1.enabled}
    v14(function() -- Line: 106 -- upvalues: Maid (upval), a1 (val), u66 (val), u61 (val)
        local u2 = Maid.new()
        if a1.enabled then
            u2:Mark((task.delay(a1.index / 20, function() -- Line: 118 -- upvalues: u66 (upval), u61 (upval)
                u66({target = 0})
                u61({target = 0})
            end)))
        else
            u66({target = 1.5})
            u61({target = -1})
        end
        return function() -- Line: 129 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v15)
    v15 = {u77}
    useEffect(function() -- Line: 134 -- upvalues: u77 (val), CurseUIHover (val)
        if u77 then
            CurseUIHover()
        end
    end, v15)
    v14 = useEffect
    v15 = {a1.clickedOn}
    v14(function() -- Line: 140 -- upvalues: a1 (val), CurseUIClick (val)
        if a1.clickedOn == a1.title then
            CurseUIClick()
        end
    end, v15)
    v14 = useEffect
    v15 = {a1.selected, u77, a1.clickedOn}
    v14(function() -- Line: 146 -- upvalues: u41 (val), u77 (val), a1 (val), u51 (val), u46 (val)
        u41({target = if not u77 then 1 else 0})
        if a1.selected ~= "" then
            u51({target = if not u77 then 0.8 else 1.1})
            u46({target = if u77 then 1 else 0.5})
            return
        end
        u51({target = 0.93})
        u46({target = 1})
        if a1.clickedOn ~= "" then
            u46({target = if a1.clickedOn ~= a1.title then 0.5 else 1})
        end
        if a1.clickedOn == a1.title then
            u51({target = 1.05})
            u41({target = 0})
        end
    end, v15)
    v14 = useEffect
    v15 = {a1.index, u77}
    v14(function() -- Line: 184 -- upvalues: RunService (upval), u77 (val), u25 (val), a1 (val), u10 (val), u15 (val), u20 (val)
        local u0 = 1
        local u6 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 187
            -- upvalues: u77 (upval), u0 (ref), u25 (upval), a1 (upval), u10 (upval), u15 (upval), u20 (upval)
            u0 = if not u77 then math.lerp(u0, 1, a1_2) else math.lerp(u0, 0.1, a1_2)
            u25(workspace.CurrentCamera.ViewportSize.Y / 50)
            local v1 = math.sin(tick() * 2 + a1.index) * 0.02
            local v2 = UDim2.fromScale(u10.X.Scale, v1 * u0 + 0.5)
            u15(math.cos(tick() * 2 + a1.index) * 2 * u0)
            u20(v2)
        end)
        return function() -- Line: 202 -- upvalues: u6 (ref)
            u6:Disconnect()
            u6 = nil
        end
    end, v15)
    v14 = {}
    for k, n in a1.modifiers do
        v1 = createElement
        v2 = {
            BackgroundTransparency = 1,
            RichText = true,
            TextWrapped = true,
            AutomaticSize = Enum.AutomaticSize.XY,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Text = n,
            TextColor3 = Color3.new(1, 1, 1),
            TextSize = v6,
            TextXAlignment = Enum.TextXAlignment.Left,
        }
        v3 = {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.71})}
        v14[k] = (v1("TextLabel", v2, v3))
    end
    local v16 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.312388, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = React.joinBindings({v5, v13}):map(function(a1) -- Line: 237
            return a1[1] + UDim2.fromScale(0, a1[2])
        end),
        Rotation = v4,
    }
    local v17 = {
        votes = createElement(React.Fragment, nil, v7),
        UIScale = createElement("UIScale", {
            Scale = React.joinBindings({v10, v11, v12}):map(function(a1) -- Line: 245
                return a1[1] + a1[2] + a1[3]
            end),
        }),
    }
    local v18 = createElement
    local v19 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), AutoButtonColor = false}

    v19[React.Event.MouseEnter] = function() -- Line: 254 -- upvalues: a1 (val)
        a1.onHover()
    end

    v19[React.Event.MouseLeave] = function() -- Line: 257 -- upvalues: u56 (val), a1 (val)
        u56({target = 0})
        a1.onUnhover()
    end

    v19[React.Event.MouseButton1Down] = function() -- Line: 263 -- upvalues: u56 (val)
        u56({target = -0.3})
    end

    v19[React.Event.MouseButton1Up] = function() -- Line: 268 -- upvalues: u56 (val)
        u56({target = 0})
    end

    v19[React.Event.Activated] = function() -- Line: 273 -- upvalues: a1 (val)
        a1.selectCurse(a1.title)
    end

    v19.Text = ""
    v17.button = v18("TextButton", v19)
    v17.backing = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://122955988788088",
        ZIndex = -2,
        Size = UDim2.fromScale(1, 1),
    }, {
        gradiant = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://105843825030665",
            ZIndex = -1,
            ImageColor3 = color,
            Position = UDim2.fromScale(0.0402299, 0.0205128),
            Size = UDim2.fromScale(0.922414, 0.929915),
        }),
        imageLabel = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://121295436435723",
            Position = UDim2.fromScale(0.0402299, 0.397686),
            Size = UDim2.fromScale(0.922414, 0.553846),
        }),
    })
    v17.cardName = createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(-0.212644, 0.034188),
        Size = UDim2.fromScale(1.42715, 0.0666667),
        Text = a1.title,
        TextColor3 = Color3.new(1, 1, 1),
    })
    v17.veryGlow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://122817672965182",
        ZIndex = -2,
        ImageColor3 = color,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.8, 1.5),
        ImageTransparency = if a1.clickedOn ~= a1.title then 1 else 0,
    })
    v17.glow = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://133001133840826",
        ZIndex = -1,
        ImageColor3 = color,
        Position = UDim2.fromScale(-0.0497233, -0.0324863),
        Size = UDim2.fromScale(1.0977, 1.06667),
        ImageTransparency = v8,
    })
    v17.curseIcon = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = a1.icon,
        Position = UDim2.fromScale(0.5, 0.372688),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(0.76, 0.491862),
    })
    v17.modifiers = createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.100575, 0.649573),
        Size = UDim2.fromScale(0.826238, 0.299107),
    }, {
        uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder}),
    }, v14)
    v17.fade = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://99416141286514",
        ImageTransparency = v9,
        Size = UDim2.fromScale(1, 1),
    })
    return createElement("Frame", v16, v17)
end)