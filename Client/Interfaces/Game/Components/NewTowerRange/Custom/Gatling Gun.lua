-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.Custom.Gatling Gun
-- Decompile time: 6.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local v1 = {}
local CurrentCamera = workspace.CurrentCamera
v1.HideDefaultRing = true

local function getRotatePart(a1) -- Line: 17 -- types: a1: userdata
    local Parent = a1.Parent
    if not Parent then
        return nil
    end
    local Rotate = Parent:FindFirstChild("Rotate")
    if Rotate and Rotate:IsA("BasePart") then
        return Rotate
    end
    return nil
end

function v1.Render(a1) -- Line: 31
    -- upvalues: React (val), useTagReplicatorInstance (val), useTween (val), useReplicatedState (val), RunService (val)
    -- upvalues: createElement (val), ReactRoblox (val), CurrentCamera (val)
    local u29
    local v1 = React.useRef(nil)
    local v2 = if not a1.IsValid then Color3.new(1, 0, 0) else Color3.new(1, 1, 1)
    local Parent = a1.Target.Parent
    if Parent then
        local Rotate = Parent:FindFirstChild("Rotate")
        u29 = if not Rotate then nil else if not Rotate:IsA("BasePart") then nil else Rotate
    else
        u29 = nil
    end
    local v3 = useTagReplicatorInstance(u29 and u29.Parent, "TowerReplicator", "Tower")
    local v4, v5 = useTween(0, TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), true, true, false)
    local Stats = a1.Stats and a1.Stats.Attributes and a1.Stats.Attributes.Angle
    local u68 = useReplicatedState(v3, "CurrentAngle")
    if not u68 or not (u68 > 0) then
        u68 = Stats or 360
    end
    v5(u68)
    local v6 = (React.joinBindings({a1.Range, v4})):map(function(a1) -- Line: 56 -- upvalues: u68 (ref)
        return (Vector3.new(a1[1] * 2, 0.001, a1[1] * 2)) * (a1[2] / u68)
    end)
    local RangeRef = a1.RangeRef
    local v7, u98 = React.useBinding(CFrame.new())
    local v8 = {u29}
    React.useEffect(function() -- Line: 64 -- upvalues: u29 (val), RunService (upval), u98 (val)
        if u29 and u29.Parent then
            local u8 = RunService.Stepped:Connect(function() -- Line: 69 -- upvalues: u29 (upval), u98 (upval)
                local v1
                if not u29.Parent then
                    return
                end
                _, v1 = u29.CFrame.Rotation:ToEulerAnglesYXZ()
                local v2 = CFrame.Angles(0, v1, 0)
                u98(v2)
            end)
            return function() -- Line: 80 -- upvalues: u8 (val)
                u8:Disconnect()
            end
        end
    end, v8)
    if u29 and u29.Parent then
        local v9
        _, v9 = u29.CFrame.Rotation:ToEulerAnglesYXZ()
        u98(CFrame.Angles(0, v9, 0))
        return (createElement("SurfaceGui", {
            AlwaysOnTop = true,
            Brightness = 2,
            ClipsDescendants = true,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
            Face = Enum.NormalId.Top,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            Adornee = v1,
        }, {
            portal = ReactRoblox.createPortal({
                part = createElement("Part", {
                    CanCollide = false,
                    CanQuery = false,
                    CanTouch = false,
                    Transparency = 1,
                    Size = v6,
                    ref = v1,
                }, {
                    mesh = createElement("SpecialMesh", {
                        MeshId = "rbxassetid://12597915770",
                        MeshType = Enum.MeshType.FileMesh,
                        Scale = v6,
                    }),
                    weld = createElement("Weld", {Part0 = RangeRef, Part1 = v1, C0 = v7, C1 = CFrame.new(0, 0, 0)}),
                }),
            }, CurrentCamera),
            container = createElement("Frame", {BackgroundTransparency = 1, Rotation = -90, Size = UDim2.fromScale(1, 1)}, {
                edge1 = createElement("Frame", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Rotation = v4:map(function(a1) -- Line: 135
                        return -a1 / 2
                    end),
                    Size = UDim2.fromScale(0.013, 1),
                }, {
                    imageLabel = createElement("Frame", {
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        BackgroundColor3 = v2,
                        Position = UDim2.fromScale(0.2, 0),
                        Size = UDim2.new(0, 7, 1, -3),
                    }, {
                        uIGradient = createElement("UIGradient", {
                            Rotation = -90,
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 0),
                                NumberSequenceKeypoint.new(0.5, 0),
                                NumberSequenceKeypoint.new(0.501, 1),
                                (NumberSequenceKeypoint.new(1, 1)),
                            }),
                        }),
                    }),
                }),
                edge2 = createElement("Frame", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Rotation = v4:map(function(a1) -- Line: 165
                        return a1 / 2
                    end),
                    Size = UDim2.fromScale(0.013, 1),
                }, {
                    imageLabel = createElement("Frame", {
                        BackgroundTransparency = 0,
                        BorderSizePixel = 0,
                        BackgroundColor3 = v2,
                        Position = UDim2.fromScale(0.2, 0),
                        Size = UDim2.new(0, 7, 1, 3),
                    }, {
                        uIGradient = createElement("UIGradient", {
                            Rotation = -90,
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 0),
                                NumberSequenceKeypoint.new(0.5, 0),
                                NumberSequenceKeypoint.new(0.501, 1),
                                (NumberSequenceKeypoint.new(1, 1)),
                            }),
                        }),
                    }),
                }),
                circle1 = createElement("CanvasGroup", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0.5, 0, 1, 0),
                    Position = UDim2.fromScale(0.5, 0),
                }, {
                    inner = createElement("Frame", {
                        BackgroundTransparency = 0.8,
                        BackgroundColor3 = v2,
                        Position = UDim2.fromScale(-1, 0),
                        Size = UDim2.new(2, -12, 1, -12),
                    }, {
                        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                        uIGradient4 = createElement("UIGradient", {
                            Rotation = v4:map(function(a1) -- Line: 207
                                return -a1 / 2 + 180
                            end),
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.5, 1),
                                NumberSequenceKeypoint.new(0.501, 0),
                                (NumberSequenceKeypoint.new(1, 0)),
                            }),
                        }),
                    }),
                    outer = createElement("Frame", {
                        BackgroundTransparency = 1,
                        BackgroundColor3 = Color3.fromRGB(255, 0, 102),
                        Position = UDim2.new(-1, 0, 0, 0),
                        Size = UDim2.new(2, -12, 1, -12),
                    }, {
                        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                        uIstroke = createElement("UIStroke", {Thickness = 7, Transparency = 0, Color = v2}, {
                            uIGradient5 = createElement("UIGradient", {
                                Rotation = v4:map(function(a1) -- Line: 235
                                    return -a1 / 2 + 180
                                end),
                                Transparency = NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 1),
                                    NumberSequenceKeypoint.new(0.5, 1),
                                    NumberSequenceKeypoint.new(0.501, 0),
                                    (NumberSequenceKeypoint.new(1, 0)),
                                }),
                            }),
                        }),
                    }),
                }),
                circle2 = createElement("CanvasGroup", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.5, 1),
                    Position = UDim2.new(0, 0, 0, 0),
                }, {
                    inner = createElement("Frame", {
                        BackgroundTransparency = 0.8,
                        BackgroundColor3 = v2,
                        Size = UDim2.fromScale(2, 1),
                        Position = UDim2.new(0, -5, 0, -5),
                    }, {
                        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                        uIGradient4 = createElement("UIGradient", {
                            Rotation = v4:map(function(a1) -- Line: 264
                                return a1 / 2
                            end),
                            Transparency = NumberSequence.new({
                                NumberSequenceKeypoint.new(0, 1),
                                NumberSequenceKeypoint.new(0.5, 1),
                                NumberSequenceKeypoint.new(0.501, 0),
                                (NumberSequenceKeypoint.new(1, 0)),
                            }),
                        }),
                    }),
                    outer = createElement("Frame", {
                        BackgroundTransparency = 1,
                        BackgroundColor3 = v2,
                        Size = UDim2.new(2, -12, 1, -12),
                    }, {
                        uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                        uIstroke = createElement("UIStroke", {Thickness = 7, Transparency = 0, Color = v2}, {
                            uIGradient5 = createElement("UIGradient", {
                                Rotation = v4:map(function(a1) -- Line: 291
                                    return a1 / 2
                                end),
                                Transparency = NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 1),
                                    NumberSequenceKeypoint.new(0.5, 1),
                                    NumberSequenceKeypoint.new(0.501, 0),
                                    (NumberSequenceKeypoint.new(1, 0)),
                                }),
                            }),
                        }),
                    }),
                }),
            }),
        }))
    end
    return nil
end

return v1