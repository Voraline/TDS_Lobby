-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.CommandTargets
-- Decompile time: 1.32 ms

require(script.Parent.Types)
local u5 = {}

function u5.label(a1, a2) -- Line: 8 -- types: a1: string, a2: string?
    if a1 == "EventMatches" then
        return "All configured game servers"
    end
    if a1 == "EventLobbies" then
        return "All lobbies"
    end
    if a2 == "Lobby" then
        return "This lobby only"
    end
    if a2 == "Game" then
        return "This game server only"
    end
    return "This server only"
end

function u5.modesLabel(a1) -- Line: 20 -- types: a1: table?
    if not a1 then
        return "Loading gamemodes"
    end
    if #a1 == 0 then
        return "No gamemodes enabled"
    end
    return (table.concat(a1, ", "))
end

function u5.options(a1, a2) -- Line: 27 -- upvalues: u5 (val)
    local v1 = {}
    if not a1 then
        return v1
    end
    if table.find(a1.contexts, "Game") then
        table.insert(v1, {id = "EventMatches", label = u5.label("EventMatches")})
    end
    if table.find(a1.contexts, "Lobby") then
        table.insert(v1, {id = "EventLobbies", label = u5.label("EventLobbies")})
    end
    if a2.placeContext and table.find(a1.contexts, a2.placeContext) then
        table.insert(v1, {id = "ThisServer", label = u5.label("ThisServer", a2.placeContext)})
    end
    return v1
end

function u5.choose(a1, a2, a3) -- Line: 48 -- upvalues: u5 (val) -- types: a3: string?
    local v1 = u5.options(a1, a2)
    for i, j in v1 do
        if j.id == a1.defaultTarget then
            return j.id
        end
    end
    for k, n in v1 do
        if n.id == a3 then
            return n.id
        end
    end
    if a2.placeContext == "Lobby" and table.find(a1.contexts, "Game") then
        return "EventMatches"
    end
    for m, i5 in v1 do
        if i5.id == "ThisServer" then
            return i5.id
        end
    end
    if v1[1] then
        return v1[1].id
    end
    return "ThisServer"
end

function u5.unavailableReason(a1, a2) -- Line: 76 -- types: a1: string
    if a2.canRunCommands ~= true then
        return a2.commandUnavailableReason or "Waiting for command access from this server."
    end
    if a1 ~= "ThisServer" and a2.canBroadcast ~= true then
        return a2.broadcastUnavailableReason or "Cross-server commands are unavailable in this server."
    end
    if a1 == "EventMatches" then
        if not a2.broadcastModes then
            return "Loading the configured gamemodes."
        end
        if #a2.broadcastModes == 0 then
            return "No gamemodes are enabled. Set live-event-modes to the modes that should receive commands."
        end
    end
    return nil
end

return u5