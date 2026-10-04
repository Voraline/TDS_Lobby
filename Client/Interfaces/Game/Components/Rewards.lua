-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Rewards
-- Decompile time: 48.27 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Hooks = Interfaces.Hooks
local Components_2 = Interfaces.Game.Components
local Components = Interfaces.Components
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Button = require(Components.Button)
local Player = require(Components.Player)
local Reward = require(Components_2.Reward)
local TowerPreview = require(Components.Previews.TowerPreview)
local useCheckAdAvailability = require(Hooks.useCheckAdAvailability)
local useNewNetworkCall = require(Hooks.useNewNetworkCall)
local usePlayerReplicatorValue = require(Hooks.usePlayerReplicatorValue)
local useSpring = require(Hooks.useSpring)
local createElement = React.createElement
local useRef = React.useRef
local useEffect = React.useEffect
local useMemo = React.useMemo
local u66 = {6893281917, 6893283194, 6893283959}
local u70 = {
    "Don't give up!",
    "Mission Failed, we'll get em' next time.",
    "The enemies got to the base!",
    "We'll get them next time!",
    "Oops! Try again!",
    "Strategy is key!",
    "We're overrun chief!",
    "We're toast!",
    "We need back up sergeant!",
    "Not enough numbers!",
    "Mistakes are just part of the journey..",
    "OOF!",
    "We have to fall back soldier!",
    "We just had our grave dug..",
}
local u85 = {10714388352, 10714016223, 10714372526}

local function getDurationString(a1) -- Line: 64 -- types: a1: number
    local v1 = math.floor(a1 / 86400)
    local v2 = math.floor(a1 / 3600)
    local v3 = math.floor(a1 / 60)
    local v4 = math.floor(a1 % 60)
    local v5 = ""
    if v1 > 0 then
        v5 = v5 .. v1 .. " days, "
        v2 = v2 - v1 * 24
    end
    if v2 > 0 then
        v5 = v5 .. v2 .. " hrs, "
        v3 = v3 - v2 * 60
    end
    if v3 > 0 then
        v5 = v5 .. v3 .. " mins and "
    end
    return v5 .. v4 .. " sec" .. (if not (v4 > 1) then "" else "s")
end

local function Triumph(a1) -- Line: 91 -- upvalues: Enum (val), createElement (val)
    local team = a1.team
    local isPVP = a1.isPVP
    local v1 = "TRIUMPH!"
    local v2 = Color3.fromRGB(255, 48, 48)
    if isPVP then
        v1 = (Enum.Team.ToString(team):upper()) .. " WINS!"
        if team == Enum.Team.Blue then
            v2 = Color3.fromRGB(0, 170, 255)
        elseif team == Enum.Team.Red then
            v2 = Color3.fromRGB(255, 0, 0)
        end
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(1, 32, 0, 64),
    }, {
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            ZIndex = 4,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = v1,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(0.6, 0, 0.7, 9),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 0)),
                    ColorSequenceKeypoint.new(0.549, Color3.fromRGB(255, 234, 1)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0))),
                }),
            }),
            uIStroke = createElement("UIStroke", {Thickness = 4, Transparency = 0.5}),
            left = createElement("ImageLabel", {
                Image = "rbxassetid://5547588029",
                BackgroundTransparency = 1,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0, 25, 0.5, 0),
                Size = UDim2.fromOffset(50, 50),
            }),
            right = createElement("ImageLabel", {
                Image = "rbxassetid://5547588029",
                BackgroundTransparency = 1,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(1, -25, 0.5, 0),
                Size = UDim2.fromOffset(50, 50),
            }),
        }),
        frame = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 2,
            BackgroundColor3 = v2,
            Size = UDim2.fromScale(1, 1),
        }),
        left1 = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = v2:Lerp(Color3.new(), 0.2),
            Position = UDim2.new(0, -16, 0.25, 0),
            Size = UDim2.new(0, 32, 1, 0),
        }, {
            endLabel = createElement("ImageLabel", {
                Image = "rbxassetid://12292340301",
                BackgroundTransparency = 1,
                ImageColor3 = v2:Lerp(Color3.new(), 0.2),
                BackgroundColor3 = Color3.fromRGB(198, 198, 198),
                Position = UDim2.fromOffset(-32, 0),
                Size = UDim2.fromOffset(32, 64),
            }),
        }),
        right1 = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = v2:Lerp(Color3.new(), 0.2),
            Position = UDim2.new(1, -16, 0.25, 0),
            Size = UDim2.new(0, 32, 1, 0),
        }, {
            end1 = createElement("ImageLabel", {
                Image = "rbxassetid://12292341131",
                BackgroundTransparency = 1,
                ImageColor3 = v2:Lerp(Color3.new(), 0.2),
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = Color3.fromRGB(198, 198, 198),
                Position = UDim2.new(1, 32, 0, 0),
                Size = UDim2.fromOffset(32, 64),
            }),
        }),
    })
end

local function Lose(a1) -- Line: 212 -- upvalues: createElement (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(1, 32, 0, 64),
    }, {
        textLabel = createElement("TextLabel", {
            Text = "YOU LOST",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            ZIndex = 4,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(0.6, 0, 0.7, 9),
        }, {
            uIStroke = createElement("UIStroke", {Thickness = 4, Transparency = 0.5}),
            uIGradient = createElement("UIGradient", {
                Rotation = -92,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(102, 0, 0)),
                    ColorSequenceKeypoint.new(0.486, Color3.fromRGB(255, 116, 24)),
                    ColorSequenceKeypoint.new(0.689, Color3.fromRGB(255, 55, 37)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 0, 0))),
                }),
            }),
            right = createElement("ImageLabel", {
                Image = "rbxassetid://5547582812",
                BackgroundTransparency = 1,
                ZIndex = 2,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(1, -25, 0.5, 0),
                Size = UDim2.fromOffset(40, 40),
            }),
            left = createElement("ImageLabel", {
                Image = "rbxassetid://5547582812",
                BackgroundTransparency = 1,
                ZIndex = 2,
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0, 25, 0.5, 0),
                Size = UDim2.fromOffset(40, 40),
            }),
        }),
        streak = createElement("ImageLabel", {
            Image = "rbxassetid://12292564345",
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0.5, 12),
            Size = UDim2.new(1.15, 0, 0, 120),
        }),
    })
end

local function Stats(a1) -- Line: 290 -- upvalues: createElement (val), getDurationString (val)
    return createElement("Frame", {
        BackgroundTransparency = 0.4,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 0, 88),
        Size = UDim2.new(1, -64, 0, 40),
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        gamemode = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 20,
            TextStrokeTransparency = 0.7,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.GameMode or "Survival",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(1, -8, 0.5, 0),
            Size = UDim2.new(0.333, -32, 1, -16),
        }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18})}),
        map = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 20,
            TextStrokeTransparency = 0.7,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.Map or "Polluted Wastelands",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 8, 0.5, 0),
            Size = UDim2.new(0.333, -32, 1, -16),
        }, {uITextSizeConstraint1 = createElement("UITextSizeConstraint", {MaxTextSize = 18})}),
        duration = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 20,
            TextStrokeTransparency = 0.65,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = getDurationString(a1.Duration or 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(0.333, -32, 1, -16),
        }, {uITextSizeConstraint2 = createElement("UITextSizeConstraint", {MaxTextSize = 18})}),
        uIStroke = createElement("UIStroke", {Color = Color3.fromRGB(62, 62, 62)}),
    })
end

local function Tower(a1) -- Line: 380
    -- upvalues: useSpring (val), useRef (val), u66 (val), u70 (val), useEffect (val), createElement (val)
    -- upvalues: TowerPreview (val)
    local u17, u24, u26, v1, v2
    local Name = a1.Name
    local Lose = a1.Lose
    local u4 = a1.Index or 1
    local u7 = a1.Visible ~= false
    if not Name then
        return
    end
    v1, _, _, u17 = useSpring(0, 1, 2.5, true)
    v2, u24, _, u26 = useSpring(0, 0.7, 15, true)
    local v3 = useRef()
    if Lose and not v3.current then
        v3.current = {
            icon = u66[math.random(1, #u66)],
            dialog = u70[math.random(1, #u70)],
        }
    end
    local v4 = {u7}
    useEffect(function() -- Line: 405 -- upvalues: u7 (val), u24 (val), u4 (val), u26 (val)
        if not u7 then
            u24(0)
            return
        end
        local u4_2 = true
        task.delay(0.1 * u4, function() -- Line: 412 -- upvalues: u4_2 (ref), u24 (upval), u26 (upval)
            if not u4_2 then
                return
            end
            u24(1)
            u26(20)
        end)
        return function() -- Line: 421 -- upvalues: u4_2 (ref)
            u4_2 = false
        end
    end, v4)
    v4 = {Lose}
    useEffect(function() -- Line: 426 -- upvalues: Lose (val), u17 (val)
        if not Lose then
            return
        end
        local u1 = true
        task.spawn(function() -- Line: 432 -- upvalues: u1 (ref), u17 (upval)
            while u1 do
                task.wait(1)
                if not u1 then
                    break
                end
                u17(10)
                task.wait(3)
            end
        end)
        return function() -- Line: 444 -- upvalues: u1 (ref)
            u1 = false
        end
    end, v4)
    v4 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromOffset(50, 50),
        LayoutOrder = a1.LayoutOrder,
        ZIndex = a1.ZIndex,
    }
    local v5 = {}
    local v6 = {BackgroundTransparency = 1}
    local fromScale = UDim2.fromScale
    local v7 = if not Lose then 0 else 0.4
    v6.Size = fromScale(1 + (if not Lose then 0 else 0.4), 1 + v7)
    local fromScale_2 = UDim2.fromScale
    v7 = if not Lose then 0 else 1
    v6.Position = fromScale_2(0.5 + (if not Lose then 0 else -2), 0.5 + v7)
    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    local v8 = {scale = createElement("UIScale", {Scale = v2})}
    local v9 = Lose and createElement("ImageLabel", {
        Image = "rbxassetid://6893248975",
        BackgroundTransparency = 1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = v1:map(function(a1) -- Line: 473
            return UDim2.fromOffset(150, -120 - a1 * 10)
        end),
        Size = UDim2.fromOffset(180, 80),
    }, {
        tail = createElement("ImageLabel", {
            Image = "rbxassetid://6893250260",
            BackgroundTransparency = 1,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 0, 1, -10),
            Size = UDim2.fromOffset(26, 17),
        }),
        textLabel = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 18,
            TextStrokeTransparency = 0.9,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = v3.current.dialog,
            TextColor3 = Color3.fromRGB(45, 45, 45),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, -10, 1, -10),
        }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 18})}),
    }) or nil
    v8.bubble = v9
    v9 = Lose and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        ZIndex = 0,
        Image = "rbxassetid://" .. (v3.current.icon or 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(320, 320),
    }) or createElement(TowerPreview, {
        pause = true,
        shadow = false,
        icon = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(320, 320),
        tower = Name,
        skin = a1.Skin or "Default",
    })
    v8.tower = v9
    v5.content = createElement("Frame", v6, v8)
    return createElement("Frame", v4, v5)
end

local function Player_2(a1) -- Line: 535
    -- upvalues: u85 (val), usePlayerReplicatorValue (val), Enum (val), useSpring (val), useEffect (val)
    -- upvalues: createElement (val), Player (val)
    local u34, u36, v1
    local player = a1.player
    local team = a1.team
    local u4 = a1.Index or 1
    local u7 = a1.Visible ~= false
    local v2 = u85[u4] or u85[#u85]
    local u27 = team ~= usePlayerReplicatorValue(player, "Team", Enum.Team.Player)
    v1, u34, _, u36 = useSpring(0, 0.7, 15, true)
    local v3 = {u7, u27}
    useEffect(function() -- Line: 548 -- upvalues: u7 (val), u27 (val), u34 (val), u4 (val), u36 (val)
        if u7 and not u27 then
            local u2 = true
            task.delay(0.1 * u4, function() -- Line: 555 -- upvalues: u2 (ref), u34 (upval), u36 (upval)
                if not u2 then
                    return
                end
                u34(1)
                u36(20)
            end)
            return function() -- Line: 564 -- upvalues: u2 (ref)
                u2 = false
            end
        end
        u34(0)
    end, v3)
    if not u27 and player then
        v3 = {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromOffset(50, 50),
            LayoutOrder = a1.LayoutOrder,
            ZIndex = a1.ZIndex,
        }
        local v4 = {}
        local v5 = {BackgroundTransparency = 1}
        local fromScale = UDim2.fromScale
        local v6 = if not u27 then 0 else 0.4
        v5.Size = fromScale(1 + (if not u27 then 0 else 0.4), 1 + v6)
        local fromScale_2 = UDim2.fromScale
        v6 = if not u27 then 0 else 1
        v5.Position = fromScale_2(0.5 + (if not u27 then 0 else -2), 0.5 + v6)
        v5.AnchorPoint = Vector2.new(0.5, 0.5)
        v4.content = createElement("Frame", v5, {
            scale = createElement("UIScale", {Scale = v1}),
            player = createElement("ViewportFrame", {
                BackgroundTransparency = 1,
                ZIndex = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(400, 400),
            }, {
                player = createElement(Player, {
                    useWorldModel = true,
                    userId = player.UserId,
                    animationId = v2,
                    origin = (CFrame.new(0, 0.5, -7)) * CFrame.Angles(0, 3.141592653589793, 0),
                }),
            }),
        })
        return createElement("Frame", v3, v4)
    end
end

local function Rewards(a1) -- Line: 610 -- upvalues: createElement (val), Reward (val), table (val), React (val)
    local v1
    local v2 = {}
    local Rewards = a1.Rewards or {}
    local v3 = 0
    for i, j in Rewards do
        v3 = v3 + 1
        v1 = createElement(Reward, table.merge({LayoutOrder = i, Index = i, Visible = a1.Visible}, j))
        v2[tostring(i)] = v1
    end
    return createElement("ScrollingFrame", {
        BackgroundTransparency = 0.4,
        ClipsDescendants = true,
        BorderSizePixel = 0,
        TopImage = "",
        BottomImage = "",
        ScrollBarThickness = 4,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 0, 152),
        Size = UDim2.new(1, -64, 0, 144),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.X,
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        uIStroke = createElement("UIStroke", {Color = Color3.fromRGB(62, 62, 62)}),
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = if not (v3 > 4) then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        uiPadding = if not (v3 > 4) then nil else createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 16),
            PaddingRight = UDim.new(0, 16),
        }),
        content = React.createElement(React.Fragment, {}, v2),
    })
end

return function(a1) -- Line: 670
    -- upvalues: Enum (val), useMemo (val), Players (val), useSpring (val), useEffect (val), TeleportService (val)
    -- upvalues: useCheckAdAvailability (val), useNewNetworkCall (val), React (val), createElement (val), Triumph (val)
    -- upvalues: Lose (val), Stats (val), Rewards (val), Button (val), table (val), Player_2 (val), Tower (val)
    local v1
    local u3 = a1.Visible ~= false
    local CurrentTeam = a1.CurrentTeam or Enum.Team.Player
    local WinningTeam = a1.WinningTeam
    if not WinningTeam then
        WinningTeam = Enum.Team.Player
    end
    local Towers = a1.Towers or {"Pyromancer", "Scout", "Commander", "Sniper", "Minigunner"}
    local Skins = a1.Skins or {}
    local Win = a1.Win
    local GameMode = a1.GameMode
    local v2 = GameMode == "PVP"
    local v3 = {Win}
    local v4 = useMemo(function() -- Line: 681 -- upvalues: Players (upval)
        return Players:GetPlayers()
    end, v3)
    if GameMode == "PVP" then
        Win = true
    end
    if not Win then
        Towers = {"Commander"}
    end
    local v5, u48 = useSpring(0, 1, 10, true)
    local v6 = {u3}
    useEffect(function() -- Line: 694 -- upvalues: u48 (val), u3 (val)
        u48(if not u3 then 0 else 1)
    end, v6)
    local v7 = {[3317679266] = 8737602449}
    local LocalPlayerTeleportData = TeleportService:GetLocalPlayerTeleportData() or {}
    local SourceGameId = LocalPlayerTeleportData.SourceGameId
    if SourceGameId then
        SourceGameId = v7[LocalPlayerTeleportData.SourceGameId]
    end
    local v8 = useCheckAdAvailability(Enum.AdFormat.RewardedVideo, u3)
    local RobloxAds = useNewNetworkCall("RobloxAds")
    local v9, u88 = React.useBinding(true)
    local v10 = createElement
    local v11 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0.5, 64),
        Size = UDim2.fromOffset(600, 324),
        Visible = u3,
    }
    local v12 = {
        banner = createElement(Win and Triumph or Lose, {team = WinningTeam, currentTeam = CurrentTeam, isPVP = v2}),
    }
    local v13 = createElement
    local v14 = {
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(24, 24, 24),
        Position = UDim2.fromScale(0.5, 0),
        Size = v5:map(function(a1) -- Line: 728
            return UDim2.fromScale(1, a1)
        end),
    }
    local v15 = {uICorner = createElement("UICorner")}
    v15.uIGradient = createElement("UIGradient", {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.2, 0),
            (NumberSequenceKeypoint.new(1, 0.2)),
        }),
    })
    v15.info = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {stats = createElement(Stats, a1), rewards = createElement(Rewards, a1)})
    v15.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.2,
        BackgroundTransparency = 1,
        ZIndex = 1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v5:map(function(a1) -- Line: 765
            return UDim2.new(1, 14 * a1, 1, 14 * a1)
        end),
    })
    local v16 = createElement
    local v17 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(0, 53),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 1, 20),
    }
    local v18 = {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 40),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v18.restart = createElement(Button, {
        LayoutOrder = 1,
        Text = ("Restart Wave %*?"):format(a1.Wave),
        Size = UDim2.fromOffset(250, 53),
        Color = Color3.fromRGB(255, 189, 83),
        Clicked = a1.PromptRevive,
        Visible = a1.ReviveAllowed,
    })
    v18.watchAd = Win and v8 and createElement(Button, {
        Text = "Watch an ad for 50 coins!",
        TextFontSize = 16,
        LayoutOrder = 3,
        Size = UDim2.fromOffset(250, 53),
        Color = Color3.fromRGB(180, 255, 83),
        Visible = v9,
        Clicked = function() -- Line: 801 -- upvalues: u88 (val), RobloxAds (val)
            u88(false)
            RobloxAds("RequestShowAd")
        end,
    })
    local v19 = createElement
    local v20 = Button
    local v21 = {
        Text = "Return to Lobby",
        LayoutOrder = 2,
        Size = UDim2.fromOffset(250, 53),
        Color = Color3.fromRGB(255, 47, 47),
        Clicked = a1.ReturnToLobby,
    }
    v18.lobby = v19(v20, v21)
    local Continue = a1.Continue
    if Continue then
        v19 = createElement
        v21 = {Text = "Continue...", LayoutOrder = 3, Size = UDim2.fromOffset(250, 53)}
        v1 = a1.ContinueDisabled and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(10, 220, 80)
        v21.Color = v1
        v21.Clicked = not a1.ContinueDisabled and a1.Continue
        Continue = v19(Button, v21)
    end
    v18.nextChallenge = Continue
    v19 = Win
    if v19 then
        v19 = SourceGameId
        if v19 then
            v19 = createElement
            v21 = {Text = "Back to Pls Donate", LayoutOrder = 3, Size = UDim2.fromOffset(250, 53)}
            v1 = a1.ContinueDisabled and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(10, 220, 80)
            v21.Color = v1

            function v21.Clicked() -- Line: 830
                -- upvalues: Players (upval), TeleportService (upval), SourceGameId (val)
                Players.LocalPlayer:SetAttribute("Teleporting", true)
                TeleportService:Teleport(SourceGameId, Players.LocalPlayer)
            end

            v19 = v19(Button, v21)
        end
    end
    v18.backToPlace = v19
    v15.buttons = v16("Frame", v17, v18)
    v12.content = v13("Frame", v14, v15)
    v12.players = if not v2 then nil else createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, -100),
        Size = UDim2.new(1, 0, 0, 100),
    }, {
        list = createElement("UIListLayout", {
            Padding = UDim.new(0, 80),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }, table.reduce(v4, function(a1, a2, a3) -- Line: 858 -- upvalues: createElement (upval), Player_2 (upval), WinningTeam (val)
        a1[a3] = (createElement(Player_2, {team = WinningTeam, player = a2, LayoutOrder = a3, ZIndex = a3}))
        return a1
    end, {}))
    v12.towers = if v2 then nil else createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, -100),
        Size = UDim2.new(1, 0, 0, 100),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 80),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        tower1 = createElement(Tower, {
            ZIndex = 1,
            Index = 3,
            LayoutOrder = 1,
            Visible = u3,
            Lose = not Win,
            Name = Towers[1],
            Skin = Skins[1],
        }),
        tower2 = createElement(Tower, {
            ZIndex = 2,
            Index = 2,
            LayoutOrder = 2,
            Visible = u3,
            Name = Towers[2],
            Skin = Skins[2],
        }),
        tower3 = createElement(Tower, {
            Index = 1,
            ZIndex = 3,
            LayoutOrder = 3,
            Visible = u3,
            Name = Towers[3],
            Skin = Skins[3],
        }),
        tower4 = createElement(Tower, {
            ZIndex = 2,
            Index = 2,
            LayoutOrder = 4,
            Visible = u3,
            Name = Towers[4],
            Skin = Skins[4],
        }),
        tower5 = createElement(Tower, {
            ZIndex = 1,
            Index = 3,
            LayoutOrder = 5,
            Visible = u3,
            Name = Towers[5],
            Skin = Skins[5],
        }),
    })
    return v10("Frame", v11, v12)
end