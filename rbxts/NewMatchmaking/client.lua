-- Script path: ReplicatedStorage.rbxts.NewMatchmaking.client
-- Decompile time: 4.70 ms

local u2 = _G[script]
local Signal = u2.import(script, u2.getModule(script, "@rbxts", "beacon").out).Signal
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local function u23(a1) -- Line: 8
    local status = a1.status
    local options = a1.options
    if status == "pending" then
        return {type = "create", ticket = options}
    end
    if status ~= "matching" and status ~= "confirming" then
        if status == "canceling" then
            return {type = "cancel", ticketId = options.id}
        end
        return
    end
    return {type = "confirm", ticketId = options.id}
end

local v1 = {
    __tostring = function() -- Line: 31
        return "Client"
    end,
}
local u30 = setmetatable({}, v1)
u30.__index = u30

function u30.new(...) -- Line: 36 -- upvalues: u30 (ref)
    local v1 = u30
    local v2 = setmetatable({}, v1)
    return v2:constructor(...) or v2
end

function u30:constructor(a2) -- Line: 40 -- upvalues: Signal (val)
    self.url = a2
    self.tickets = {}
    self.onCreate = Signal.new()
    self.onMatch = Signal.new()
    self.onCancel = Signal.new()
    self.onError = Signal.new()
    self.onCreateError = Signal.new()
    self.onStatusChange = Signal.new()
    self.onTicketMissing = Signal.new()
    self:startTickLoop()
end

function u30:generateActions() -- Line: 52 -- upvalues: u23 (val)
    local v1
    local v2 = {}
    for i, j in self.tickets do
        v1 = u23(j)
        if v1 then
            table.insert(v2, v1)
        end
    end
    return v2
end

u30.update = u2.async(function(a1, a2) -- Line: 62 -- upvalues: HttpService (val)
    local v1 = HttpService:RequestAsync({
        Method = "POST",
        Url = ("%*/api/update"):format(a1.url),
        Body = HttpService:JSONEncode(a2),
        Headers = {["Content-Type"] = "application/json"},
    })
    assert(v1.Success, (("%* %*"):format(v1.StatusCode, v1.StatusMessage)))
    return HttpService:JSONDecode(v1.Body)
end)

function u30:changeStatus(a2, a3) -- Line: 76
    if a2.status == a3 then
        return nil
    end
    a2.status = a3
    self.onStatusChange:Fire(a2)
end

u30.tick = u2.async(function(a1) -- Line: 83 -- upvalues: u2 (val)
    local result, result_2, v1, v2
    local v3 = a1:generateActions()
    if #v3 == 0 then
        return nil
    end
    local v4 = u2.await(a1:update(v3))
    for i, j in v4 do
        if not j.success and j.type == "create" then
            v1 = a1.tickets[j.action.ticket.id]
            if v1 then
                a1.tickets[v1.options.id] = nil
                a1.onCreateError:Fire(v1, j.code)
            end
        end
    end
    local v5 = nil
    local v6 = nil
    local v7 = a1
    for k, n in v4, v5, v6 do
        if n.success then
            if n.type == "create" then
                v1 = v7.tickets[n.result.ticketId]
                if v1 and v1.status ~= "canceling" then
                    v7:changeStatus(v1, "matching")
                end
            elseif n.type == "confirm" then
                result = n.result
                v2 = v7.tickets[result.ticketId]
                if v2 then
                    if result.exists then
                        if v2.status ~= "canceling" then
                            v7:changeStatus(v2, result.status)
                        end
                        if result.status == "ready" then
                            v7.tickets[result.ticketId] = nil
                            v7.onMatch:Fire(v2, result.match)
                        end
                    else
                        v7.tickets[result.ticketId] = nil
                        v7.onTicketMissing:Fire(v2)
                    end
                end
            elseif n.type == "cancel" then
                result_2 = n.result
                v2 = v7.tickets[result_2.ticketId]
                if v2 then
                    v7.tickets[result_2.ticketId] = nil
                    v7.onCancel:Fire(v2)
                end
            end
        end
    end
end)

function u30:startTickLoop() -- Line: 164 -- upvalues: HttpService (val), u2 (val)
    self.tickLoopNonce = HttpService:GenerateGUID(false)
    local tickLoopNonce = self.tickLoopNonce
    task.spawn(u2.async(function() -- Line: 167 -- upvalues: self (val), tickLoopNonce (val), u2 (upval)
        while self.tickLoopNonce == tickLoopNonce do
            self.tickPromise = u2.Promise.all({
                u2.Promise.delay(1),
                ((self:tick()):catch(function(a1) -- Line: 169 -- upvalues: self (upval)
                    return self.onError:Fire(a1)
                end)),
            })
            u2.await(self.tickPromise)
        end
    end))
end

function u30:cancelTicket(a2) -- Line: 177
    local status = a2.status
    if status ~= "confirming" and status ~= "ready" then
        self:changeStatus(a2, "canceling")
        return true
    end
    return false
end

function u30:getEntryInvolvingPlayer(a2) -- Line: 185
    local v1 = tostring(a2.UserId)
    local v2 = nil
    local v3 = nil
    for i, j in self.tickets, v2, v3 do
        for k, n in j.options.players do
            if n.userId == v1 then
                return j
            end
        end
    end
end

function u30.getPlayersFromEntry(a1, a2) -- Line: 195 -- upvalues: Players (val)
    local PlayerByUserId, v1
    local v2 = {}
    for i, j in a2.options.players do
        v1 = tonumber(j.userId)
        if v1 ~= 0 and v1 == v1 and v1 then
            PlayerByUserId = Players:GetPlayerByUserId(v1)
            if PlayerByUserId then
                table.insert(v2, PlayerByUserId)
            end
        end
    end
    return v2
end

function u30.cancelTicketInvolving(a1, a2) -- Line: 209
    local v1 = a1:getEntryInvolvingPlayer(a2)
    if not v1 then
        return false
    end
    return a1:cancelTicket(v1)
end

function u30.isBusy(a1, a2) -- Line: 216
    return a1:getEntryInvolvingPlayer(a2) ~= nil
end

function u30.validateOptions(a1, a2) -- Line: 219
    local players = a2.players
    if #players == 0 then
        error("ticket has no players!")
    end
    if a2.desiredPlayerCount < #players then
        error("ticket has too many players!")
    end
    if typeof(a2.queue) ~= "string" then
        error("queue is not a string!")
    end
end

function u30.createTicket(a1, a2) -- Line: 233 -- upvalues: HttpService (val)
    local v1 = HttpService:GenerateGUID(false)
    a1:validateOptions(a2)
    local tickets = a1.tickets
    local v2 = {status = "pending"}
    local v3 = table.clone(a2)
    setmetatable(v3, nil)
    v3.id = v1
    v2.options = v3
    tickets[v1] = v2
    return v1
end

u30.testConnection = u2.async(function(a1) -- Line: 248 -- upvalues: HttpService (val)
    local v1 = HttpService:RequestAsync({Method = "GET", Url = ("%*/api/up"):format(a1.url)})
    assert(v1.Success, (("%* %*"):format(v1.StatusCode, v1.StatusMessage)))
end)
u30.destroy = u2.async(function(a1) -- Line: 257 -- upvalues: u2 (val)
    a1.tickLoopNonce = nil
    if a1.tickPromise then
        u2.await(a1.tickPromise:catch(warn))
    end
    for i, j in a1.tickets do
        a1:cancelTicket(j)
    end
    u2.await((a1:tick()):catch(warn))
end)
return {Client = u30}