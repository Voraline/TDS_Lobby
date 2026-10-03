-- Script path: ReplicatedStorage.Client.Modules.Cache
-- Decompile time: 2.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local Session = Network.Channel("Session")
local u34 = RunService:IsRunning()
local u37 = RunService:IsStudio()
local u38 = {}
local u39 = {}
u38.__index = u38

local function output(...) -- Line: 20 -- upvalues: u34 (val), u37 (val)
    if not u34 then end
end

function u38.new(a1) -- Line: 26 -- upvalues: Charm (val), Signal (val), u38 (val), output (val) -- types: a1: string
    local v1 = {_name = a1, _data = Charm.atom(nil), Updated = Signal.new()}
    local v2 = setmetatable(v1, u38)
    output("[CACHE] Initialized... " .. a1)
    return v2
end

function u38.GetValue(a1) -- Line: 40
    return a1._data()
end

function u38.Get(a1) -- Line: 44 -- upvalues: TypedPromise (val)
    local v1 = a1._data()
    if v1 then
        return TypedPromise.resolve(v1)
    end
    return a1:Download()
end

function u38:Download(a2) -- Line: 54
    -- upvalues: u34 (val), TypedPromise (val), output (val), Session (val)
    if not u34 then
        return TypedPromise.resolve()
    end
    if self._download then
        return self._download
    end
    local _name = self._name
    local u11 = self._data()
    local u16 = TypedPromise.new(function(a1, a2_2, a3) -- Line: 67
        -- upvalues: output (upval), _name (val), Session (upval), self (val), u11 (val), a2 (val)
        local v1
        local u3 = false
        a3(function() -- Line: 70 -- upvalues: u3 (ref)
            u3 = true
        end)
        while true do
            output((("[CACHE] Downloading... %*"):format(_name)))
            v1 = Session:InvokeServer("Search", _name)
            if u3 then
                break
            end
            if self._data() ~= u11 then
                a2_2("Cache was updated during download")
                return
            end
            if v1 then
                self:Update(v1)
                output((("[CACHE] Finalized... %*"):format(_name)))
                a1(v1)
                return
            end
            output((("[CACHE] Error... %*"):format(_name)))
            task.wait(1)
            if u3 then
                return
            end
            output((("[CACHE] Retrying ... %*"):format(_name)))
            if a2 ~= false and not u3 then
                continue
            end
            a2_2("Failed to download or was cancelled")
            return
        end
    end)
    u16:finally(function() -- Line: 109 -- upvalues: self (val), u16 (ref)
        if self._download == u16 then
            self._download = nil
        end
    end)
    self._download = u16
    return u16
end

function u38:Update(a2) -- Line: 119 -- upvalues: output (val)
    local v1 = self._data()
    self._data(a2)
    output((("[CACHE] Updated... %*"):format(self._name)))
    self.Updated:Fire(a2, v1)
end

Session:On("Update", function(a1, a2) -- Line: 127 -- upvalues: u39 (val), output (val) -- types: a1: string
    local v1 = u39[a1]
    if not v1 then
        output("[CACHE] Remote update... " .. a1 .. " (not found)")
        return
    end
    output("[CACHE] Remote update... " .. a1)
    v1:Update(a2)
end)
return function(a1) -- Line: 137 -- upvalues: u39 (val), u38 (val) -- types: a1: string
    local v1 = u39[a1]
    if not v1 then
        u39[a1] = (u38.new(a1))
    end
    return v1
end