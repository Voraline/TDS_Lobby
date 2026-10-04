-- Script path: ReplicatedStorage.Packages._Index.littensy_charm@0.11.0.charm.system
-- Decompile time: 3.65 ms

local checkDirty, propagate
local v1 = table.freeze({
    None = 0,
    Mutable = 1,
    Watching = 2,
    RecursedCheck = 4,
    Recursed = 8,
    Dirty = 16,
    Pending = 32,
})
local u3 = nil
local u4 = nil
local u5 = nil

local function isValidLink(a1, a2) -- Line: 53 -- types: a1: table, a2: table
    local depsTail = a2.depsTail
    while depsTail do
        if depsTail == a1 then
            return true
        end
        depsTail = depsTail.prevDep
    end
    return false
end

function propagate(a1) -- Line: 137 -- upvalues: u4 (ref), propagate (val) -- types: a1: table
    local depsTail, flags, sub, subs, v1
    repeat
        sub = a1.sub
        flags = sub.flags
        if bit32.band(flags, 60) == 0 then
            sub.flags = bit32.bor(flags, 32)
        elseif bit32.band(flags, 12) == 0 then
            flags = 0
        elseif bit32.band(flags, 4) == 0 then
            sub.flags = bit32.bor(bit32.band(flags, 4294967287), 32)
        elseif bit32.band(flags, 48) ~= 0 then
            flags = 0
        else
            depsTail = sub.depsTail
            while depsTail do
                if depsTail ~= a1 then
                    depsTail = depsTail.prevDep
                    continue
                else
                    v1 = true
                end
                if not v1 then
                    flags = 0
                else
                    sub.flags = bit32.bor(flags, 40)
                    flags = bit32.band(flags, 1)
                end
                if bit32.band(flags, 6) == 2 then
                    u4(sub)
                end
                if bit32.btest(flags, 1) then
                    subs = sub.subs
                    if subs then
                        propagate(subs)
                    end
                end
                if a1.nextSub then
                    break
                end
                return
            end
            if true then
                flags = 0
            else
                sub.flags = bit32.bor(flags, 40)
                flags = bit32.band(flags, 1)
            end
        end
        if bit32.band(flags, 6) == 2 then
            u4(sub)
        end
        if bit32.btest(flags, 1) then
            subs = sub.subs
            if subs then
                propagate(subs)
            end
        end
    until not a1.nextSub
end

local function shallowPropagate(a1) -- Line: 170 -- upvalues: u4 (ref) -- types: a1: table
    local flags, sub
    repeat
        sub = a1.sub
        flags = sub.flags
        if bit32.band(flags, 48) == 32 then
            sub.flags = bit32.bor(flags, 16)
            if bit32.band(flags, 6) == 2 then
                u4(sub)
            end
        end
    until not a1.nextSub
end

function checkDirty(a1, a2) -- Line: 184
    -- upvalues: u3 (ref), shallowPropagate (val), checkDirty (val)
    local dep, flags, subs, subs_2
    while true do
        dep = a1.dep
        flags = dep.flags
        if bit32.btest(a2.flags, 16) then
            break
        end
        if bit32.band(flags, 17) ~= 17 then
            if bit32.band(flags, 33) == 33 then
                if not checkDirty(dep.deps, dep) then
                    dep.flags = bit32.band(flags, 4294967263)
                elseif u3(dep) then
                    subs_2 = dep.subs
                    if subs_2.nextSub then
                        shallowPropagate(subs_2)
                    end
                    return true
                end
            end
        elseif u3(dep) then
            subs = dep.subs
            if subs.nextSub then
                shallowPropagate(subs)
            end
            return true
        end
        if not a1.nextDep then
            return false
        end
    end
    return true
end

return {
    ReactiveFlags = v1,
    link = function(a1, a2, a3) -- Line: 64 -- types: a1: table, a2: table, a3: number
        local depsTail = a2.depsTail
        if depsTail and depsTail.dep == a1 then
            return
        end
        local nextDep = if not depsTail then a2.deps else depsTail.nextDep
        if nextDep and nextDep.dep == a1 then
            nextDep.version = a3
            a2.depsTail = nextDep
            return
        end
        local subsTail = a1.subsTail
        if subsTail and subsTail.version == a3 and subsTail.sub == a2 then
            return
        end
        local v1 = {
            version = a3,
            dep = a1,
            sub = a2,
            prevDep = depsTail,
            nextDep = nextDep,
            prevSub = subsTail,
        }
        a2.depsTail = v1
        a1.subsTail = v1
        if nextDep then
            nextDep.prevDep = v1
        end
        if not depsTail then
            a2.deps = v1
        else
            depsTail.nextDep = v1
        end
        if subsTail then
            subsTail.nextSub = v1
            return
        end
        a1.subs = v1
    end,
    unlink = function(a1, a2) -- Line: 104 -- upvalues: u5 (ref) -- types: a1: table, a2: table?
        local v1 = a2 or a1.sub
        local dep = a1.dep
        local prevDep = a1.prevDep
        local nextDep = a1.nextDep
        local nextSub = a1.nextSub
        local prevSub = a1.prevSub
        if not nextDep then
            v1.depsTail = prevDep
        else
            nextDep.prevDep = prevDep
        end
        if not prevDep then
            v1.deps = nextDep
        else
            prevDep.nextDep = nextDep
        end
        if not nextSub then
            dep.subsTail = prevSub
        else
            nextSub.prevSub = prevSub
        end
        if prevSub then
            prevSub.nextSub = nextSub
            return nextDep
        end
        dep.subs = nextSub
        if not nextSub then
            u5(dep)
        end
        return nextDep
    end,
    propagate = propagate,
    checkDirty = checkDirty,
    shallowPropagate = shallowPropagate,
    createReactiveSystem = function(a1, a2, a3) -- Line: 219
        -- upvalues: u3 (ref), u4 (ref), u5 (ref)
        u3 = a1
        u4 = a2
        u5 = a3
    end,
}