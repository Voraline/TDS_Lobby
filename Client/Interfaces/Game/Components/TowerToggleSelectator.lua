-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerToggleSelectator
-- Decompile time: 6.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useMouse = require(ReplicatedStorage.Client.Interfaces.Hooks.useMouse)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
local memo = React.memo
local useSpring = ReactFlow.useSpring
local u31 = Random.new()
local u32 = {}
u32.disabled = {arrow = Color3.new(1, 1, 1), background = Color3.fromRGB(30, 30, 30)}
u32.enabled = {arrow = Color3.fromRGB(36, 215, 255), background = Color3.fromRGB(0, 59, 80)}
return (memo(function(a1) -- Line: 35
    -- upvalues: useBinding (val), useMouse (val), useSpring (val), u32 (val), useEffect (val), u31 (val)
    -- upvalues: RunService (val), createElement (val), React (val)
    local u43, u47
    local v1, u7 = useBinding(UDim2.fromScale(0.5, 0.5))
    local v2, u11 = useBinding(1)
    local v3, u15 = useBinding(1)
    local u17, u18 = useMouse()
    local v4, u22 = useSpring({damper = 0.53, speed = 23, start = 0, target = 0})
    local v5, u26 = useSpring({damper = 0.28, speed = 14, start = 0, target = 0})
    local v6 = v4:map(function(a1) -- Line: 57 -- upvalues: u32 (upval)
        return u32.disabled.arrow:Lerp(u32.enabled.arrow, a1)
    end)
    local v7 = v4:map(function(a1) -- Line: 61 -- upvalues: u32 (upval)
        return u32.disabled.background:Lerp(u32.enabled.background, a1)
    end)
    local v8 = useEffect
    local v9 = {a1.selected}
    v8(function() -- Line: 65 -- upvalues: u22 (val), a1 (val), u26 (val)
        u22({target = if not a1.selected then 0 else 1})
        u26({force = if not a1.selected then -120 else 120})
    end, v9)
    v8, u43 = useSpring({damper = 0.53, speed = 25, start = -85, target = 0})
    v9, u47 = useSpring({damper = 0.6, speed = 25, start = 0, target = 0})
    local v10 = useEffect
    local v11 = {a1.model, a1.enabled}
    v10(function() -- Line: 89
        -- upvalues: a1 (val), u43 (val), u31 (upval), RunService (upval), u17 (val), u18 (val), u15 (val), u7 (val)
        -- upvalues: u11 (val)
        local model = a1.model
        if model and model.Parent then
            if not a1.enabled then
                u43({target = -85})
                return
            end
            u43({target = 0})
            local u11_2 = nil
            local u12 = 0
            local u20 = 0 + u31:NextNumber(0, 100)
            local u21 = false
            u11_2 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 114
                -- upvalues: model (val), u11_2 (ref), u20 (ref), u12 (ref), u21 (ref), u43 (upval), a1 (upval)
                -- upvalues: u17 (upval), u18 (upval), u15 (upval), u7 (upval), u11 (upval)
                if model and model.Parent then
                    u20 = u20 + a1_2
                    u12 = u12 + a1_2
                    local CurrentCamera = workspace.CurrentCamera
                    local Position = model.PrimaryPart.Position
                    local Y = (model:GetExtentsSize()).Y
                    local v1, v2 = CurrentCamera:WorldToScreenPoint(Position + Vector3.new(0, 1, 0) * Y / 2)
                    if v2 then
                        if u21 then
                            u21 = false
                            u43({target = 0})
                        end
                    elseif not u21 then
                        u21 = true
                        u43({target = -85})
                    end
                    if not a1.enabled then
                        u43({target = 0})
                    end
                    local v3 = u17:getValue()
                    local v4 = u18:getValue()
                    local v5 = math.clamp((Vector2.new(v3 - v1.X, v4 - v1.Y)).Magnitude / 2000, 0.1, (1 / 0))
                    u15(1.3 - math.clamp(v5, 0, 0.5))
                    u7(UDim2.fromOffset(v1.X, v1.Y))
                    local v6 = math.clamp(1 / ((workspace.CurrentCamera.CFrame.Position - model.PrimaryPart.Position).Magnitude / 15), 0.1, 1)
                    u11(v6)
                    return
                end
                u11_2:Disconnect()
                u11_2 = nil
            end)
            return function() -- Line: 167 -- upvalues: u11_2 (ref)
                if u11_2 then
                    u11_2:Disconnect()
                    u11_2 = nil
                end
            end
        end
    end, v11)
    local enabled = a1.enabled
    if enabled then
        v10 = createElement
        v11 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v1,
            Size = UDim2.fromOffset(100, 100),
            Rotation = React.joinBindings({v8, v5}):map(function(a1) -- Line: 181
                return a1[1] + a1[2]
            end),
        }
        local v12 = {
            UIScale = createElement("UIScale", {
                Scale = React.joinBindings({v2, v3, v8, v9}):map(function(a1) -- Line: 191
                    return a1[1] * a1[2] + a1[3] / 85 + a1[4] / 50
                end),
            }),
            arrow = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://122709324750902",
                ZIndex = -10,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.035),
                Size = UDim2.fromOffset(100, 116),
                ImageColor3 = v6,
            }),
            iconCircle = createElement("CanvasGroup", {
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = v7,
                Position = UDim2.fromScale(0.5, -0.74),
                Size = UDim2.fromOffset(83, 83),
            }, {
                uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                uIStroke = createElement("UIStroke", {
                    Color = v6,
                    Thickness = v9:map(function(a1) -- Line: 218
                        return 2 + a1 / 2
                    end),
                }),
                towerIcon = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = a1.towerIcon,
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1.2, 1.2),
                }),
            }),
        }
        local v13 = createElement
        local v14 = {
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
            Position = UDim2.fromScale(0.0839563, -0.74),
            Size = UDim2.fromOffset(91, 83),
            Text = "",
            TextColor3 = Color3.new(),
            TextSize = 14,
            ZIndex = 999,
        }

        v14[React.Event.MouseButton1Down] = function() -- Line: 243 -- upvalues: u47 (val)
            u47({target = -2})
        end

        v14[React.Event.MouseButton1Up] = function() -- Line: 249 -- upvalues: u47 (val)
            u47({target = 4})
        end

        v14[React.Event.MouseEnter] = function() -- Line: 255 -- upvalues: u47 (val)
            u47({target = 4})
        end

        v14[React.Event.MouseLeave] = function() -- Line: 261 -- upvalues: u47 (val)
            u47({target = 0})
        end

        v14[React.Event.Activated] = function() -- Line: 267 -- upvalues: a1 (val)
            if a1.onSelected then
                a1.onSelected()
            end
        end

        v12.button = v13("TextButton", v14)
        enabled = v10("Frame", v11, v12)
    end
    return enabled
end))