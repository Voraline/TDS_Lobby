-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.CommandsPanel
-- Decompile time: 23.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionFields = require(script.Parent.ActionFields)
local CommandTargets = require(script.Parent.CommandTargets)
local Controls = require(script.Parent.Controls)
local LiveMessagePanel = require(script.Parent.LiveMessagePanel)
local React = require(ReplicatedStorage.Shared.UI.React)
local Theme = require(script.Parent.Theme)
require(script.Parent.Types)
local Validation = require(ReplicatedStorage.Shared.Modules.LiveEvents.Validation)
local createElement = React.createElement

local function resultText(a1, a2) -- Line: 26 -- types: a2: table
    local actionId = if not a1.actionId then "Command" else a2[a1.actionId] or a1.actionId
    local status = a1.status
    return (("%* · %*%*"):format(actionId, status, if not a1.message then "" else (" — %*"):format(a1.message)))
end

return function(a1) -- Line: 31
    -- upvalues: React (val), CommandTargets (val), Validation (val), createElement (val), Controls (val), Theme (val)
    -- upvalues: LiveMessagePanel (val), ActionFields (val)
    local Scroll, Scroll_2, Text_13, id, v1, v2, v3, v4, v5, v6, v7, v8, v9, warning
    local u3391, u3398 = React.useState(nil)
    local v10, u3412 = React.useState({})
    local ThisServer, ThisServer_2 = React.useState("ThisServer")
    local v11, v12 = React.useState("")
    local All, All_2 = React.useState("All")
    local v13, u3468 = React.useState(false)
    local v14, u3482 = React.useState(true)
    local u3489, u3496 = React.useState(false)
    local u3503, u3510 = React.useState(false)
    local status = a1.status
    local capabilities = a1.capabilities
    local effects = status.effects or {}
    local results = status.results or {}
    local v15 = false
    if status.runId ~= nil then
        v15 = false
        if status.phase ~= "Stopped" then
            v15 = false
            if status.phase ~= "Ended" then
                v15 = status.phase ~= "Idle"
            end
        end
    end
    local v16 = v15
    if not v16 then
        v16 = true
        if not (#effects > 0) then
            v16 = status.stopPending == true
        end
    end
    local v17 = false
    if status.commandMode == true then
        v17 = false
        if status.localOnly ~= true then
            v17 = v16
        end
    end
    local v18 = if capabilities.placeContext ~= "Game" then if capabilities.placeContext ~= "Lobby" then "Unknown place" else "Lobby" else "Match"
    local u3371 = nil
    local v19 = {}
    local v20 = {}
    local v21 = {}
    local v22 = nil
    local v23 = nil
    for i, j in a1.actions, v22, v23 do
        v19[j.id] = j.label
        if j.id == u3391 then
            u3371 = j
        end
        if not v21[j.category] then
            v21[j.category] = true
            table.insert(v20, j.category)
        end
    end
    table.sort(v20)
    local v24 = {{id = "All", label = "All commands"}}
    for k, n in v20 do
        table.insert(v24, {id = n, label = n})
    end
    v22 = CommandTargets.options(u3371, capabilities)
    v23 = false
    local v25 = nil
    for m, i5 in v22, nil, v25 do
        if i5.id == ThisServer then
            v23 = true
        end
    end
    local u2722 = nil
    local v26 = nil
    if u3371 then
        local v27
        v25, v27 = Validation.parameters(u3371.id, v10)
        u2722 = v25
        v26 = v27
    end
    v25 = CommandTargets.unavailableReason(ThisServer, capabilities)
    local u2755 = false
    if u3371 ~= nil then
        u2755 = false
        if v25 == nil then
            u2755 = not status.stopPending
            if u2755 then
                u2755 = v23
                if u2755 then
                    u2755 = false
                    if u2722 ~= nil then
                        u2755 = not a1.busy
                    end
                end
            end
        end
    end
    local v28 = CommandTargets.label(ThisServer, capabilities.placeContext)
    local v29 = if capabilities.placeContext ~= "Lobby" then "local activity" else "lobby activity"
    local v30 = CommandTargets.modesLabel(capabilities.broadcastModes)

    local function runCommand() -- Line: 94
        -- upvalues: u2755 (val), u3371 (ref), u2722 (ref), a1 (val), ThisServer (val), u3496 (val)
        if u2755 and u3371 and u2722 then
            a1.onRunCommand({
                actionId = u3371.id,
                version = u3371.version,
                target = ThisServer,
                parameters = table.clone(u2722),
            })
            if not u3371.repeatable then
                u3496(false)
            end
            return
        end
    end

    local v31 = {
        Environment = createElement(Controls.Text, {
            order = 1,
            text = ("Operating from: %* · %*"):format(v18, status.environment),
            color = Theme.muted,
        }),
    }
    local canBroadcast = capabilities.canBroadcast and createElement(Controls.Text, {order = 6, text = ("Broadcast gamemodes: %*"):format(v30), color = Theme.muted})
    v31.BroadcastModes = canBroadcast
    v31.StopScope = v17 and createElement(Controls.Text, {
        text = "Stop all stops effects here and sends a best-effort stop to every server.",
        order = 7,
        color = Theme.muted,
    })
    local stopPending = status.stopPending and createElement(Controls.Text, {
        text = "Stopped here; the stop was not sent to other servers. Select Retry Stop.",
        order = 3,
        color = Theme.warning,
    })
    v31.StopPending = stopPending
    v31.Unavailable = not capabilities.canRunCommands and createElement(Controls.Text, {
        order = 3,
        text = capabilities.commandUnavailableReason or "Commands are unavailable in this server.",
        color = Theme.warning,
    })
    local message = status.message and createElement(Controls.Text, {order = 4, text = status.message, color = Theme.accent})
    v31.Message = message
    local error = status.error and createElement(Controls.Text, {order = 5, text = status.error, color = Theme.warning})
    v31.Error = error
    local v32 = {
        EffectsHeading = createElement(Controls.Text, {
            strong = true,
            order = 100,
            text = if capabilities.placeContext ~= "Lobby" then "Effects on this server" else "Effects in this lobby",
        }),
    }
    local v33 = false
    if #effects == 0 then
        v33 = createElement(Controls.Text, {text = "No active effects on this server.", order = 101, color = Theme.muted})
    end
    v32.NoEffects = v33
    v32.ResultsHeading = createElement(Controls.Text, {
        strong = true,
        order = 200,
        text = if capabilities.placeContext ~= "Lobby" then "Results on this server" else "Results in this lobby",
    })
    v32.ResultsHint = createElement(Controls.Text, {
        order = 201,
        text = if capabilities.placeContext ~= "Lobby" then "These results describe this server only. Broadcast acceptance does not confirm execution on other servers." else "Game-server commands do not apply in this lobby. A local Skipped result is expected for those commands. Game-server results and effects are not reported here.",
        color = Theme.muted,
    })
    v33 = false
    if #results == 0 then
        v33 = createElement(Controls.Text, {text = "No commands have reported a result here yet.", order = 202, color = Theme.muted})
    end
    v32.NoResults = v33
    for i6, i7 in effects do
        v3 = ("Effect_%*"):format(i7.id)
        v32[v3] = (createElement(Controls.Text, {text = i7.label, color = Theme.accent, order = 101 + i6}))
    end
    for i8 = #results, (math.max(1, #results - 4)), -1 do
        v1 = results[i8]
        v2 = ("Result_%*"):format(i8)
        Text_13 = Controls.Text
        v5 = {
            text = ("%* · %*%*"):format(
                if not v1.actionId then "Command" else v19[v1.actionId] or v1.actionId,
                v1.status,
                if not v1.message then "" else (" — %*"):format(v1.message)
            ),
        }
        warning = if string.lower(v1.status) ~= "failed" then Theme.text else Theme.warning
        v5.color = warning
        v5.order = #results + 202 - i8
        v32[v2] = (createElement(Text_13, v5))
    end
    v33 = createElement(Controls.Button, {
        order = 90,
        text = ("%* %*"):format(if not u3503 then "Show" else "Hide", v29),
        onActivated = function() -- Line: 199 -- upvalues: u3510 (val), u3503 (val)
            u3510(not u3503)
        end,
    })
    local v34 = {
        LiveMessage = createElement(LiveMessagePanel, {
            busy = a1.busy,
            canSend = capabilities.canRunCommands == true,
            canBroadcast = capabilities.canBroadcast == true,
            onSend = a1.onSendLiveMessage,
        }),
    }
    v34.Title = createElement(Controls.Text, {text = "Choose a command", strong = true, size = 20, order = 10})
    v34.Search = createElement(Controls.Input, {label = "Search commands", order = 11, value = v11, onChanged = v12})
    v34.Category = createElement(Controls.Select, {
        label = "Category",
        order = 12,
        value = All,
        options = v24,
        onChanged = All_2,
    })
    local v35 = 0
    v2 = nil
    v3 = nil
    for i9, i10 in a1.actions, v2, v3 do
        if string.find(string.lower(i10.label .. " " .. i10.description), string.lower(v11), 1, true) then
            if All == "All" or All == i10.category then
                v35 = v35 + 1
                id = i10.id
                v34[id] = (createElement(Controls.Button, {
                    text = i10.label,
                    selected = u3391 == i10.id,
                    disabled = a1.busy,
                    order = i9 + 20,
                    onActivated = function() -- Line: 243
                        -- upvalues: i10 (val), u3398 (val), u3412 (val), ThisServer_2 (val), CommandTargets (upval)
                        -- upvalues: capabilities (val), u3391 (val), ThisServer (val), u3496 (val), u3482 (val)
                        local v1 = {}
                        for i, j in i10.fields do
                            v1[j.key] = j.default
                        end
                        u3398(i10.id)
                        u3412(v1)
                        local v2 = if not u3391 then nil else ThisServer
                        ThisServer_2(CommandTargets.choose(i10, capabilities, v2))
                        u3496(false)
                        u3482(false)
                    end,
                }))
            end
        end
    end
    if v35 == 0 then
        v34.Empty = createElement(Controls.Text, {
            text = "No commands found. Try another search or category.",
            order = 20,
            color = Theme.muted,
        })
    end
    if v13 and v14 then
        v34.Feedback = createElement(React.Fragment, {}, v31)
        v34.ActivityToggle = v33
        v1 = u3503 and createElement(React.Fragment, {}, v32)
        v34.Activity = v1
    end
    v1 = {}
    v1.ActivityToggle = v33
    v1.Feedback = createElement(React.Fragment, {}, v31)
    v2 = u3503 and createElement(React.Fragment, {}, v32)
    v1.Activity = v2
    v2 = v13 and createElement(Controls.Button, {
        text = "Back to commands",
        order = 0,
        onActivated = function() -- Line: 283 -- upvalues: u3482 (val), u3496 (val)
            u3482(true)
            u3496(false)
        end,
    })
    v1.Back = v2
    if not u3371 then
        v1.Empty = createElement(Controls.Text, {
            size = 20,
            order = 10,
            text = if capabilities.placeContext ~= "Lobby" then "Choose a command to see its target and settings, then select Run now." else "Run game commands from this lobby. Choose a command, review its settings and game-server target, then select Run now.",
        })
    else
        v1.Title = createElement(Controls.Text, {size = 24, strong = true, order = 10, text = u3371.label})
        v1.Description = createElement(Controls.Text, {order = 11, text = u3371.description, color = Theme.muted})
        local repeatable = u3371.repeatable and createElement(Controls.Text, {
            text = "Repeatable: run this command again as soon as the previous request finishes. Active spawn batches must finish first.",
            order = 15,
            color = Theme.accent,
        })
        v1.RepeatHint = repeatable
        v1.Target = createElement(Controls.Select, {
            label = "Run on",
            order = 12,
            value = if not v23 then if not (#v22 > 0) then "Unavailable here" else "Choose a target" else ThisServer,
            options = v22,
            disabled = a1.busy,
            onChanged = function(a1) -- Line: 315 -- upvalues: ThisServer_2 (val), u3496 (val)
                ThisServer_2(a1)
                u3496(false)
            end,
        })
        v2 = createElement
        local Text_18 = Controls.Text
        v4 = {
            order = 13,
            text = if not v23 then if not (#v22 > 0) then "This command has no supported destination." else "This target is unavailable for this command. Choose one of the available targets." else if v25 then v25 else if ThisServer == "EventMatches" then ("Runs in matching Game servers in this experience.%* Gamemodes: %*. PVP is excluded."):format(
                if capabilities.placeContext ~= "Lobby" then "" else " You stay in this lobby.",
                v30
            ) else if ThisServer ~= "EventLobbies" then ("Only players in this %* receive this command."):format(if capabilities.placeContext ~= "Lobby" then "server" else "lobby") else "LIVE broadcast to all lobbies with live events enabled in this experience.",
        }
        local muted = if not v23 then Theme.warning else if ThisServer == "ThisServer" then Theme.muted else Theme.warning
        v4.color = muted
        v1.TargetHint = v2(Text_18, v4)
        if u3371.destructive then
            v2 = createElement(Controls.Text, {
                order = 14,
                text = u3371.confirmation or "Permanent changes. Stop cannot restore removed towers or enemies.",
                color = Theme.warning,
            })
        else
            v2 = false
            if u3371.confirmation ~= nil then
                v2 = createElement(Controls.Text, {
                    order = 14,
                    text = u3371.confirmation or "Permanent changes. Stop cannot restore removed towers or enemies.",
                    color = Theme.warning,
                })
            end
        end
        v1.Consequence = v2
        v2 = false
        if #u3371.fields > 0 then
            v2 = createElement(Controls.Text, {text = "Settings", strong = true, order = 20})
        end
        v1.Settings = v2
        v2 = createElement
        v3 = ActionFields
        v4 = {
            orderOffset = 20,
            action = u3371,
            parameters = v10,
            disabled = a1.busy,
            onChange = function(a1) -- Line: 363 -- upvalues: u3412 (val), u3496 (val)
                u3412(a1)
                u3496(false)
            end,
        }
        v1.Fields = v2(v3, v4)
        v2 = v26 and createElement(Controls.Text, {order = 40, text = v26, color = Theme.warning})
        v1.ParameterError = v2
        if u3489 then
            v2 = {
                (("%*: %*"):format(if ThisServer == "ThisServer" then "Target" else "LIVE broadcast", v28)),
            }
            if ThisServer == "EventMatches" then
                table.insert(v2, (("Gamemodes: %*"):format(v30)))
            end
            v4 = nil
            v5 = nil
            for i11, i12 in u3371.fields, v4, v5 do
                v6 = if not u2722 then v10[i12.key] else u2722[i12.key]
                table.insert(
                    v2,
                    (("%*: %*"):format(i12.label, if type(v6) ~= "boolean" then tostring(v6) else if not v6 then "Off" else "On"))
                )
            end
            if u3371.confirmation then
                table.insert(v2, u3371.confirmation)
            elseif u3371.destructive then
                table.insert(v2, "Removed towers and enemies cannot be restored by Stop.")
            end
            if u3371.repeatable then
                table.insert(v2, "Each press runs this command again. Cancel to change its settings.")
            end
            v1 = {
                Feedback = createElement(React.Fragment, {}, v31),
                Title = createElement(Controls.Text, {
                    size = 24,
                    strong = true,
                    order = 10,
                    text = ("Run %* now?"):format(u3371.label),
                }),
                Review = createElement(Controls.Text, {order = 11, text = table.concat(v2, "\n"), color = Theme.warning}),
            }
        end
    end
    v2 = false
    if u3371 ~= nil then
        v2 = not v13 or not v14
    end
    v3 = if not u3489 then 114 else 132
    local v36 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}

    v36[React.Change.AbsoluteSize] = function(a1) -- Line: 431 -- upvalues: u3468 (val)
        u3468(a1.AbsoluteSize.X < 900)
    end

    v6 = {}
    if not v13 then
        Scroll = Controls.Scroll
        v8 = {}
        v9 = if not v13 then UDim2.new(0.36, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
        v8.size = v9
        v7 = createElement(Scroll, v8, v34)
    else
        v7 = v14
        if v7 then
            Scroll = Controls.Scroll
            v8 = {}
            v9 = if not v13 then UDim2.new(0.36, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
            v8.size = v9
            v7 = createElement(Scroll, v8, v34)
        end
    end
    v6.List = v7
    if not v13 then
        Scroll_2 = Controls.Scroll
        v8 = {key = ("%*:%*"):format(u3391 or "empty", u3489)}
        v9 = if not v13 then UDim2.new(0.36, 6, 0, 0) else UDim2.new()
        v8.position = v9
        v9 = if not v13 then UDim2.new(0.64, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
        v8.size = v9
        v7 = createElement(Scroll_2, v8, v1)
    else
        v7 = not v14
        if v7 then
            Scroll_2 = Controls.Scroll
            v8 = {key = ("%*:%*"):format(u3391 or "empty", u3489)}
            v9 = if not v13 then UDim2.new(0.36, 6, 0, 0) else UDim2.new()
            v8.position = v9
            v9 = if not v13 then UDim2.new(0.64, -6, 1, -v3 - 10) else UDim2.new(1, 0, 1, -v3 - 10)
            v8.size = v9
            v7 = createElement(Scroll_2, v8, v1)
        end
    end
    v6.Detail = v7
    v8 = {BorderSizePixel = 0}
    v8.BackgroundColor3 = Theme.surface
    v8.Position = UDim2.new(0, 0, 1, -v3)
    v8.Size = UDim2.new(1, 0, 0, v3)
    v9 = {}
    v9.Padding = createElement("UIPadding", {
        PaddingTop = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 14),
        PaddingRight = UDim.new(0, 14),
    })
    local v37 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, if not u3489 then 0 else -102, 0, if not u3489 then 46 else 64),
    }
    local v38 = {}
    local Text_24 = Controls.Text
    local v39 = {
        strong = true,
        text = if not v2 then "Choose a command to run now." else ("Run on: %*%*"):format(v28, if not v23 then " (unavailable)" else if v25 then " (unavailable)" else ""),
    }
    local warning_2 = if not v2 then Theme.text else if not v23 then Theme.warning else if ThisServer == "ThisServer" then Theme.text else Theme.warning
    v39.color = warning_2
    v38.Text = createElement(Text_24, v39)
    v9.Target = createElement("Frame", v37, v38)
    local v40 = u3489 and createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromOffset(92, 48),
    }, {
        Button = createElement(Controls.Button, {
            text = "Cancel",
            onActivated = function() -- Line: 484 -- upvalues: u3496 (val)
                u3496(false)
            end,
        }),
    })
    v9.Cancel = v40
    v40 = v2
    if v40 then
        v37 = {BackgroundTransparency = 1, Position = UDim2.fromOffset(0, v4)}
        v38 = if not v16 then UDim2.new(1, 0, 0, 48) else UDim2.new(0.5, -5, 0, 48)
        v37.Size = v38
        v40 = createElement("Frame", v37, {
            Button = createElement(Controls.Button, {
                text = if not a1.busy then if not u3489 then "Run now" else "Confirm run" else "Waiting...",
                primary = not u3489,
                danger = u3489,
                disabled = not u2755,
                onActivated = function() -- Line: 502
                    -- upvalues: u2755 (val), u3371 (ref), u3489 (val), ThisServer (val), u3496 (val), runCommand (val)
                    if u2755 and u3371 then
                        if u3489 then
                            runCommand()
                            return
                        end
                        if ThisServer == "ThisServer" and not u3371.destructive and u3371.confirmation == nil then
                            runCommand()
                            return
                        end
                        u3496(true)
                        return
                    end
                end,
            }),
        })
    end
    v9.Run = v40
    v40 = v16
    if v40 then
        v37 = {BackgroundTransparency = 1}
        v38 = if not v2 then UDim2.fromOffset(0, v4) else UDim2.new(0.5, 5, 0, v4)
        v37.Position = v38
        v38 = if not v2 then UDim2.new(1, 0, 0, 48) else UDim2.new(0.5, -5, 0, 48)
        v37.Size = v38
        v40 = createElement("Frame", v37, {
            Button = createElement(Controls.Button, {
                danger = true,
                text = if not status.stopPending then if not v17 then "Stop effects" else "Stop all" else "Retry Stop",
                onActivated = a1.onStop,
            }),
        })
    end
    v9.Stop = v40
    v6.Footer = createElement("Frame", v8, v9)
    return (createElement("Frame", v36, v6))
end