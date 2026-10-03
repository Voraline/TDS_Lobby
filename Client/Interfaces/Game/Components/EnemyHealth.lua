-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.EnemyHealth
-- Decompile time: 15.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useRef = React.useRef
local useEffect = React.useEffect
local Assets = ReplicatedStorage:WaitForChild("Assets")
local Enemies = Assets:WaitForChild("Enemies")
local NewEnemies = Assets:WaitForChild("NewEnemies")
local u48 = Random.new()

local function getFitDistance(a1, a2, a3) -- Line: 19 -- types: a1: userdata, a2: userdata, a3: userdata
    local Size = a1.PrimaryPart.Size
    local AbsoluteSize = a3.AbsoluteSize
    local v1 = math.min(1, AbsoluteSize.X / AbsoluteSize.Y)
    local v2 = math.atan((math.tan((math.rad(a2.FieldOfView / 2)))) * v1)
    return Size.Magnitude / 2 / math.sin(v2)
end

local function getBoundingBox(a1) -- Line: 29 -- types: a1: userdata
    local CFrame, Size, X, Y, Z, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
    local abs = math.abs
    local v17 = (1 / 0)
    local v18 = (1 / 0)
    local v19 = (1 / 0)
    local v20 = (-1 / 0)
    local v21 = (-1 / 0)
    local v22 = (-1 / 0)
    local v23 = {11414179948, 11414179991, 11414180029, 11414180002, 10241770171, 5748630830, 215680403, 4013414160}
    for k, v in pairs(a1:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency < 1 then
            if not v:IsA("MeshPart") then
                CFrame = v.CFrame
                Size = v.Size
                X = Size.X
                Y = Size.Y
                Z = Size.Z
                v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13 = CFrame:components()
                v14 = 0.5 * (abs(v5) * X + abs(v6) * Y + abs(v7) * Z)
                v15 = 0.5 * (abs(v8) * X + abs(v9) * Y + abs(v10) * Z)
                v16 = 0.5 * (abs(v11) * X + abs(v12) * Y + abs(v13) * Z)
                if v2 - v14 < v17 then
                    v17 = v2 - v14
                end
                if v3 - v15 < v18 then
                    v18 = v3 - v15
                end
                if v4 - v16 < v19 then
                    v19 = v4 - v16
                end
                if v20 < v2 + v14 then
                    v20 = v2 + v14
                end
                if v21 < v3 + v15 then
                    v21 = v3 + v15
                end
                if v22 < v4 + v16 then
                    v22 = v4 + v16
                end
            else
                v1 = v.MeshId:match("%d+$")
                if not v1 or not table.find(v23, (tonumber(v1))) then
                    CFrame = v.CFrame
                    Size = v.Size
                    X = Size.X
                    Y = Size.Y
                    Z = Size.Z
                    v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13 = CFrame:components()
                    v14 = 0.5 * (abs(v5) * X + abs(v6) * Y + abs(v7) * Z)
                    v15 = 0.5 * (abs(v8) * X + abs(v9) * Y + abs(v10) * Z)
                    v16 = 0.5 * (abs(v11) * X + abs(v12) * Y + abs(v13) * Z)
                    if v2 - v14 < v17 then
                        v17 = v2 - v14
                    end
                    if v3 - v15 < v18 then
                        v18 = v3 - v15
                    end
                    if v4 - v16 < v19 then
                        v19 = v4 - v16
                    end
                    if v20 < v2 + v14 then
                        v20 = v2 + v14
                    end
                    if v21 < v3 + v15 then
                        v21 = v3 + v15
                    end
                    if v22 < v4 + v16 then
                        v22 = v4 + v16
                    end
                end
            end
        end
    end
    local v24 = Region3.new(Vector3.new(v17, v18, v19), (Vector3.new(v20, v21, v22)))
    return v24.CFrame, v24.Size
end

local function createHitbox(a1) -- Line: 105 -- upvalues: getBoundingBox (val) -- types: a1: userdata
    local v1, v2 = getBoundingBox(a1)
    local Part = Instance.new("Part")
    Part.Name = "Hitbox"
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1
    Part.CFrame = v1
    Part.Size = v2
    Part.Parent = a1
    a1.PrimaryPart = Part
    a1.WorldPivot = v1
    return Part
end

local function EnemyPreview(a1) -- Line: 123
    -- upvalues: useRef (val), useEffect (val), GameState (val), NewEnemies (val), Enemies (val), getBoundingBox (val)
    -- upvalues: createElement (val), React (val)
    local u2 = a1.Name or "Wox"
    local DamageColor = a1.DamageColor or Color3.new(1, 1, 1)
    local v1 = a1.Visibility or 1
    local u14 = useRef(nil)
    local u17 = useRef(nil)
    local v2 = {u2}
    useEffect(function() -- Line: 131
        -- upvalues: GameState (upval), NewEnemies (upval), Enemies (upval), u2 (val), a1 (val), getBoundingBox (upval)
        -- upvalues: u14 (val), u17 (val)
        local u34
        local v1 = (GameState.NewGameModes and NewEnemies or Enemies):FindFirstChild(u2) or Enemies:FindFirstChild(u2)
        assert(v1, "Enemy model not found: " .. u2)
        if not v1:FindFirstChild("NewModel") then
            u34 = v1.Model:Clone()
        else
            u34 = v1.NewModel:Clone()
            if not u34 then
                u34 = v1.Model:Clone()
            end
        end
        local Weapon = u34:FindFirstChild("Weapon")
        if Weapon then
            Weapon:Destroy()
        end
        if a1.phase and a1.phase == 2 then
            local model2 = u34:FindFirstChild("model2")
            if model2 then
                for i, j in u34:GetDescendants() do
                    if j:IsA("BasePart") then
                        j.Transparency = 1
                    end
                end
                for k, n in model2:GetDescendants() do
                    if n:IsA("BasePart") then
                        n.Transparency = 0
                    end
                end
            end
        end
        local v2, v3 = getBoundingBox(u34)
        local v4 = Instance.new("Part")
        v4.Name = "Hitbox"
        v4.Anchored = true
        v4.CanCollide = false
        v4.Transparency = 1
        v4.CFrame = v2
        v4.Size = v3
        v4.Parent = u34
        u34.PrimaryPart = v4
        u34.WorldPivot = v2
        u34:PivotTo((CFrame.Angles(-0.08726646259971647, 0.3490658503988659, 0)))
        u34.Parent = u14.current
        local Size = v4.Size
        local current = u17.current
        local current_2 = u14.current
        local Size_2 = u34.PrimaryPart.Size
        local AbsoluteSize = current_2.AbsoluteSize
        local v5 = math.min(1, AbsoluteSize.X / AbsoluteSize.Y)
        local v6 = math.atan((math.tan((math.rad(current.FieldOfView / 2)))) * v5)
        v3 = Size_2.Magnitude / 2 / math.sin(v6)
        u17.current.CFrame = (CFrame.Angles(0, 3.141592653589793, 0)) * CFrame.new(0, Size.Y * 0.42, (v3 - Size.Z) * 0.3)
        return function() -- Line: 174 -- upvalues: u34 (val)
            u34:Destroy()
        end
    end, v2)
    return React.createElement(React.Fragment, {}, {
        preview = createElement("ViewportFrame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = v1:map(function(a1) -- Line: 185
                return 1 - a1
            end),
            Position = UDim2.new(0, 25, 1, 0),
            Size = UDim2.fromOffset(80, 80),
            CurrentCamera = u17,
            ref = u14,
        }, {
            camera = createElement("Camera", {FieldOfView = 10, CFrame = CFrame.new(), ref = u17}),
        }),
        gradient = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 0,
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = DamageColor,
            BackgroundTransparency = v1:map(function(a1) -- Line: 204
                return 1 - a1
            end),
            Position = UDim2.new(0, -15, 1, 0),
            Size = UDim2.new(0, 220, 1, -2),
        }, {
            uIGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            }),
        }),
    })
end

local function EnemyHealth(a1) -- Line: 226 -- upvalues: createElement (val), Comma (val)
    local v1 = a1.HealthPercent or 1
    local v2 = a1.ShieldPercent or 0
    local v3 = a1.Visibility or 1
    local v4 = math.round(a1.Shield or 0)
    local v5 = math.round(a1.MaxHealth or 100)
    local v6 = math.round(a1.Health or v5)
    local DamageColor = a1.DamageColor or Color3.new(1, 1, 1)
    return createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 2,
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v3:map(function(a1) -- Line: 240
            return 1 - a1
        end),
        Position = UDim2.fromScale(1, 1),
        Size = UDim2.new(1, -88, 0, 24),
    }, {
        healthBar = createElement("ImageLabel", {
            Image = "rbxassetid://300134974",
            BorderSizePixel = 0,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v3:map(function(a1) -- Line: 251
                return 1 - 0.2 * a1
            end),
            ScaleType = Enum.ScaleType.Tile,
            SliceCenter = Rect.new(0, 256, 0, 256),
            TileSize = UDim2.fromOffset(90, 90),
            BackgroundColor3 = Color3.fromRGB(170, 85, 255),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient = createElement("UIGradient", {
                Offset = v1:map(function(a1) -- Line: 262
                    return Vector2.new(math.clamp(a1, 0, 1) - 0.5, 0)
                end),
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
                Transparency = v3:map(function(a1) -- Line: 270
                    return NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - a1),
                        NumberSequenceKeypoint.new(0.5, 1 - a1),
                        NumberSequenceKeypoint.new(0.505, 1),
                        (NumberSequenceKeypoint.new(1, 1)),
                    })
                end),
            }),
        }),
        shieldBar = createElement("ImageLabel", {
            Image = "rbxassetid://300134974",
            BorderSizePixel = 0,
            ZIndex = 2,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v3:map(function(a1) -- Line: 284
                return 1 - 0.2 * a1
            end),
            ScaleType = Enum.ScaleType.Tile,
            SliceCenter = Rect.new(0, 256, 0, 256),
            TileSize = UDim2.fromOffset(90, 90),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Visible = v2:map(function(a1) -- Line: 291
                return a1 > 0
            end),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = 180,
                Offset = v2:map(function(a1) -- Line: 300
                    return Vector2.new(0.5 - math.clamp(a1, 0, 1), 0)
                end),
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0))),
                }),
                Transparency = v3:map(function(a1) -- Line: 308
                    return NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1 - a1),
                        NumberSequenceKeypoint.new(0.5, 1 - a1),
                        NumberSequenceKeypoint.new(0.505, 1),
                        (NumberSequenceKeypoint.new(1, 1)),
                    })
                end),
            }),
        }),
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            Color = DamageColor,
            Transparency = v3:map(function(a1) -- Line: 321
                return 1 - a1
            end),
        }),
        uIGradient1 = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(113, 113, 113)),
                ColorSequenceKeypoint.new(0.451, Color3.fromRGB(52, 52, 52)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(29, 29, 29))),
            }),
            Transparency = v3:map(function(a1) -- Line: 333
                return NumberSequence.new(1 - a1)
            end),
        }),
        shape = createElement("Frame", {
            Rotation = 45,
            ZIndex = 4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(71, 71, 71),
            BackgroundTransparency = v3:map(function(a1) -- Line: 342
                return 1 - a1
            end),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(32, 32),
        }, {
            uICorner = createElement("UICorner"),
            uIStroke1 = createElement("UIStroke", {
                Transparency = v3:map(function(a1) -- Line: 352
                    return 1 - a1
                end),
                Color = Color3.fromRGB(255, 255, 255),
            }),
        }),
        icon = createElement("ImageLabel", {
            Image = "rbxassetid://9666309147",
            BackgroundTransparency = 1,
            ZIndex = 5,
            ImageTransparency = v3:map(function(a1) -- Line: 361
                return 1 - a1
            end),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = DamageColor,
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(24, 24),
        }),
        shadow = createElement("ImageLabel", {
            Image = "rbxassetid://405124116",
            BackgroundTransparency = 1,
            ZIndex = -1,
            ImageColor3 = Color3.fromRGB(0, 0, 0),
            ImageTransparency = v3:map(function(a1) -- Line: 375
                return 1 - 0.4 * a1
            end),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(12, 12, 115, 115),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = DamageColor,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 28, 1, 28),
        }),
        name = createElement("TextLabel", {
            TextSize = 20,
            BackgroundTransparency = 1,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.Name or "",
            Visible = a1.Name ~= nil,
            TextTransparency = v3:map(function(a1) -- Line: 396
                return 1 - a1
            end),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, -38, 1, 0),
            Position = UDim2.fromOffset(30, 0),
        }, {
            uIStroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = v3:map(function(a1) -- Line: 410
                    return 1 - a1
                end),
            }),
        }),
        health = createElement("TextLabel", {
            TextSize = 20,
            BackgroundTransparency = 1,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextTransparency = v3:map(function(a1) -- Line: 422
                return 1 - a1
            end),
            Text = string.format("%s / %s HP", Comma(v6 + v4), Comma(v5)),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Right,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, -8, 1, 0),
        }, {
            uIStroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = v3:map(function(a1) -- Line: 436
                    return 1 - a1
                end),
            }),
        }),
    })
end

return function(a1) -- Line: 444
    -- upvalues: useSpring (val), useEffect (val), u48 (val), createElement (val), EnemyPreview (val), useScale (val)
    -- upvalues: React (val), EnemyHealth (val)
    local u63, u72, v1, v2
    local v3 = a1.Name or "Wox"
    local v4 = a1.DisplayName or v3
    local v5 = a1.Compact == true
    local v6 = a1.Shield or 0
    local v7 = a1.Health or 80
    local u17 = math.max(a1.MaxHealth or 100, v7)
    local u20 = if not (v6 > 0) then v7 / u17 else 1
    local u27 = math.clamp(v6 / u17, 0, 1)
    local u31 = a1.Visible ~= false
    local v8, u38 = useSpring(0, 1, 20, true)
    local u46, u47 = useSpring(u20, 1, 20, true)
    local v9, u55 = useSpring(u27, 1, 20, true)
    v1, _, u63 = useSpring(0, 1, 20, true)
    v2, _, _, u72 = useSpring(Vector2.zero, 0.2, 60, true)
    local u79 = 0.1 * (if not u31 then 0 else 1)
    local v10 = v1:map(function(a1) -- Line: 465
        return (Color3.fromRGB(255, 0, 0)):Lerp(Color3.fromRGB(255, 255, 255), 1 - a1 * 0.7)
    end)
    local v11 = {v7, v6}
    useEffect(function() -- Line: 469
        -- upvalues: u46 (val), u20 (val), u17 (val), u48 (upval), u72 (val), u63 (val), u47 (val), u55 (val), u27 (val)
        if 0.15 < (u46:getValue()) - u20 and u17 >= 100 then
            local Unit = u48:NextUnitVector().Unit
            u72(Vector2.new(if not (Unit.X < 0) then -1 else 1, if not (Unit.Y < 0) then -1 else 1) * 50)
            u63(1)
        end
        u47(u20)
        u55(u27)
    end, v11)
    v11 = {u31}
    useEffect(function() -- Line: 481 -- upvalues: u38 (val), u31 (val)
        u38(if not u31 then 0 else 1)
    end, v11)
    local v12 = nil
    if not v5 then
        v12 = createElement(EnemyPreview, {Name = v3, Visibility = v8, DamageColor = v10, phase = a1.phase})
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(768, 64),
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        LayoutOrder = a1.LayoutOrder,
        Visible = v8:map(function(a1) -- Line: 501
            return a1 > 0.01
        end),
    }, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = if not v5 then 12 else 24}),
        uiScale = createElement("UIScale", {Scale = (useScale(1.2)) * (a1.scale or 1)}),
        container = createElement("Frame", {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = (React.joinBindings({v8, v2})):map(function(a1) -- Line: 521 -- upvalues: u79 (val)
                local v1, v2 = unpack(a1)
                return UDim2.fromScale(0.5 + v2.X * u79, 1 - v1 * 0.5 + v2.Y * u79)
            end),
        }, {
            name = createElement("TextLabel", {
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                ZIndex = 2,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Text = v4,
                TextColor3 = v10,
                TextTransparency = v8:map(function(a1) -- Line: 537
                    return 1 - a1
                end),
                Visible = not v5,
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(1, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.new(1, 0, 0, 16),
                Size = UDim2.new(1, -72, 1, -40),
            }, {
                uIStroke = createElement("UIStroke", {
                    Thickness = 2,
                    Transparency = v8:map(function(a1) -- Line: 555
                        return 1 - 0.5 * a1
                    end),
                }),
            }),
            bars = createElement(EnemyHealth, {
                Name = if not v5 then nil else v4,
                Health = math.max(0, v7),
                Shield = v6,
                MaxHealth = u17,
                HealthPercent = u46,
                ShieldPercent = v9,
                Visibility = v8,
                DamageColor = v10,
            }),
            preview = v12,
        }),
    })
end