-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.Commands
-- Decompile time: 8.42 ms

local Definitions = require(script.Parent.Definitions)
local Validation = require(script.Parent.Validation)
local u10 = {MessageVersion = 2, MessageLimit = 900, SessionSeed = 1}
local u14 = {
    operation = true,
    requestId = true,
    actionId = true,
    version = true,
    target = true,
    parameters = true,
    runId = true,
    controlRevision = true,
}
local u15 = {
    v = true,
    k = true,
    r = true,
    a = true,
    n = true,
    t = true,
    p = true,
    i = true,
    d = true,
    o = true,
    c = true,
}
local u16 = {
    v = true,
    k = true,
    r = true,
    i = true,
    o = true,
    c = true,
}

local function buildCue(a1, a2, a3, a4, a5) -- Line: 66 -- types: a1: string, a2: string, a3: number, a4: string
    return {
        section = "",
        enabled = true,
        trigger = "Manual",
        at = 0,
        id = "command-" .. a1,
        actionId = a2,
        version = a3,
        target = a4,
        parameters = a5,
    }
end

function u10.normalize(a1, a2) -- Line: 86
    -- upvalues: u14 (val), Validation (val), Definitions (val)
    if type(a1) ~= "table" then
        return nil, "Invalid command request."
    end
    local v1 = a1
    local v2 = nil
    for i in v1, nil, v2 do
        if not u14[i] then
            return nil, "Command request contains an unsupported field."
        end
    end
    if a1.operation == "run-command"
        and type(a1.requestId) == "string"
        and #a1.requestId == 36
        and string.match(a1.requestId, "^[%w_%-]+$") then
        local id, requestId_2, target, v3, v4, v5, version
        if a2 ~= "Lobby" and a2 ~= "Game" then
            return nil, "This place cannot run event commands."
        end
        if a1.runId == nil then
            if a1.controlRevision ~= nil then
                if a1.controlRevision ~= 0 then
                    return nil, "The command session version is invalid."
                end
            end
            v3, v4 = a1, a2
            v1 = if type(v3.actionId) ~= "string" then nil else Definitions.ById[v3.actionId]
            if v1 and v3.version == v1.version then
                if v3.target == "ThisServer" then
                    if not table.find(v1.contexts, v4) then
                        return nil, "This command is unavailable in the selected place."
                    end
                    v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                    if not v2 then
                        return nil, v5
                    end
                    requestId_2 = v3.requestId
                    id = v1.id
                    version = v1.version
                    target = v3.target
                    return {
                        section = "",
                        enabled = true,
                        trigger = "Manual",
                        at = 0,
                        id = "command-" .. requestId_2,
                        actionId = id,
                        version = version,
                        target = target,
                        parameters = v2,
                    }, nil
                end
                if v3.target == "EventLobbies" then
                    if not table.find(v1.contexts, "Lobby") then
                        return nil, "This command is unavailable in the selected place."
                    end
                    v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                    if not v2 then
                        return nil, v5
                    end
                    requestId_2 = v3.requestId
                    id = v1.id
                    version = v1.version
                    target = v3.target
                    return {
                        section = "",
                        enabled = true,
                        trigger = "Manual",
                        at = 0,
                        id = "command-" .. requestId_2,
                        actionId = id,
                        version = version,
                        target = target,
                        parameters = v2,
                    }, nil
                end
                if v3.target ~= "EventMatches" then
                    return nil, "Choose a supported command target."
                end
                if not table.find(v1.contexts, "Game") then
                    return nil, "This command is unavailable in the selected place."
                end
                v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                if not v2 then
                    return nil, v5
                end
                requestId_2 = v3.requestId
                id = v1.id
                version = v1.version
                target = v3.target
                return {
                    section = "",
                    enabled = true,
                    trigger = "Manual",
                    at = 0,
                    id = "command-" .. requestId_2,
                    actionId = id,
                    version = version,
                    target = target,
                    parameters = v2,
                }, nil
            end
            return nil, "This command version is unavailable. Reload the command catalog."
        end
        if type(a1.runId) == "string" then
            v1 = #a1.runId
            if not (v1 > 64)
                and string.match(a1.runId, "^[%w_%-]+$")
                and Validation.finite(a1.controlRevision)
                and not (a1.controlRevision < 0)
                and a1.controlRevision % 1 == 0 then
                v3, v4 = a1, a2
                v1 = if type(v3.actionId) ~= "string" then nil else Definitions.ById[v3.actionId]
                if v1 and v3.version == v1.version then
                    if v3.target == "ThisServer" then
                        if not table.find(v1.contexts, v4) then
                            return nil, "This command is unavailable in the selected place."
                        end
                        v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                        if not v2 then
                            return nil, v5
                        end
                        requestId_2 = v3.requestId
                        id = v1.id
                        version = v1.version
                        target = v3.target
                        return {
                            section = "",
                            enabled = true,
                            trigger = "Manual",
                            at = 0,
                            id = "command-" .. requestId_2,
                            actionId = id,
                            version = version,
                            target = target,
                            parameters = v2,
                        }, nil
                    end
                    if v3.target == "EventLobbies" then
                        if not table.find(v1.contexts, "Lobby") then
                            return nil, "This command is unavailable in the selected place."
                        end
                        v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                        if not v2 then
                            return nil, v5
                        end
                        requestId_2 = v3.requestId
                        id = v1.id
                        version = v1.version
                        target = v3.target
                        return {
                            section = "",
                            enabled = true,
                            trigger = "Manual",
                            at = 0,
                            id = "command-" .. requestId_2,
                            actionId = id,
                            version = version,
                            target = target,
                            parameters = v2,
                        }, nil
                    end
                    if v3.target ~= "EventMatches" then
                        return nil, "Choose a supported command target."
                    end
                    if not table.find(v1.contexts, "Game") then
                        return nil, "This command is unavailable in the selected place."
                    end
                    v2, v5 = Validation.parameters(v3.actionId, v3.parameters)
                    if not v2 then
                        return nil, v5
                    end
                    requestId_2 = v3.requestId
                    id = v1.id
                    version = v1.version
                    target = v3.target
                    return {
                        section = "",
                        enabled = true,
                        trigger = "Manual",
                        at = 0,
                        id = "command-" .. requestId_2,
                        actionId = id,
                        version = version,
                        target = target,
                        parameters = v2,
                    }, nil
                end
                return nil, "This command version is unavailable. Reload the command catalog."
            end
        end
        return nil, "The command session version is invalid."
    end
    return nil, "Invalid command request."
end

function u10.eligible(a1, a2, a3, a4) -- Line: 148
    -- upvalues: Definitions (val), Validation (val)
    if type(a2) == "table" and type(a2.originServer) == "string" then
        if a2.originContext ~= "Game" and a2.originContext ~= "Lobby" then
            return false, "Command delivery metadata is unavailable."
        end
        local v1 = Definitions.ById[a1.actionId]
        if v1 and table.find(v1.contexts, a3.context) then
            if (if a1.target ~= "ThisServer" then if a1.target ~= "EventLobbies" then if a1.target ~= "EventMatches" then nil else "Game" else "Lobby" else a2.originContext) ~= a3.context then
                return false, "This command targets the other place."
            end
            if a1.target == "ThisServer" and a2.originServer ~= a3.serverId then
                return false, "This command targets the issuing server."
            end
            if Validation.finite(a4) and Validation.finite(a3.eligibleSince) and not (a4 < a3.eligibleSince) then
                return true, nil
            end
            return false, "This server or match joined after the command was issued."
        end
        return false, "This command belongs in the other place."
    end
    return false, "Command delivery metadata is unavailable."
end

local function oversizeProblem(a1) -- Line: 181 -- upvalues: u10 (val) -- types: a1: number
    return string.format("This command is too large to broadcast (%d bytes; limit %d). Shorten its text or enemy pools.", a1, u10.MessageLimit)
end

function u10.encode(a1, a2) -- Line: 193 -- upvalues: u10 (val), oversizeProblem (val) -- types: a2: function
    local cue = a1.cue
    if cue.target == "ThisServer" then
        return nil, "This command cannot be broadcast to This Server."
    end
    local v1 = string.match(a1.id, "/manual/([%w_%-]+)$")
    if v1 and #v1 == 36 then
        local delivery = a1.delivery
        local v2 = {
            k = "c",
            v = u10.MessageVersion,
            r = v1,
            a = cue.actionId,
            n = cue.version,
            t = cue.target,
            p = cue.parameters,
            i = a1.issuedAt,
            d = a1.deadline,
            o = delivery.originServer,
            c = delivery.originContext,
        }
        local v3 = #a2(v2)
        if v3 <= u10.MessageLimit then
            return v2, v3
        end
        return nil, oversizeProblem(v3)
    end
    return nil, "This command has no broadcastable request id."
end

function u10.encodeStop(a1, a2, a3, a4, a5) -- Line: 223
    -- upvalues: u10 (val), oversizeProblem (val)
    local v1 = {
        k = "s",
        v = u10.MessageVersion,
        r = a1,
        i = a2,
        o = a3,
        c = a4,
    }
    local v2 = #a5(v1)
    if v2 <= u10.MessageLimit then
        return v1, v2
    end
    return nil, oversizeProblem(v2)
end

function u10.decode(a1, a2) -- Line: 248
    -- upvalues: u10 (val), u15 (val), u16 (val), Validation (val), Definitions (val)
    if type(a1) ~= "table" then
        return nil, "Invalid command message."
    end
    if a1.v ~= u10.MessageVersion then
        return nil, "Unsupported command message version."
    end
    if a1.k ~= "c" and a1.k ~= "s" then
        return nil, "Unsupported command message kind."
    end
    local v1 = if a1.k ~= "c" then u16 else u15
    local v2 = a1
    local v3 = nil
    for i in v2, v3 do
        if not v1[i] then
            return nil, "Command message contains an unsupported field."
        end
    end
    if type(a1.r) == "string" and #a1.r == 36 and string.match(a1.r, "^[%w_%-]+$") then
        if not Validation.finite(a1.i) then
            return nil, "Invalid command message timing."
        end
        if type(a1.o) == "string" then
            v2 = #a1.o
            if not (v2 > 64) then
                if a1.c ~= "Lobby" and a1.c ~= "Game" then
                    return nil, "Invalid command message origin context."
                end
                v2 = {originServer = a1.o, originContext = a1.c}
                if a1.k == "s" then
                    return {kind = "stop", requestId = a1.r, issuedAt = a1.i, delivery = v2}, nil
                end
                v3 = if type(a1.a) ~= "string" then nil else Definitions.ById[a1.a]
                if v3 and a1.n == v3.version then
                    if a1.t ~= "EventLobbies" and a1.t ~= "EventMatches" then
                        return nil, "Choose a supported command target."
                    end
                    if not table.find(v3.contexts, if a1.t ~= "EventLobbies" then "Game" else "Lobby") then
                        return nil, "This command is unavailable in the selected place."
                    end
                    local v4, v5 = Validation.parameters(a1.a, a1.p)
                    if not v4 then
                        return nil, v5
                    end
                    if Validation.finite(a1.d) and not (a1.d < a1.i) then
                        local d = a1.d
                        if not (a1.i + Definitions.ManualDeliveryWindow < d) then
                            if a1.d < a2 then
                                return nil, "expired"
                            end
                            local r_2 = a1.r
                            local id = v3.id
                            local version = v3.version
                            local t = a1.t
                            return {
                                kind = "command",
                                requestId = a1.r,
                                cue = {
                                    section = "",
                                    enabled = true,
                                    trigger = "Manual",
                                    at = 0,
                                    id = "command-" .. r_2,
                                    actionId = id,
                                    version = version,
                                    target = t,
                                    parameters = v4,
                                },
                                issuedAt = a1.i,
                                deadline = a1.d,
                                delivery = v2,
                            }, nil
                        end
                    end
                    return nil, "Invalid command message deadline."
                end
                return nil, "This command version is unavailable. Reload the command catalog."
            end
        end
        return nil, "Invalid command message origin."
    end
    return nil, "Invalid command message identifier."
end

function u10.accept(a1, a2, a3, a4) -- Line: 322 -- upvalues: u10 (val) -- types: a2: number, a3: string, a4: boolean
    if not a4 then
        return nil, nil
    end
    local v1, v2 = u10.decode(a1, a2)
    if v1 then
        if v1.delivery.originServer == a3 then
            return nil, nil
        end
        return v1, nil
    end
    local v3 = nil
    if v2 == "expired" then
        return v3, nil
    end
    return v3, v2
end

function u10.resendable(a1, a2, a3) -- Line: 339 -- types: a2: string, a3: number
    if type(a1) == "table" and a1.status == "active" and not (a1.expiresAt <= a3) then
        for i, j in a1.actions do
            if j.id == a2 and a3 <= j.deadline then
                return j, nil
            end
        end
        return nil, "This command's delivery window has passed, so it was not sent again."
    end
    return nil, "This command session is no longer active, so the command was not sent again."
end

return u10