-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.EventDirector.story
-- Decompile time: 6.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Definitions = require(ReplicatedStorage.Shared.Modules.LiveEvents.Definitions)
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
require(script.Parent.Types)
local createElement = React.createElement

local function DirectorStory(a1) -- Line: 11
    -- upvalues: React (val), createElement (val), Parent (val), Definitions (val)
    local host = a1.host
    local u5 = React.useRef(0)
    local u10, u11 = React.useState({phase = "Idle", environment = "UI Labs fixture", results = {}})
    local u20 = if host.controls.noBroadcastModes then {} else if not host.controls.normalPveModes then {"Event"} else {"Hardcore", "Survival"}
    local v1 = table.clone(u10)
    v1.broadcastModes = u20
    v1.localOnly = host.controls.studio
    v1.environment = if not host.controls.studio then "UI Labs published test fixture" else "UI Labs Studio fixture"
    if host.controls.failed then
        v1.error = "Fixture: the server rejected the request. No command was applied."
    end
    if host.controls.stopPending then
        v1.phase = "Stopped"
        v1.commandMode = true
        v1.stopPending = true
        v1.runId = "fixture_pending_stop"
        v1.effects = {}
    end
    local v2 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(7, 10, 16),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v3 = if not host.controls.smallScreen then UDim2.fromScale(1, 1) else UDim2.fromOffset(390, 700)
    v2.Size = v3
    return createElement("Frame", v2, {
        FixtureLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            Text = "UI LABS FIXTURE · no game actions",
            TextSize = 13,
            Size = UDim2.new(1, 0, 0, 24),
            TextColor3 = Color3.fromRGB(195, 208, 226),
        }),
        Panel = createElement("Frame", {
            BackgroundTransparency = 1,
            Position = UDim2.fromOffset(0, 24),
            Size = UDim2.new(1, 0, 1, -24),
        }, {
            Director = createElement(Parent, {
                actions = Definitions.Actions,
                status = v1,
                busy = host.controls.pending,
                capabilities = {
                    canRunCommands = not host.controls.unavailable or host.controls.studio,
                    canBroadcast = not host.controls.studio and not host.controls.unavailable,
                    broadcastModes = u20,
                    broadcastUnavailableReason = if not host.controls.studio then if not host.controls.unavailable then nil else "Fixture: live events are disabled in this experience's config." else "Fixture: Studio cannot send cross-server commands. Open the lobby in the Roblox app.",
                    placeContext = if not host.controls.lobby then "Game" else "Lobby",
                    commandUnavailableReason = if not host.controls.unavailable then nil else "Fixture: live events are disabled in deployment configuration.",
                },
                onRunCommand = function(a1) -- Line: 80 -- upvalues: host (val), u5 (val), u10 (val), Definitions (upval), u20 (val), u11 (val)
                    if host.controls.failed then
                        return
                    end
                    local v1 = u5
                    v1.current = v1.current + 1
                    v1 = ("fixture_command_%*"):format(u5.current)
                    local lobby = true
                    if a1.target ~= "ThisServer" then
                        if a1.target ~= "EventLobbies" then
                            lobby = false
                            if a1.target == "EventMatches" then
                                lobby = not host.controls.lobby
                            end
                        else
                            lobby = host.controls.lobby
                            if not lobby then
                                lobby = false
                                if a1.target == "EventMatches" then
                                    lobby = not host.controls.lobby
                                end
                            end
                        end
                    end
                    local v2 = table.clone(u10)
                    v2.commandMode = true
                    v2.phase = "Running"
                    v2.runId = "fixture_commands"
                    v2.name = "Live commands"
                    v2.currentCueId = v1
                    v2.message = if a1.target ~= "ThisServer" then ("Fixture: %* sent to %*. Remote execution is not confirmed."):format(
                        Definitions.ById[a1.actionId].label,
                        if a1.target ~= "EventMatches" then "all Event lobbies" else ("all configured game servers (%*)"):format((table.concat(u20, ", ")))
                    ) else "Fixture: accepted on this server."
                    v2.results = table.clone(u10.results or {})
                    table.insert(v2.results, {
                        id = v1,
                        cueId = v1,
                        actionId = a1.actionId,
                        status = if not lobby then "Skipped" else "Applied",
                        message = if not lobby then "This command targets the other place." else "UI Labs fixture only; no gameplay was changed.",
                    })
                    v2.effects = table.clone(u10.effects or {})
                    if lobby and type(a1.parameters.duration) == "number" then
                        table.insert(v2.effects, {id = v1, label = Definitions.ById[a1.actionId].label})
                    end
                    u11(v2)
                end,
                onAction = function(a1) -- Line: 120 -- upvalues: u10 (val), u11 (val)
                    local v1 = table.clone(u10)
                    if a1 == "send-live-message" then
                        v1.message = "Preview only: no live message was broadcast."
                        u11(v1)
                        return
                    end
                    if a1 == "stop" then
                        v1.phase = "Stopped"
                        v1.runId = nil
                        v1.currentCueId = nil
                        v1.effects = {}
                        u11(v1)
                    end
                end,
            }),
        }),
    })
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {
        failed = false,
        pending = false,
        smallScreen = false,
        studio = false,
        lobby = true,
        unavailable = false,
        stopPending = false,
        normalPveModes = false,
        noBroadcastModes = false,
    },
    story = function(a1) -- Line: 140 -- upvalues: createElement (val), DirectorStory (val)
        return createElement(DirectorStory, {key = ("%*"):format(a1.controls.lobby), host = a1})
    end,
}