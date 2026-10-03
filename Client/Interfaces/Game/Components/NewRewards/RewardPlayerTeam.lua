-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardPlayerTeam
-- Decompile time: 2.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Player = require(ReplicatedStorage.Client.Interfaces.Components.Player)
local React = require(ReplicatedStorage.Shared.UI.React)
local usePlayerReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicatorValue)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local u35 = {10714388352, 10714016223, 10714372526}
return React.memo(function(a1) -- Line: 28
    -- upvalues: u35 (val), usePlayerReplicatorValue (val), Enum (val), useSpring (val), React (val)
    -- upvalues: createElement (val), Player (val)
    local u34, u36, v1
    local player = a1.player
    local team = a1.team
    local u4 = a1.Index or 1
    local u7 = a1.Visible ~= false
    local v2 = u35[u4] or u35[#u35]
    local u27 = team ~= usePlayerReplicatorValue(player, "Team", Enum.Team.Player)
    v1, u34, _, u36 = useSpring(0, 0.7, 15, true)
    local v3 = {u7, u27}
    React.useEffect(function() -- Line: 41 -- upvalues: u7 (val), u27 (val), u34 (val), u4 (val), u36 (val)
        if u7 and not u27 then
            local u2 = true
            task.delay(0.1 * u4, function() -- Line: 48 -- upvalues: u2 (ref), u34 (upval), u36 (upval)
                if not u2 then
                    return
                end
                u34(1)
                u36(20)
            end)
            return function() -- Line: 57 -- upvalues: u2 (ref)
                u2 = false
            end
        end
        u34(0)
    end, v3)
    if not u27 and player then
        v3 = {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromOffset(300, 300),
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
end)