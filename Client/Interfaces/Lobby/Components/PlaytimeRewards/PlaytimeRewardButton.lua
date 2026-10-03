-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards.PlaytimeRewardButton
-- Decompile time: 6.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local u23 = {
    LowTierChest = "rbxassetid://125938892764417",
    MidTierChest = "rbxassetid://98559647268239",
    HighTierChest = "rbxassetid://111323161026530",
}
return React.memo(function(a1) -- Line: 29 -- upvalues: React (val), useSpring (val), useSound (val), u23 (val) -- types: a1: table
    local createElement_10, createElement_8, v1, v2, v3
    local u2 = a1.claimed or false
    local u6, u7 = React.useState(false)
    local v4, u14 = useSpring(1, 0.6, 40, true)
    local Click = useSound("Click")
    local u21, u22 = React.useState(0)
    local u25 = math.floor(u21 / 3600)
    local u29 = math.floor(u21 / 60) % 60
    local u30 = u21 % 60
    local v5 = if u2 then Color3.fromRGB(91, 91, 91) else if not (u21 > 0) then Color3.fromRGB(62, 244, 69) else Color3.fromRGB(91, 91, 91)
    local v6 = if u2 then "rbxassetid://110599038290825" else if not (u21 > 0) then "rbxassetid://128572678780377" else "rbxassetid://110599038290825"
    local useEffect = React.useEffect
    local v7 = {a1.playtime, a1.playtimeRequirement}
    useEffect(function() -- Line: 49 -- upvalues: u22 (val), a1 (val)
        u22((a1.playtimeRequirement or 0) - (a1.playtime or 0))
    end, v7)
    v7 = {u2, u21, u25, u29, u30}
    local v8 = React.useMemo(function() -- Line: 53 -- upvalues: u2 (val), u21 (val), u25 (val), u29 (val), u30 (val)
        if u2 then
            return "CLAIMED"
        end
        if u21 <= 0 then
            return "CLAIM"
        end
        if u25 == 0 then
            return string.format("%d:%02d", u29, u30)
        end
        return string.format("%d:%02d:%02d", u25, u29, u30)
    end, v7)
    local v9 = {u6}
    React.useEffect(function() -- Line: 68 -- upvalues: u6 (val), u14 (val)
        if u6 then
            u14(1.15)
            return
        end
        u14(1)
    end, v9)
    local createElement = React.createElement
    v9 = {
        BackgroundTransparency = 1,
        AnchorPoint = a1.AnchorPoint,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder,
    }
    local v10 = {}
    local createElement_2 = React.createElement
    local v11 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0),
        Size = UDim2.fromScale(0.986, 0.73),
        Position = UDim2.fromScale(0, 0),
    }
    local v12 = {
        ItemImage = React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            Image = u23[a1.crateName],
        }),
    }
    local createElement_4 = React.createElement
    local v13 = {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(0.98, 0.25),
        Size = UDim2.fromScale(0.23, 0.23),
        BackgroundTransparency = 1,
        Image = "rbxassetid://90617279757585",
        ZIndex = 5,
    }

    v13[React.Event.Activated] = function() -- Line: 105 -- upvalues: a1 (val)
        a1.onInfoClicked(a1.LayoutOrder)
    end

    v12.Info = createElement_4("ImageButton", v13, {UIAspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v12.QuantityLabel = React.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        TextStrokeTransparency = 0.5,
        ZIndex = 3,
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(0.98, 0.98),
        Size = UDim2.fromScale(0.2, 0.2),
        Text = ("x%*"):format(a1.quantity),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }, {
        UIStroke = React.createElement("UIStroke", {
            Thickness = 1.5,
            Color = Color3.fromRGB(0, 0, 0),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
        }),
        UIAspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
    })
    local createElement_7 = React.createElement
    v13 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://85205412837336",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.596, 1.614),
    }
    local v14 = if a1.claimed then Color3.fromRGB(120, 120, 120) else if not (u21 > 0) then Color3.fromRGB(179, 255, 116) else Color3.fromRGB(120, 120, 120)
    v13.ImageColor3 = v14
    v12.BG = createElement_7("ImageLabel", v13)
    if u2 then
        createElement_8 = React.createElement
        v13 = {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromScale(1.01, 1.01),
        }
        v14 = {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.075, 0)}),
        }
        createElement_10 = React.createElement
        v2 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        v3 = if not u2 then UDim2.fromScale(0.4, 0.4) else UDim2.fromScale(0.711, 0.711)
        v2.Size = v3
        v2.Image = if not u2 then "rbxassetid://1197061307" else "rbxassetid://119365628513374"
        v3 = if not u2 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(42, 255, 97)
        v2.ImageColor3 = v3
        v3 = u2 or u21 > 0
        v2.Visible = v3
        v14.ImageLabel = createElement_10("ImageLabel", v2, {UIAspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
        v1 = createElement_8("Frame", v13, v14)
    elseif not (u21 > 0) then
        v1 = nil
    else
        createElement_8 = React.createElement
        v13 = {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromScale(1.01, 1.01),
        }
        v14 = {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0.075, 0)}),
        }
        createElement_10 = React.createElement
        v2 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
        }
        v3 = if not u2 then UDim2.fromScale(0.4, 0.4) else UDim2.fromScale(0.711, 0.711)
        v2.Size = v3
        v2.Image = if not u2 then "rbxassetid://1197061307" else "rbxassetid://119365628513374"
        v3 = if not u2 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(42, 255, 97)
        v2.ImageColor3 = v3
        v3 = u2 or u21 > 0
        v2.Visible = v3
        v14.ImageLabel = createElement_10("ImageLabel", v2, {UIAspectRatio = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
        v1 = createElement_8("Frame", v13, v14)
    end
    v12.LockedOverlay = v1
    local createElement_11 = React.createElement
    v13 = {
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
        Text = "",
        BackgroundTransparency = 1,
    }

    v13[React.Event.MouseEnter] = function() -- Line: 189 -- upvalues: a1 (val)
        a1.onInfoClicked(a1.LayoutOrder)
    end

    v13[React.Event.MouseLeave] = function() -- Line: 193 -- upvalues: a1 (val)
        a1.onInfoClicked(a1.LayoutOrder)
    end

    v12.HoverInputSink = createElement_11("TextButton", v13)
    v10.Item = createElement_2("Frame", v11, v12)
    v10.UIAspectRatio = React.createElement("UIAspectRatioConstraint", {
        AspectRatio = 0.73,
        DominantAxis = Enum.DominantAxis.Width,
        AspectType = Enum.AspectType.FitWithinMaxSize,
    })
    local createElement_13 = React.createElement
    v11 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.9),
        Size = UDim2.fromScale(1, 0.195),
        BackgroundTransparency = 1,
        TextTransparency = 1,
    }

    v11[React.Event.Activated] = function() -- Line: 212 -- upvalues: u2 (val), u21 (val), u14 (val), Click (val), a1 (val)
        if not u2 and not (u21 > 0) then
            u14(0.85)
            Click()
            if a1.onClick then
                task.spawn(a1.onClick, a1.LayoutOrder)
            end
            task.delay(0.03, function() -- Line: 224 -- upvalues: u14 (upval)
                u14(1.1)
            end)
            return
        end
    end

    v11[React.Event.MouseEnter] = function() -- Line: 229 -- upvalues: u2 (val), u21 (val), u7 (val)
        if not u2 and not (u21 > 0) then
            u7(true)
            return
        end
    end

    v11[React.Event.MouseLeave] = function() -- Line: 237 -- upvalues: u7 (val)
        u7(false)
    end

    v12 = {
        BG = React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = v5,
            Image = v6,
        }),
    }
    local createElement_15 = React.createElement
    v13 = {
        TextScaled = true,
        BackgroundTransparency = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.7, 0.7),
        Text = v8,
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
    }
    v14 = if u2 then Color3.fromRGB(212, 212, 212) else if not (u21 > 0) then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(212, 212, 212)
    v13.TextColor3 = v14
    v13.TextStrokeTransparency = if u2 then 1 else if not (u21 > 0) then 0.5 else 1
    v14 = {}
    local v15 = u2 or u21 > 0
    v14.UIStroke = if v15 ~= false then nil else React.createElement("UIStroke", {
        Thickness = 1.5,
        Color = Color3.fromRGB(0, 0, 0),
        ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
    })
    v12.TextLabel = createElement_15("TextLabel", v13, v14)
    v12.uIScale = React.createElement("UIScale", {Scale = v4})
    v10.ClaimButton = createElement_13("TextButton", v11, v12)
    return createElement("Frame", v9, v10)
end)