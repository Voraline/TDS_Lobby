-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.LiveEventSurfaceDisplay
-- Decompile time: 1.85 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u12 = require("../Components/LiveEventDisplay")
local u15 = require("../../Hooks/useFFlag")
local u18 = require("../../Hooks/useTagged")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
local u30 = React.memo(function() -- Line: 15
    -- upvalues: u18 (val), u15 (val), useBinding (val), useEffect (val), RunService (val), createElement (val)
    -- upvalues: u12 (val), React (val)
    local LiveEventDisplay = u18("LiveEventDisplay")
    local u6 = u15("live_event.eventId", "4431083314408587881")
    local u10 = u15("live_event.title", "Live Event")
    local u14 = u15("live_event.imageId", 100669068520755)
    local u18_2 = u15("live_event.timestamp", 1759593600)
    local v1 = u15("live_event.displayEnabled", true)
    local u26 = u15("live_event.bottomTextVisible", true)
    local u31 = v1
    if u31 then
        u31 = false
        if u6 ~= "" then
            u31 = u18_2 > 0
        end
    end
    local u34, u35 = useBinding(0)
    local v2 = {u18_2}
    useEffect(function() -- Line: 28 -- upvalues: RunService (upval), u18_2 (val), u35 (val)
        local u5 = RunService.RenderStepped:Connect(function() -- Line: 29 -- upvalues: u18_2 (upval), u35 (upval)
            local ServerTimeNow = workspace:GetServerTimeNow()
            local v1 = u18_2 - ServerTimeNow
            u35((math.max(0, v1)))
        end)
        return function() -- Line: 35 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, v2)

    local function createDisplay(a1) -- Line: 40
        -- upvalues: u31 (val), createElement (upval), u12 (upval), u10 (val), u14 (val), u34 (val), u6 (val), u26 (val)
        if a1:FindFirstChild("Back") then
            a1.Back.Enabled = u31
        end
        return createElement("SurfaceGui", {
            ResetOnSpawn = false,
            PixelsPerStud = 20,
            Adornee = a1,
            Face = Enum.NormalId.Front,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            Enabled = u31,
        }, {
            Display = createElement(u12, {
                eventTitle = u10,
                eventImageId = u14,
                eventTimeLeft = u34,
                eventId = u6,
                bottomTextVisible = u26,
            }),
        })
    end

    local v3 = {}
    for i, j in LiveEventDisplay do
        table.insert(v3, (createDisplay(j)))
    end
    return createElement(React.Fragment, {}, v3)
end)
return function() -- Line: 72 -- upvalues: createElement (val), u30 (val)
    if workspace.Type.Value ~= "Lobby" then
        return nil
    end
    return createElement(u30)
end