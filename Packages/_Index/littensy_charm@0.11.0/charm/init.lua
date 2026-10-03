-- Script path: ReplicatedStorage.Packages._Index.littensy_charm@0.11.0.charm
-- Decompile time: 17.44 ms

local deepFreeze
local system = require(script.system)
local link = system.link
local unlink = system.unlink
local propagate = system.propagate
local checkDirty = system.checkDirty
local shallowPropagate = system.shallowPropagate
local createReactiveSystem = system.createReactiveSystem
local u10 = 0
local u11 = {}
local u12 = 0
local u13 = 0
local u14 = 0
local u15 = nil

local function isStudio() -- Line: 71
    local v1 = false
    if game ~= nil then
        v1 = game:GetService("RunService"):IsStudio()
    end
    return v1
end

local u17 = {trackInnerEffects = true}
local v1 = false
if game ~= nil then
    v1 = game:GetService("RunService"):IsStudio()
end
u17.strict = v1
v1 = false
if game ~= nil then
    v1 = game:GetService("RunService"):IsStudio()
end
u17.frozen = v1

local function wrapUserSpace(a1) -- Line: 100 -- upvalues: u17 (val) -- types: a1: function
    if not u17.strict or (debug.info(1, "s")) == debug.info(a1, "s") then
        return a1
    end

    local function u11(a1, a2, ...) -- Line: 110 -- types: a1: thread, a2: boolean
        if a2 then
            if coroutine.status(a1) ~= "dead" then
                error(debug.traceback(a1, "Attempted to yield in an effect or scope"), 0)
                return
            end
            return ...
        end
        local v1 = ...
        if type(v1) == "string" then
            error(debug.traceback(a1, v1), 0)
            return
        end
        error(tostring(v1), 0)
    end

    return function(...) -- Line: 125 -- upvalues: a1 (val), u11 (val)
        local v1 = coroutine.create(a1)
        return u11(v1, coroutine.resume(v1, ...))
    end
end

function deepFreeze(a1) -- Line: 135 -- upvalues: deepFreeze (val)
    if type(a1) == "table" and not table.isfrozen(a1) and getmetatable(a1) == nil then
        table.freeze(a1)
        for i, j in a1 do
            deepFreeze(j)
        end
    end
end

local function purgeDeps(a1) -- Line: 166 -- upvalues: unlink (val)
    local depsTail = a1.depsTail
    local nextDep = if not depsTail then a1.deps else depsTail.nextDep
    while nextDep do
        nextDep = unlink(nextDep, a1)
    end
end

local function runCleanups(a1) -- Line: 179 -- upvalues: u15 (ref) -- types: a1: table
    local result, success, v1
    local v2 = false
    local v3 = {}
    for i, j in a1 do
        a1[i] = nil
        v1 = u15
        u15 = nil
        success, result = pcall(j)
        u15 = v1
        if not success then
            v2 = true
            table.insert(v3, (tostring(result)))
        end
    end
    if v2 then
        error(("Errors occurred during effect cleanup:\n\n%*"):format((table.concat(v3, "\n\n"))), 0)
    end
end

local function run(a1) -- Line: 205
    -- upvalues: checkDirty (val), runCleanups (val), u10 (ref), u15 (ref), unlink (val), wrapUserSpace (val)
    local depsTail, nextDep, result, success, v1
    local flags = a1.flags
    if bit32.btest(flags, 16) then
        runCleanups(a1.cleanups)
        if a1.flags == 0 then
            return
        end
        u10 = u10 + 1
        a1.depsTail = nil
        a1.flags = 2
        v1 = u15
        u15 = a1
        success, result = pcall(a1.fn)
        u15 = v1
        depsTail = a1.depsTail
        nextDep = if not depsTail then a1.deps else depsTail.nextDep
        while nextDep do
            nextDep = unlink(nextDep, a1)
        end
        if not success then
            if not success then
                error(result, 0)
            end
        elseif result then
            table.insert(a1.cleanups, (wrapUserSpace(result)))
        elseif not success then
            error(result, 0)
        end
        if a1.flags == 0 then
            runCleanups(a1.cleanups)
            return
        end
        return
    end
    if bit32.btest(flags, 32) and checkDirty(a1.deps, a1) then
        runCleanups(a1.cleanups)
        if a1.flags == 0 then
            return
        end
        u10 = u10 + 1
        a1.depsTail = nil
        a1.flags = 2
        v1 = u15
        u15 = a1
        success, result = pcall(a1.fn)
        u15 = v1
        depsTail = a1.depsTail
        nextDep = if not depsTail then a1.deps else depsTail.nextDep
        while nextDep do
            nextDep = unlink(nextDep, a1)
        end
        if not success then
            if not success then
                error(result, 0)
            end
        elseif result then
            table.insert(a1.cleanups, (wrapUserSpace(result)))
        elseif not success then
            error(result, 0)
        end
        if a1.flags ~= 0 then
            return
        end
        runCleanups(a1.cleanups)
        return
    end
    a1.flags = 2
end

local function flush() -- Line: 249 -- upvalues: u14 (ref), u13 (ref), u12 (ref), u11 (val), run (val)
    if u14 == 0 and u13 == 0 then
        local v1
        local success, result = pcall(function() -- Line: 256 -- upvalues: u13 (upval), u12 (upval), u11 (upval), run (upval)
            local v1
            while u13 < u12 do
                u13 = u13 + 1
                v1 = u11[u13]
                u11[u13] = nil
                run(v1)
            end
        end)
        while u13 < u12 do
            u13 = u13 + 1
            v1 = u11[u13]
            u11[u13] = nil
            v1.flags = bit32.bor(v1.flags, 10)
        end
        u13 = 0
        u12 = 0
        if not success then
            error(result, 0)
        end
        return
    end
end

local function updateComputed(a1) -- Line: 302 -- upvalues: u10 (ref), u15 (ref), unlink (val)
    u10 = u10 + 1
    a1.depsTail = nil
    a1.flags = 5
    local v1 = u15
    u15 = a1
    local value = a1.value
    local success, result = pcall(a1.getter, value)
    u15 = v1
    a1.flags = bit32.band(a1.flags, 4294967291)
    local depsTail = a1.depsTail
    local nextDep = if not depsTail then a1.deps else depsTail.nextDep
    while nextDep do
        nextDep = unlink(nextDep, a1)
    end
    if success then
        a1.value = result
        return value ~= result
    end
    error(result, 0)
end

local function updateSignal(a1) -- Line: 327
    a1.flags = 1
    local pendingValue = a1.pendingValue
    if a1.currentValue == pendingValue then
        return false
    end
    a1.currentValue = pendingValue
    return true
end

local function stopEffect(a1) -- Line: 343 -- upvalues: unlink (val), runCleanups (val)
    a1.depsTail = nil
    a1.flags = 0
    local depsTail = a1.depsTail
    local nextDep = if not depsTail then a1.deps else depsTail.nextDep
    while nextDep do
        nextDep = unlink(nextDep, a1)
    end
    local subs = a1.subs
    if subs then
        unlink(subs, a1)
    end
    runCleanups(a1.cleanups)
end

local function signal(a1, a2) -- Line: 432
    -- upvalues: u17 (val), deepFreeze (val), shallowPropagate (val), u15 (ref), link (val), u10 (ref)
    -- upvalues: wrapUserSpace (val), propagate (val), flush (val)
    local u2 = {flags = 1, currentValue = a1, pendingValue = a1}
    if u17.frozen then
        deepFreeze(a1)
    end
    return function() -- Line: 443 -- upvalues: u2 (val), shallowPropagate (upval), u15 (upval), link (upval), u10 (upval)
        local subs_2
        if bit32.btest(u2.flags, 16) then
            local v1
            local v2 = u2
            v2.flags = 1
            local pendingValue = v2.pendingValue
            if v2.currentValue == pendingValue then
                v1 = false
            else
                v2.currentValue = pendingValue
                v1 = true
            end
            if v1 then
                local subs = u2.subs
                if subs then
                    shallowPropagate(subs)
                end
            end
        end
        local sub = u15
        while sub do
            if bit32.btest(sub.flags, 3) then
                link(u2, sub, u10)
                break
            end
            subs_2 = sub.subs
            sub = if not subs_2 then nil else subs_2.sub
        end
        return u2.currentValue
    end, function(a1) -- Line: 469
        -- upvalues: u15 (upval), wrapUserSpace (upval), u2 (val), a2 (val), u17 (upval), deepFreeze (upval)
        -- upvalues: propagate (upval), flush (upval)
        local v1 = nil
        if type(a1) ~= "function" then
            v1 = a1
        else
            local v2 = u15
            u15 = nil
            local success, result = pcall(wrapUserSpace(a1), u2.pendingValue)
            u15 = v2
            if not success then
                error(result, 2)
            else
                v1 = result
            end
        end
        if if not a2 then u2.pendingValue ~= v1 else not a2(u2.pendingValue, v1) then
            if u17.frozen then
                deepFreeze(v1)
            end
            u2.pendingValue = v1
            u2.flags = 17
            local subs = u2.subs
            if subs then
                propagate(subs)
                flush()
            end
        end
        return u2.pendingValue
    end
end

local function effect(a1) -- Line: 607
    -- upvalues: wrapUserSpace (val), u15 (ref), u17 (val), link (val), u14 (ref), flush (val), unlink (val)
    -- upvalues: runCleanups (val)
    local u1 = {flags = 2}
    u1.fn = wrapUserSpace(a1)
    u1.cleanups = {}
    if u15 then
        if u17.trackInnerEffects or u15.flags == 0 then
            link(u1, u15, 0)
        end
    end
    u14 = u14 + 1
    local v1 = u15
    u15 = u1
    local success, result = pcall(u1.fn)
    u15 = v1
    if not success then
        if not success then
            u14 = u14 - 1
            flush()
            error(result, 2)
        end
    elseif result then
        table.insert(u1.cleanups, (wrapUserSpace(result)))
    elseif not success then
        u14 = u14 - 1
        flush()
        error(result, 2)
    end
    u14 = u14 - 1
    flush()
    return function() -- Line: 638 -- upvalues: u1 (val), unlink (upval), runCleanups (upval)
        local v1 = u1
        v1.depsTail = nil
        v1.flags = 0
        local depsTail = v1.depsTail
        local nextDep = if not depsTail then v1.deps else depsTail.nextDep
        while nextDep do
            nextDep = unlink(nextDep, v1)
        end
        local subs = v1.subs
        if subs then
            unlink(subs, v1)
        end
        runCleanups(v1.cleanups)
    end
end

local function effectScope(a1, a2) -- Line: 652
    -- upvalues: u15 (ref), link (val), wrapUserSpace (val), unlink (val), runCleanups (val)
    local u2 = {flags = 0, cleanups = {}}
    if u15 and not a2 then
        link(u2, u15, 0)
    end
    local v1 = u15
    u15 = u2
    local success, result = pcall((wrapUserSpace(a1)))
    u15 = v1
    if not success then
        if not success then
            error(result, 2)
        end
    elseif result then
        table.insert(u2.cleanups, (wrapUserSpace(result)))
    elseif not success then
        error(result, 2)
    end
    return function() -- Line: 673 -- upvalues: u2 (val), unlink (upval), runCleanups (upval)
        local v1 = u2
        v1.depsTail = nil
        v1.flags = 0
        local depsTail = v1.depsTail
        local nextDep = if not depsTail then v1.deps else depsTail.nextDep
        while nextDep do
            nextDep = unlink(nextDep, v1)
        end
        local subs = v1.subs
        if subs then
            unlink(subs, v1)
        end
        runCleanups(v1.cleanups)
    end
end

local function untracked(a1, ...) -- Line: 743 -- upvalues: u15 (ref), wrapUserSpace (val) -- types: a1: function
    if not u15 then
        return a1(...)
    end
    local v1 = u15
    u15 = nil
    local v2 = {(pcall(wrapUserSpace(a1), ...))}
    u15 = v1
    if not v2[1] then
        error(v2[2], 2)
    end
    return unpack(v2, 2)
end

local function isSignal(a1) -- Line: 785 -- types: a1: function
    local v1 = debug.info(a1, "n")
    local v2 = true
    if v1 ~= "signalGetter" then
        v2 = true
        if v1 ~= "computedOper" then
            v2 = v1 == "atomOper"
        end
    end
    return v2
end

createReactiveSystem(function(a1) -- Line: 361 -- upvalues: updateComputed (val)
    if a1.depsTail then
        return updateComputed(a1)
    end
    a1.flags = 1
    local pendingValue = a1.pendingValue
    if a1.currentValue == pendingValue then
        return false
    end
    a1.currentValue = pendingValue
    return true
end, function(a1) -- Line: 373 -- upvalues: u12 (ref), u11 (val)
    local v1, v2, v3, v4
    local v5 = u12 + 1
    local v6 = a1
    repeat
        u12 = u12 + 1
        u11[u12] = v6
        v6.flags = bit32.band(v6.flags, 4294967293)
        v6 = v6.subs and v6.subs.sub
    until not v6 or bit32.band(v6.flags, 2) == 0
    local v7 = u12
    while v5 < v7 do
        v1 = u11
        v2 = u11
        v3 = u11[v7]
        v4 = u11[v5]
        v1[v5] = v3
        v2[v7] = v4
        v5 = v5 + 1
        v7 = v7 - 1
    end
end, function(a1) -- Line: 412 -- upvalues: unlink (val), runCleanups (val)
    if bit32.band(a1.flags, 1) ~= 0 then
        if a1.depsTail then
            a1.depsTail = nil
            a1.flags = 17
            local depsTail_2 = a1.depsTail
            local nextDep_2 = if not depsTail_2 then a1.deps else depsTail_2.nextDep
            while nextDep_2 do
                nextDep_2 = unlink(nextDep_2, a1)
            end
        end
        return
    end
    a1.depsTail = nil
    a1.flags = 0
    local depsTail = a1.depsTail
    local nextDep = if not depsTail then a1.deps else depsTail.nextDep
    while nextDep do
        nextDep = unlink(nextDep, a1)
    end
    local subs = a1.subs
    if subs then
        unlink(subs, a1)
    end
    runCleanups(a1.cleanups)
end)
return {
    ReactiveFlags = system.ReactiveFlags,
    flags = u17,
    atom = function(a1, a2) -- Line: 519 -- upvalues: signal (val) -- types: a2: function?
        local u5, u6 = signal(a1, a2)
        return function(...) -- Line: 522 -- upvalues: u5 (val), u6 (val)
            if select("#", ...) == 0 then
                return (u5())
            end
            return (u6((...)))
        end
    end,
    signal = signal,
    computed = function(a1) -- Line: 538
        -- upvalues: wrapUserSpace (val), updateComputed (val), shallowPropagate (val), checkDirty (val), u15 (ref)
        -- upvalues: link (val), u10 (ref)
        local u1 = {flags = 0}
        u1.getter = wrapUserSpace(a1)
        return function() -- Line: 544
            -- upvalues: u1 (val), updateComputed (upval), shallowPropagate (upval), checkDirty (upval), u15 (upval)
            -- upvalues: link (upval), u10 (upval)
            local flags = u1.flags
            if not bit32.btest(flags, 16) then
                if not bit32.btest(flags, 32) then
                    if flags == 0 then
                        u1.flags = 5
                        local v1 = u15
                        u15 = u1
                        local success, result = pcall(u1.getter)
                        u15 = v1
                        u1.flags = bit32.band(u1.flags, 4294967291)
                        if not success then
                            error(result, 2)
                        else
                            u1.value = result
                        end
                    end
                elseif not checkDirty(u1.deps, u1) then
                    u1.flags = bit32.band(flags, 4294967263)
                elseif updateComputed(u1) then
                    local subs_2 = u1.subs
                    if subs_2 then
                        shallowPropagate(subs_2)
                    end
                end
            elseif updateComputed(u1) then
                local subs = u1.subs
                if subs then
                    shallowPropagate(subs)
                end
            end
            if u15 then
                link(u1, u15, u10)
            end
            return u1.value
        end
    end,
    effect = effect,
    effectScope = effectScope,
    trigger = function(a1) -- Line: 685
        -- upvalues: u15 (ref), wrapUserSpace (val), unlink (val), propagate (val), shallowPropagate (val), flush (val)
        local subs
        local v1 = {flags = 2}
        local v2 = u15
        u15 = v1
        local success, result = pcall((wrapUserSpace(a1)))
        u15 = v2
        v1.flags = 0
        local deps = v1.deps
        while deps do
            subs = deps.dep.subs
            deps = unlink(deps, v1)
            if subs then
                propagate(subs)
                shallowPropagate(subs)
            end
        end
        flush()
        if not success then
            error(result, 2)
        end
    end,
    untracked = untracked,
    batch = function(a1, ...) -- Line: 768 -- upvalues: u14 (ref), wrapUserSpace (val), flush (val) -- types: a1: function
        u14 = u14 + 1
        local v1 = {(pcall(wrapUserSpace(a1), ...))}
        u14 = u14 - 1
        flush()
        if not v1[1] then
            error(v1[2], 2)
        end
        return unpack(v1, 2)
    end,
    subscribe = function(a1, a2) -- Line: 821
        -- upvalues: wrapUserSpace (val), updateComputed (val), shallowPropagate (val), checkDirty (val), u15 (ref)
        -- upvalues: link (val), u10 (ref), effect (val), untracked (val)
        local u18
        local v1 = debug.info(a1, "n")
        local v2 = true
        if v1 ~= "signalGetter" then
            v2 = true
            if v1 ~= "computedOper" then
                v2 = v1 == "atomOper"
            end
        end
        if not v2 then
            local u13 = {flags = 0}
            u13.getter = wrapUserSpace(a1)

            function u18() -- Line: 544
                -- upvalues: u13 (val), updateComputed (upval), shallowPropagate (upval), checkDirty (upval)
                -- upvalues: u15 (upval), link (upval), u10 (upval)
                local flags = u13.flags
                if not bit32.btest(flags, 16) then
                    if not bit32.btest(flags, 32) then
                        if flags == 0 then
                            u13.flags = 5
                            local v1 = u15
                            u15 = u13
                            local success, result = pcall(u13.getter)
                            u15 = v1
                            u13.flags = bit32.band(u13.flags, 4294967291)
                            if not success then
                                error(result, 2)
                            else
                                u13.value = result
                            end
                        end
                    elseif not checkDirty(u13.deps, u13) then
                        u13.flags = bit32.band(flags, 4294967263)
                    elseif updateComputed(u13) then
                        local subs_2 = u13.subs
                        if subs_2 then
                            shallowPropagate(subs_2)
                        end
                    end
                elseif updateComputed(u13) then
                    local subs = u13.subs
                    if subs then
                        shallowPropagate(subs)
                    end
                end
                if u15 then
                    link(u13, u15, u10)
                end
                return u13.value
            end
        else
            u18 = a1
        end
        local u19 = nil
        local u20 = true
        return (effect(function() -- Line: 826 -- upvalues: u19 (ref), u18 (val), u20 (ref), untracked (upval), a2 (val)
            local v1 = u19
            u19 = u18()
            if u20 then
                u20 = false
                return
            end
            untracked(a2, u19, v1)
        end))
    end,
    listen = function(a1, a2) -- Line: 800
        -- upvalues: wrapUserSpace (val), updateComputed (val), shallowPropagate (val), checkDirty (val), u15 (ref)
        -- upvalues: link (val), u10 (ref), effect (val), untracked (val)
        local u18
        local v1 = debug.info(a1, "n")
        local v2 = true
        if v1 ~= "signalGetter" then
            v2 = true
            if v1 ~= "computedOper" then
                v2 = v1 == "atomOper"
            end
        end
        if not v2 then
            local u13 = {flags = 0}
            u13.getter = wrapUserSpace(a1)

            function u18() -- Line: 544
                -- upvalues: u13 (val), updateComputed (upval), shallowPropagate (upval), checkDirty (upval)
                -- upvalues: u15 (upval), link (upval), u10 (upval)
                local flags = u13.flags
                if not bit32.btest(flags, 16) then
                    if not bit32.btest(flags, 32) then
                        if flags == 0 then
                            u13.flags = 5
                            local v1 = u15
                            u15 = u13
                            local success, result = pcall(u13.getter)
                            u15 = v1
                            u13.flags = bit32.band(u13.flags, 4294967291)
                            if not success then
                                error(result, 2)
                            else
                                u13.value = result
                            end
                        end
                    elseif not checkDirty(u13.deps, u13) then
                        u13.flags = bit32.band(flags, 4294967263)
                    elseif updateComputed(u13) then
                        local subs_2 = u13.subs
                        if subs_2 then
                            shallowPropagate(subs_2)
                        end
                    end
                elseif updateComputed(u13) then
                    local subs = u13.subs
                    if subs then
                        shallowPropagate(subs)
                    end
                end
                if u15 then
                    link(u13, u15, u10)
                end
                return u13.value
            end
        else
            u18 = a1
        end
        local u19 = nil
        return (effect(function() -- Line: 804 -- upvalues: u19 (ref), u18 (val), untracked (upval), a2 (val)
            local v1 = u19
            u19 = u18()
            untracked(a2, u19, v1)
        end))
    end,
    observe = function(a1, a2) -- Line: 851
        -- upvalues: wrapUserSpace (val), effectScope (val), effect (val), untracked (val)
        local u5 = wrapUserSpace(a1)
        local u9 = wrapUserSpace(a2)
        local u10 = {}
        local u11 = false

        local function updateScopes(a1) -- Line: 858
            -- upvalues: u10 (val), u11 (ref), effectScope (upval), u9 (ref)
            local v1
            for i, j in u10 do
                if a1[i] == nil then
                    u10[i] = nil
                    j()
                    if u11 then
                        return
                    end
                end
            end
            for k, n in a1 do
                if u10[k] == nil then
                    v1 = effectScope(function() -- Line: 871 -- upvalues: u9 (upval), n (val), k (val)
                        return u9(n, k)
                    end, true)
                    if u11 then
                        v1()
                        return
                    end
                    u10[k] = v1
                end
            end
        end

        return (effectScope(function() -- Line: 883
            -- upvalues: effect (upval), untracked (upval), updateScopes (val), u5 (ref), u11 (ref), u10 (val)
            effect(function() -- Line: 884 -- upvalues: untracked (upval), updateScopes (upval), u5 (upval)
                untracked(updateScopes, u5())
            end)
            return function() -- Line: 890 -- upvalues: u11 (upval), u10 (upval)
                u11 = true
                for i, j in u10 do
                    u10[i] = nil
                    j()
                end
            end
        end))
    end,
    mapped = function(a1, a2) -- Line: 912
        -- upvalues: wrapUserSpace (val), updateComputed (val), shallowPropagate (val), checkDirty (val), u15 (ref)
        -- upvalues: link (val), u10 (ref)
        local u5 = wrapUserSpace(a1)
        local u9 = wrapUserSpace(a2)
        local u10_2 = {}
        local u11 = {}
        local u13 = {flags = 0}
        u13.getter = wrapUserSpace(function(a1) -- Line: 919 -- upvalues: u10_2 (ref), u5 (ref), u11 (val), u9 (ref) -- types: a1: table?
            local v1, v2, v3, v4
            local v5 = a1 or {}
            local v6 = u10_2
            u10_2 = u5()
            local v7 = nil
            local v8 = nil
            local v9 = a1
            for i in v6, v7, v8 do
                if u10_2[i] == nil then
                    v3 = u11[i]
                    if v3 ~= nil then
                        if v5 == v9 then
                            v5 = table.clone(v5)
                        end
                        v5[v3] = nil
                        u11[i] = nil
                    end
                end
            end
            v7 = nil
            v8 = nil
            for j, k in u10_2, v7, v8 do
                if k ~= v6[j] then
                    v3, v4 = u9(k, j)
                    v1 = if v4 == nil then j else v4
                    v2 = u11[j]
                    if v2 == nil then
                        if v5[v1] ~= v3 then
                            if v5 == v9 then
                                v5 = table.clone(v5)
                            end
                            v5[v1] = v3
                            u11[j] = v1
                        end
                    elseif v2 ~= v1 then
                        if v5 == v9 then
                            v5 = table.clone(v5)
                        end
                        v5[v2] = nil
                        v5[v1] = v3
                        u11[j] = v1
                    elseif v5[v1] ~= v3 then
                        if v5 == v9 then
                            v5 = table.clone(v5)
                        end
                        v5[v1] = v3
                        u11[j] = v1
                    end
                end
            end
            return v5
        end)
        return function() -- Line: 544
            -- upvalues: u13 (val), updateComputed (upval), shallowPropagate (upval), checkDirty (upval), u15 (upval)
            -- upvalues: link (upval), u10 (upval)
            local flags = u13.flags
            if not bit32.btest(flags, 16) then
                if not bit32.btest(flags, 32) then
                    if flags == 0 then
                        u13.flags = 5
                        local v1 = u15
                        u15 = u13
                        local success, result = pcall(u13.getter)
                        u15 = v1
                        u13.flags = bit32.band(u13.flags, 4294967291)
                        if not success then
                            error(result, 2)
                        else
                            u13.value = result
                        end
                    end
                elseif not checkDirty(u13.deps, u13) then
                    u13.flags = bit32.band(flags, 4294967263)
                elseif updateComputed(u13) then
                    local subs_2 = u13.subs
                    if subs_2 then
                        shallowPropagate(subs_2)
                    end
                end
            elseif updateComputed(u13) then
                local subs = u13.subs
                if subs then
                    shallowPropagate(subs)
                end
            end
            if u15 then
                link(u13, u15, u10)
            end
            return u13.value
        end
    end,
    onCleanup = function(a1, a2) -- Line: 722 -- upvalues: u15 (ref), wrapUserSpace (val) -- types: a1: function, a2: boolean?
        if u15 and u15.cleanups then
            table.insert(u15.cleanups, (wrapUserSpace(a1)))
            return
        end
        if not a2 then
            warn(debug.traceback("onCleanup() can only be called inside an effect or a scope.", 2))
        end
    end,
    getActiveSub = function() -- Line: 147 -- upvalues: u15 (ref)
        return u15
    end,
    setActiveSub = function(a1) -- Line: 155 -- upvalues: u15 (ref)
        local v1 = u15
        u15 = a1
        return v1
    end,
    startBatch = function() -- Line: 285 -- upvalues: u14 (ref)
        u14 = u14 + 1
    end,
    endBatch = function() -- Line: 293 -- upvalues: u14 (ref), flush (val)
        u14 = u14 - 1
        flush()
    end,
}