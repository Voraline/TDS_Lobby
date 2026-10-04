-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.PVPTimer
-- Decompile time: 9.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useChild = require(ReplicatedStorage.Client.Interfaces.Hooks.useChild)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useServerTick = require(ReplicatedStorage.Client.Interfaces.Hooks.useServerTick)
local createElement = React.createElement
local Part = Instance.new("Part")
Part:PivotTo((CFrame.new(0, 100000, 0)))
return function() -- Line: 16
    -- upvalues: useChild (val), Workspace (val), Part (val), useFFlag (val), useServerTick (val), React (val)
    -- upvalues: createElement (val), ReactRoblox (val)
    local v1 = useChild(useChild(Workspace, "PvP", Part), "Root", Part)
    local v2 = useFFlag("pvp.enabled", false, {isBinding = true})
    local v3 = React.joinBindings({
        useFFlag("pvp.starts_at", 1715984307, {isBinding = true}),
        useFFlag("pvp.ends_at", 1716220800, {isBinding = true}),
        (useServerTick():map(function(a1) -- Line: 29
            return a1 + 1000
        end)),
    })
    return ReactRoblox.createPortal({
        timer = createElement("BillboardGui", {
            ExtentsOffset = Vector3.new(0, 0, 1),
            MaxDistance = 60,
            StudsOffsetWorldSpace = Vector3.new(0, 10, 0),
            Enabled = React.joinBindings({
                v2,
                (v3:map(function(a1) -- Line: 39
                    local v1 = if not (a1[3] < a1[1]) then a1[2] - a1[3] else a1[1] - a1[3]
                    return v1 <= 0
                end)),
            }):map(function(a1) -- Line: 46
                return a1[1] and not a1[2]
            end),
            Size = UDim2.fromScale(4, 2),
        }, {
            status = createElement("Frame", {
                BackgroundTransparency = 1,
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(1.48, 1),
                AnchorPoint = Vector2.new(0.5, 0),
            }, {
                banner = createElement("Frame", {
                    BackgroundTransparency = 0.4,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(2.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                }, {
                    gradient = createElement("UIGradient", {
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.05, 0.5),
                            NumberSequenceKeypoint.new(0.2, 0.2),
                            NumberSequenceKeypoint.new(0.8, 0.2),
                            NumberSequenceKeypoint.new(0.95, 0.5),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
                timer = createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Font = Enum.Font.GothamBlack,
                    Size = UDim2.fromScale(2, 0.5),
                    Position = UDim2.fromScale(0.5, -0.45),
                    AnchorPoint = Vector2.new(0.5, 0),
                    TextColor3 = Color3.fromRGB(255, 170, 0),
                    Text = v3:map(function(a1) -- Line: 89
                        local v1, v2, v3
                        local v4 = math.floor((if not (a1[3] < a1[1]) then a1[2] - a1[3] else a1[1] - a1[3]) / 86400)
                        local v5 = math.floor(v2 / 3600)
                        local v6 = math.ceil(v2 / 60)
                        local v7 = if not (v4 > 0) then if not (v5 > 0) then "minute" else "hour" else "day"
                        return (("%* in %* %*%*!"):format(
                            if not v1 then "Ends" else "Starts",
                            v3,
                            v7,
                            if not (1 < (if v7 ~= "day" then if v7 ~= "hour" then v6 else v5 else v4)) then "" else "s"
                        ))
                    end),
                }, {
                    padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 30), PaddingRight = UDim.new(0, 30)}),
                    gradient = createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                            ColorSequenceKeypoint.new(0.6, Color3.new(1, 1, 1)),
                            ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
                        }),
                    }),
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.35,
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
                title = createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = "⚔️ PVP TESTING ⚔️",
                    Font = Enum.Font.GothamBlack,
                    Size = UDim2.fromScale(2, 0.8),
                    Position = UDim2.fromScale(0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                }, {
                    padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 30), PaddingRight = UDim.new(0, 30)}),
                    gradient = createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                            ColorSequenceKeypoint.new(0.6, Color3.new(1, 1, 1)),
                            ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                            (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
                        }),
                    }),
                    stroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.35,
                        LineJoinMode = Enum.LineJoinMode.Round,
                    }),
                }),
            }),
        }),
    }, v1, "PVPTimer")
end