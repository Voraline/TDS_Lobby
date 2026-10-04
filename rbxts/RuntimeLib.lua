-- Script path: ReplicatedStorage.rbxts.RuntimeLib
-- Decompile time: 3.69 ms

local Promise = require(script.Parent.Promise)
local RunService = game:GetService("RunService")
local u10 = {Promise = Promise}

local function isPlugin(a1) -- Line: 13 -- upvalues: RunService (val)
    return RunService:IsStudio() and a1:FindFirstAncestorWhichIsA("Plugin") ~= nil
end

function u10.getModule(a1, a2, a3) -- Line: 17 -- upvalues: RunService (val)
    local node_modules, v1, v2
    if a3 == nil then
        a3 = a2
        a2 = "@rbxts"
    end
    if RunService:IsRunning() and RunService:IsClient() then
        local v3 = RunService:IsStudio() and a1:FindFirstAncestorWhichIsA("Plugin") ~= nil
        if not v3 and not game:IsLoaded() then
            game.Loaded:Wait()
        end
    end
    local Parent = a1
    while true do
        node_modules = Parent:FindFirstChild("node_modules")
        if node_modules then
            v1 = node_modules:FindFirstChild(a2)
            if v1 then
                v2 = v1:FindFirstChild(a3)
                if v2 then
                    return v2
                end
            end
        end
        Parent = Parent.Parent
        if Parent == nil then
            error("roblox-ts: " .. "Could not find module: " .. a3, 2)
            return
        end
    end
end

local u13 = {}
local u14 = {}

function u10.import(a1, a2, ...) -- Line: 56 -- upvalues: u13 (val), u14 (val), u10 (val)
    local Name
    for i = 1, (select("#", ...)) do
        a2 = a2:WaitForChild((select(i, ...)))
    end
    if a2.ClassName ~= "ModuleScript" then
        error("roblox-ts: " .. "Failed to import! Expected ModuleScript, got " .. a2.ClassName, 2)
    end
    u13[a1] = a2
    local v1 = a2
    local v2 = 0
    while v1 do
        v2 = v2 + 1
        v1 = u13[v1]
        if v1 == a2 then
            Name = v1.Name
            for j = 1, v2 do
                v1 = u13[v1]
                Name = Name .. "  ⇒ " .. v1.Name
            end
            error("roblox-ts: " .. "Failed to import! Detected a circular dependency chain: " .. Name, 2)
        end
    end
    if not u14[a2] then
        if _G[a2] then
            error("roblox-ts: " .. "Invalid module access! Do you have multiple TS runtimes trying to import this? " .. a2:GetFullName(), 2)
        end
        _G[a2] = u10
        u14[a2] = true
    end
    local v3 = require(a2)
    if u13[a1] == a2 then
        u13[a1] = nil
    end
    return v3
end

function u10.instanceof(a1, a2) -- Line: 122
    if type(a2) == "table" and type(a2.instanceof) == "function" then
        return a2.instanceof(a1)
    end
    if type(a1) == "table" then
        local v1
        local __index = getmetatable(a1)
        while __index ~= nil do
            if __index == a2 then
                return true
            end
            v1 = getmetatable(__index)
            __index = if not v1 then nil else v1.__index
        end
    end
    return false
end

function u10.async(a1) -- Line: 147 -- upvalues: Promise (val)
    return function(...) -- Line: 148 -- upvalues: Promise (upval), a1 (val)
        local u3 = select("#", ...)
        local u4 = {}
        u4[1] = ...
        return Promise.new(function(a1_2, a2) -- Line: 151 -- upvalues: a1 (upval), u4 (val), u3 (val)
            coroutine.wrap(function() -- Line: 152 -- upvalues: a1 (upval), u4 (upval), u3 (upval), a1_2 (val), a2 (val)
                local v1 = u3
                local success, result = pcall(a1, unpack(u4, 1, v1))
                if success then
                    a1_2(result)
                    return
                end
                a2(result)
            end)()
        end)
    end
end

function u10.await(a1) -- Line: 164 -- upvalues: Promise (val)
    if not Promise.is(a1) then
        return a1
    end
    local v1, v2 = a1:awaitStatus()
    if v1 == Promise.Status.Resolved then
        return v2
    end
    if v1 == Promise.Status.Rejected then
        error(v2, 2)
        return
    end
    error("The awaited Promise was cancelled", 2)
end

local function bit_sign(a1) -- Line: 181
    if bit32.btest(a1, 2147483648) then
        return a1 - 4294967296
    end
    return a1
end

function u10.bit_lrsh(a1, a2) -- Line: 190
    local v1 = bit32.arshift(a1, a2)
    if bit32.btest(v1, 2147483648) then
        return v1 - 4294967296
    end
    return v1
end

u10.TRY_RETURN = 1
u10.TRY_BREAK = 2
u10.TRY_CONTINUE = 3

function u10.try(a1, a2, a3) -- Line: 198
    local v1, v2
    local u3 = nil
    local u4 = nil
    local success, result, v3 = xpcall(a1, function(a1) -- Line: 200 -- upvalues: u3 (ref), u4 (ref)
        u3 = a1
        u4 = debug.traceback()
    end)
    if not success and a2 then
        v1, v2 = a2(u3, u4)
        if v1 then
            result = v1
            v3 = v2
        end
    end
    if a3 then
        v1, v2 = a3()
        if v1 then
            result = v1
            v3 = v2
        end
    end
    return result, v3
end

function u10.generator(a1) -- Line: 219
    local u3 = coroutine.create(a1)
    return {
        next = function(...) -- Line: 222 -- upvalues: u3 (val)
            if coroutine.status(u3) == "dead" then
                return {done = true}
            end
            local v1, v2 = coroutine.resume(u3, ...)
            if v1 == false then
                error(v2, 2)
            end
            return {value = v2, done = coroutine.status(u3) == "dead"}
        end,
    }
end

return u10