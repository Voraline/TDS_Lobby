-- Script path: ReplicatedStorage.Shared.Modules.GlobalModifier
-- Decompile time: 5.01 ms

local u0 = {}
u0.__index = u0
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
require(ReplicatedStorage.Shared.Types.PromiseTypes)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u38 = RunService:IsServer()
local u39 = {}

local function addModifierTimer(a1) -- Line: 29 -- upvalues: u39 (val), RunService (val), GameState (val)
    local v1 = next(u39) == nil
    u39[a1] = true
    if not v1 then
        return
    end
    local u10 = nil
    local v2 = RunService.Heartbeat:Connect(function(a1) -- Line: 39 -- upvalues: GameState (upval), u39 (upval), u10 (ref) -- types: a1: number
        local v1 = a1 * GameState.TimeScale
        local v2 = nil
        local v3 = nil
        for i in u39, v2, v3 do
            if not i.Enabled then
                u39[i] = nil
            elseif i._timeLeft then
                i._timeLeft = i._timeLeft - v1
                if i._timeLeft <= 0 then
                    i:setEnabled(false)
                    u39[i] = nil
                    i._timeLeft = nil
                    i.TimerChanged:Fire(nil)
                end
            else
                u39[i] = nil
            end
        end
        if not next(u39) then
            u10:Disconnect()
        end
    end)
end

local function api(a1, a2) -- Line: 65 -- upvalues: GameState (val)
    local u2 = {}

    function u2.cancel() -- Line: 68 -- upvalues: a2 (val)
        task.delay(0, function() -- Line: 69 -- upvalues: a2 (upval)
            a2:setEnabled(false)
        end)
    end

    function u2.modifyInstance(a1_2, a2, a3) -- Line: 74
        -- upvalues: u2 (val), a1 (val)
        local Parent = a2.Parent
        local Children = a2.Children
        local Events = a2.Events
        local Tags = a2.Tags
        local Attributes = a2.Attributes
        local Parent_2 = a1_2.Parent
        a2.Parent = nil
        a2.Children = nil
        a2.Events = nil
        a2.Tags = nil
        a2.Attributes = nil
        local u150 = {}
        local u47 = {}
        for k, v in pairs(a2) do
            u150[k] = a1_2[k]
            a1_2[k] = v
        end
        if Children then
            local v1 = nil
            local v2 = nil
            for i, j in Children, v1, v2 do
                if j.Parent ~= nil then
                    u47[j] = j.Parent
                end
                j.Parent = a1_2
            end
        end
        if Events then
            for k2, n in Events do
                u2.connect(a1_2[k2], function(...) -- Line: 113 -- upvalues: n (val), a1_2 (val)
                    n(a1_2, ...)
                end)
            end
        end
        if Tags then
            for m, i5 in Tags do
                a1_2:AddTag(i5)
            end
        end
        if Attributes then
            for i6, i7 in Attributes do
                a1_2:SetAttribute(i6, i7)
            end
        end
        if Parent then
            a1_2.Parent = Parent
        end
        a1:Mark(function() -- Line: 135 -- upvalues: a3 (val), u150 (val), a1_2 (val), a2 (val), u47 (val), Parent_2 (val)
            if not a3 then
                for i, j in u150 do
                    if a1_2[i] == a2[i] then
                        a1_2[i] = j
                    end
                end
            end
            for k, n in u47 do
                k.Parent = n
            end
            if Parent_2 ~= nil then
                a1_2.Parent = Parent_2
            end
        end)
        return a1_2
    end

    function u2.makeInstance(a1_2, a2) -- Line: 159 -- upvalues: a1 (val), u2 (val) -- types: a1_2: string, a2: table?
        local v1 = Instance.new(a1_2)
        a1:Mark(v1)
        if a2 then
            u2.modifyInstance(v1, a2, true)
        end
        return v1
    end

    function u2.connect(a1_2, a2) -- Line: 171 -- upvalues: a1 (val) -- types: a2: function
        local v1 = a1_2:Connect(a2)
        a1:Mark(v1)
        return v1
    end

    function u2.task(a1_2) -- Line: 178 -- upvalues: a1 (val) -- types: a1_2: thread
        a1:Mark(a1_2)
        return a1_2
    end

    function u2.getPathNames() -- Line: 184 -- upvalues: GameState (upval)
        local v1 = {}
        for i, j in GameState.Paths do
            v1[i] = j
        end
        return v1
    end

    function u2.promise(a1_2) -- Line: 194 -- upvalues: a1 (val)
        a1:Mark(function() -- Line: 195 -- upvalues: a1_2 (val)
            a1_2:cancel()
        end)
        return a1_2
    end

    function u2.middleware(a1_2) -- Line: 202 -- upvalues: a1 (val) -- types: a1_2: function
        a1:Mark(a1_2)
        return a1_2
    end

    function u2.setTimeLeft(a1) -- Line: 208 -- upvalues: a2 (val) -- types: a1: number?
        a2:setTimeLeft(a1)
    end

    return u2
end

function u0.new(a1, a2) -- Line: 215 -- upvalues: u0 (val), Maid (val), api (val), Signal (val) -- types: a2: boolean?
    local v1 = setmetatable({}, u0)
    v1._timeLeft = nil
    v1._data = a1
    v1._maid = Maid.new()
    v1.Enabled = false
    v1._api = api(v1._maid, v1)
    v1.EnabledChanged = Signal.new()
    v1:setEnabled(if a2 ~= nil then a2 else true)
    return v1
end

function u0:setTimeLeft(a2) -- Line: 232 -- upvalues: u39 (val), RunService (val), GameState (val) -- types: a2: number?
    local v1 = self._timeLeft ~= nil
    self._timeLeft = a2
    if not a2 or not v1 and a2 then
        self.TimerChanged:Fire(a2)
    end
    if not a2 then
        u39[self] = nil
        return
    end
    local v2 = next(u39) == nil
    u39[self] = true
    if not v2 then
        return
    end
    local u26 = nil
    local v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 39 -- upvalues: GameState (upval), u39 (upval), u26 (ref) -- types: a1: number
        local v1 = a1 * GameState.TimeScale
        local v2 = nil
        local v3 = nil
        for i in u39, v2, v3 do
            if not i.Enabled then
                u39[i] = nil
            elseif i._timeLeft then
                i._timeLeft = i._timeLeft - v1
                if i._timeLeft <= 0 then
                    i:setEnabled(false)
                    u39[i] = nil
                    i._timeLeft = nil
                    i.TimerChanged:Fire(nil)
                end
            else
                u39[i] = nil
            end
        end
        if not next(u39) then
            u26:Disconnect()
        end
    end)
end

function u0:setEnabled(a2, ...) -- Line: 248 -- upvalues: u38 (val) -- types: a2: boolean
    if self.Enabled == a2 then
        return
    end
    self.Enabled = a2
    self.EnabledChanged:Fire(a2)
    if not a2 then
        if not u38 then
            if self._data.onDisableClient then
                self._data.onDisableClient(...)
            end
        elseif self._data.onDisableServer then
            self._data.onDisableServer(...)
        end
        self._maid:Sweep()
        return
    end
    if u38 then
        if not self._data.onEnableServer then
            return
        end
        self._data.onEnableServer(self._api, self._maid, self._api.cancel, ...)
        return
    end
    if not self._data.onEnableClient then
        return
    end
    self._data.onEnableClient(self._api, self._maid)
end

function u0.Destroy(a1) -- Line: 281
    a1:setEnabled(false)
    a1._maid:Sweep()
end

return u0