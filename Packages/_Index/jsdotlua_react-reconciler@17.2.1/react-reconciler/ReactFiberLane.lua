-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberLane
-- Decompile time: 10.88 ms

local findUpdateLane
require(script.Parent:WaitForChild("ReactInternalTypes"))
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local v1 = require(script.Parent:WaitForChild("ReactFiberSchedulerPriorities.roblox"))
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local ImmediatePriority = v1.ImmediatePriority
local UserBlockingPriority = v1.UserBlockingPriority
local NormalPriority = v1.NormalPriority
local LowPriority = v1.LowPriority
local IdlePriority = v1.IdlePriority
local NoPriority = v1.NoPriority
local v2 = {
    SyncLanePriority = 15,
    SyncBatchedLanePriority = 14,
    InputDiscreteLanePriority = 12,
    InputContinuousLanePriority = 10,
    DefaultLanePriority = 8,
    TransitionPriority = 6,
    NoLanePriority = 0,
    NoLanes = 0,
    NoLane = 0,
    SyncLane = 1,
    SyncBatchedLane = 2,
    InputDiscreteHydrationLane = 4,
    DefaultHydrationLane = 256,
    DefaultLanes = 3584,
    RetryLanes = 62914560,
    SomeRetryLane = 33554432,
    SelectiveHydrationLane = 67108864,
    IdleHydrationLane = 134217728,
    OffscreenLane = 1073741824,
    NoTimestamp = -1,
}
local NoLanePriority = v2.NoLanePriority

function v2.getCurrentUpdateLanePriority() -- Line: 141 -- upvalues: NoLanePriority (ref)
    return NoLanePriority
end

function v2.setCurrentUpdateLanePriority(a1) -- Line: 145 -- upvalues: NoLanePriority (ref)
    NoLanePriority = a1
end

local DefaultLanePriority = v2.DefaultLanePriority

local function getHighestPriorityLanes(a1) -- Line: 153 -- upvalues: DefaultLanePriority (ref), console (val)
    if bit32.band(1, a1) ~= 0 then
        DefaultLanePriority = 15
        return 1
    end
    if bit32.band(2, a1) ~= 0 then
        DefaultLanePriority = 14
        return 2
    end
    if bit32.band(4, a1) ~= 0 then
        DefaultLanePriority = 13
        return 4
    end
    local v1 = bit32.band(24, a1)
    if v1 ~= 0 then
        DefaultLanePriority = 12
        return v1
    end
    if bit32.band(a1, 32) ~= 0 then
        DefaultLanePriority = 11
        return 32
    end
    local v2 = bit32.band(192, a1)
    if v2 ~= 0 then
        DefaultLanePriority = 10
        return v2
    end
    if bit32.band(a1, 256) ~= 0 then
        DefaultLanePriority = 9
        return 256
    end
    local v3 = bit32.band(3584, a1)
    if v3 ~= 0 then
        DefaultLanePriority = 8
        return v3
    end
    if bit32.band(a1, 4096) ~= 0 then
        DefaultLanePriority = 7
        return 4096
    end
    local v4 = bit32.band(4186112, a1)
    if v4 ~= 0 then
        DefaultLanePriority = 6
        return v4
    end
    local v5 = bit32.band(62914560, a1)
    if v5 ~= 0 then
        DefaultLanePriority = 5
        return v5
    end
    if bit32.band(a1, 67108864) ~= 0 then
        DefaultLanePriority = 4
        return 67108864
    end
    if bit32.band(a1, 134217728) ~= 0 then
        DefaultLanePriority = 3
        return 134217728
    end
    local v6 = bit32.band(805306368, a1)
    if v6 ~= 0 then
        DefaultLanePriority = 2
        return v6
    end
    if bit32.band(1073741824, a1) ~= 0 then
        DefaultLanePriority = 1
        return 1073741824
    end
    if _G.__DEV__ then
        console.error("Should have found matching lanes. This is a bug in React.")
    end
    DefaultLanePriority = 8
    return a1
end

function v2.schedulerPriorityToLanePriority(a1) -- Line: 228
    -- upvalues: ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val), LowPriority (val)
    -- upvalues: IdlePriority (val)
    if a1 == ImmediatePriority then
        return 15
    end
    if a1 == UserBlockingPriority then
        return 10
    end
    if a1 ~= NormalPriority and a1 ~= LowPriority then
        if a1 == IdlePriority then
            return 2
        end
        return 0
    end
    return 8
end

function v2.lanePriorityToSchedulerPriority(a1) -- Line: 249
    -- upvalues: ImmediatePriority (val), UserBlockingPriority (val), NormalPriority (val), IdlePriority (val)
    -- upvalues: NoPriority (val), invariant (val)
    if a1 ~= 15 and a1 ~= 14 then
        if a1 ~= 13 and a1 ~= 12 and a1 ~= 11 and a1 ~= 10 then
            if a1 ~= 9 and a1 ~= 8 and a1 ~= 7 and a1 ~= 6 and a1 ~= 4 and a1 ~= 5 then
                if a1 ~= 3 and a1 ~= 2 and a1 ~= 1 then
                    if a1 == 0 then
                        return NoPriority
                    end
                    invariant(false, "Invalid update priority: %s. This is a bug in React.", a1)
                    error("unreachable")
                    return
                end
                return IdlePriority
            end
            return NormalPriority
        end
        return UserBlockingPriority
    end
    return ImmediatePriority
end

local pickArbitraryLaneIndex = nil
local getLowestPriorityLane = nil

function v2.getNextLanes(a1, a2) -- Line: 293
    -- upvalues: DefaultLanePriority (ref), getHighestPriorityLanes (val), getLowestPriorityLane (ref)
    -- upvalues: pickArbitraryLaneIndex (ref)
    local v1
    local pendingLanes = a1.pendingLanes
    if pendingLanes == 0 then
        DefaultLanePriority = 0
        return 0
    end
    local v2 = 0
    local v3 = 0
    local expiredLanes = a1.expiredLanes
    local suspendedLanes = a1.suspendedLanes
    local pingedLanes = a1.pingedLanes
    if expiredLanes == 0 then
        local v4
        local v5 = bit32.band(pendingLanes, 134217727)
        if v5 == 0 then
            v4 = bit32.band(pendingLanes, (bit32.bnot(suspendedLanes)))
            if v4 ~= 0 then
                v2 = getHighestPriorityLanes(v4)
                v3 = DefaultLanePriority
            elseif pingedLanes ~= 0 then
                v2 = getHighestPriorityLanes(pingedLanes)
                v3 = DefaultLanePriority
            end
        else
            v4 = bit32.band(v5, (bit32.bnot(suspendedLanes)))
            if v4 == 0 then
                v1 = bit32.band(v5, pingedLanes)
                if v1 ~= 0 then
                    v2 = getHighestPriorityLanes(v1)
                    v3 = DefaultLanePriority
                end
            else
                v2 = getHighestPriorityLanes(v4)
                v3 = DefaultLanePriority
            end
        end
    else
        v2 = expiredLanes
        DefaultLanePriority = 15
        v3 = 15
    end
    if v2 == 0 then
        return 0
    end
    v2 = bit32.band(pendingLanes, (bit32.lshift(getLowestPriorityLane(v2), 1)) - 1)
    if a2 ~= 0 and a2 ~= v2 and bit32.band(a2, suspendedLanes) == 0 then
        getHighestPriorityLanes(a2)
        if v3 <= DefaultLanePriority then
            return a2
        end
        DefaultLanePriority = v3
    end
    local entangledLanes = a1.entangledLanes
    if entangledLanes ~= 0 then
        local v6, v7
        local entanglements = a1.entanglements
        v1 = bit32.band(v2, entangledLanes)
        while v1 > 0 do
            v6 = pickArbitraryLaneIndex(v1)
            v7 = bit32.lshift(1, v6)
            v2 = bit32.bor(v2, entanglements[v6])
            v1 = bit32.band(v1, (bit32.bnot(v7)))
        end
    end
    return v2
end

function v2.getMostRecentEventTime(a1, a2) -- Line: 412 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2, v3
    local v4 = -1
    local v5 = a2
    while v5 > 0 do
        v1 = pickArbitraryLaneIndex(v5)
        v2 = bit32.lshift(1, v1)
        v3 = a1.eventTimes[v1]
        if v4 < v3 then
            v4 = v3
        end
        v5 = bit32.band(v5, (bit32.bnot(v2)))
    end
    return v4
end

function v2.computeExpirationTime(a1, a2) -- Line: 432
    -- upvalues: getHighestPriorityLanes (val), DefaultLanePriority (ref)
    getHighestPriorityLanes(a1)
    local v1 = DefaultLanePriority
    if v1 >= 10 then
        return a2 + 250
    end
    if v1 >= 6 then
        return a2 + 5000
    end
    return -1
end

function v2.markStarvedLanesAsExpired(a1, a2) -- Line: 462
    -- upvalues: pickArbitraryLaneIndex (ref), getHighestPriorityLanes (val), DefaultLanePriority (ref)
    local v1, v2, v3, v4
    local pendingLanes = a1.pendingLanes
    local suspendedLanes = a1.suspendedLanes
    local pingedLanes = a1.pingedLanes
    local expirationTimes = a1.expirationTimes
    local v5 = pendingLanes
    local v6, v7 = a2, a1
    while v5 > 0 do
        v2 = pickArbitraryLaneIndex(v5)
        v3 = bit32.lshift(1, v2)
        v4 = expirationTimes[v2]
        if v4 ~= -1 then
            if v4 <= v6 then
                v7.expiredLanes = bit32.bor(v7.expiredLanes, v3)
            end
        elseif bit32.band(v3, suspendedLanes) == 0 or bit32.band(v3, pingedLanes) ~= 0 then
            getHighestPriorityLanes(v3)
            v1 = DefaultLanePriority
            expirationTimes[v2] = if not (v1 >= 10) then if not (v1 >= 6) then -1 else v6 + 5000 else v6 + 250
        end
        v5 = bit32.band(v5, (bit32.bnot(v3)))
    end
end

function v2.getHighestPriorityPendingLanes(a1) -- Line: 504 -- upvalues: getHighestPriorityLanes (val)
    return (getHighestPriorityLanes(a1.pendingLanes))
end

function v2.getLanesToRetrySynchronouslyOnError(a1) -- Line: 509
    local v1 = bit32.band(a1.pendingLanes, 3221225471)
    if v1 ~= 0 then
        return v1
    end
    if bit32.band(v1, 1073741824) ~= 0 then
        return 1073741824
    end
    return 0
end

function v2.returnNextLanesPriority() -- Line: 522 -- upvalues: DefaultLanePriority (ref)
    return DefaultLanePriority
end

function v2.includesNonIdleWork(a1) -- Line: 527
    return bit32.band(a1, 134217727) ~= 0
end

function v2.includesOnlyRetries(a1) -- Line: 532
    return bit32.band(a1, 62914560) == a1
end

function v2.includesOnlyTransitions(a1) -- Line: 537
    return bit32.band(a1, 4186112) == a1
end

local pickArbitraryLane = nil

function findUpdateLane(a1, a2) -- Line: 547 -- upvalues: pickArbitraryLane (ref), findUpdateLane (val), invariant (val)
    local v1
    if a1 == 0 then
        invariant(false, "Invalid update priority: %s. This is a bug in React.", a1)
        error("unreachable")
        return
    end
    if a1 == 15 then
        return 1
    end
    if a1 == 14 then
        return 2
    end
    if a1 == 12 then
        v1 = pickArbitraryLane((bit32.band(24, (bit32.bnot(a2)))))
        if v1 == 0 then
            return findUpdateLane(10, a2)
        end
        return v1
    end
    if a1 == 10 then
        v1 = pickArbitraryLane((bit32.band(192, (bit32.bnot(a2)))))
        if v1 == 0 then
            return findUpdateLane(8, a2)
        end
        return v1
    end
    if a1 == 8 then
        v1 = pickArbitraryLane((bit32.band(3584, (bit32.bnot(a2)))))
        if v1 == 0 then
            v1 = pickArbitraryLane((bit32.band(4186112, (bit32.bnot(a2)))))
            if v1 == 0 then
                v1 = pickArbitraryLane(3584)
            end
        end
        return v1
    end
    if a1 ~= 6 and a1 ~= 5 and a1 == 2 then
        v1 = pickArbitraryLane((bit32.band(805306368, (bit32.bnot(a2)))))
        if v1 == 0 then
            v1 = pickArbitraryLane(805306368)
        end
        return v1
    end
    invariant(false, "Invalid update priority: %s. This is a bug in React.", a1)
    error("unreachable")
end

v2.findUpdateLane = findUpdateLane

function v2.findTransitionLane(a1, a2) -- Line: 606 -- upvalues: pickArbitraryLane (ref)
    local v1 = pickArbitraryLane((bit32.band(4186112, (bit32.bnot(a2)))))
    if v1 == 0 then
        v1 = pickArbitraryLane((bit32.band(4186112, (bit32.bnot(a1)))))
        if v1 == 0 then
            v1 = pickArbitraryLane(4186112)
        end
    end
    return v1
end

function v2.findRetryLane(a1) -- Line: 626 -- upvalues: pickArbitraryLane (ref)
    local v1 = pickArbitraryLane((bit32.band(62914560, (bit32.bnot(a1)))))
    if v1 == 0 then
        v1 = pickArbitraryLane(62914560)
    end
    return v1
end

local function getHighestPriorityLane(a1) -- Line: 638
    return (bit32.band(a1, -a1))
end

function getLowestPriorityLane(a1) -- Line: 642
    local v1 = 31 - bit32.countlz(a1)
    if v1 < 0 then
        return 0
    end
    return (bit32.lshift(1, v1))
end

local function getEqualOrHigherPriorityLanes(a1) -- Line: 652 -- upvalues: getLowestPriorityLane (ref)
    return bit32.lshift(getLowestPriorityLane(a1), 1) - 1
end

function pickArbitraryLane(a1) -- Line: 656
    return (bit32.band(a1, -a1))
end

v2.pickArbitraryLane = pickArbitraryLane

function pickArbitraryLaneIndex(a1) -- Line: 665
    return 31 - bit32.countlz(a1)
end

function v2.includesSomeLane(a1, a2) -- Line: 674
    return bit32.band(a1, a2) ~= 0
end

function v2.isSubsetOfLanes(a1, a2) -- Line: 679
    return bit32.band(a1, a2) == a2
end

function v2.mergeLanes(a1, a2) -- Line: 684
    return (bit32.bor(a1, a2))
end

function v2.removeLanes(a1, a2) -- Line: 689
    return (bit32.band(a1, (bit32.bnot(a2))))
end

function v2.laneToLanes(a1) -- Line: 696
    return a1
end

function v2.higherPriorityLane(a1, a2) -- Line: 701
    if a1 ~= 0 and a2 ~= 0 then
        if a1 < a2 then
            return a1
        end
        return a2
    end
    if a1 ~= 0 then
        return a1
    end
    return a2
end

function v2.higherLanePriority(a1, a2) -- Line: 717
    if a1 ~= 0 and a2 < a1 then
        return a1
    end
    return a2
end

function v2.createLaneMap(a1) -- Line: 728
    return {
        [0] = a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
        a1,
    }
end

function v2.markRootUpdated(a1, a2, a3) -- Line: 772 -- types: a3: number
    a1.pendingLanes = bit32.bor(a1.pendingLanes, a2)
    local v1 = a2 - 1
    a1.suspendedLanes = bit32.band(a1.suspendedLanes, v1)
    a1.pingedLanes = bit32.band(a1.pingedLanes, v1)
    a1.eventTimes[31 - bit32.countlz(a2)] = a3
end

function v2.markRootSuspended(a1, a2) -- Line: 801 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2
    a1.suspendedLanes = bit32.bor(a1.suspendedLanes, a2)
    a1.pingedLanes = bit32.band(a1.pingedLanes, (bit32.bnot(a2)))
    local v3 = a2
    while v3 > 0 do
        v1 = pickArbitraryLaneIndex(v3)
        v2 = bit32.lshift(1, v1)
        a1.expirationTimes[v1] = -1
        v3 = bit32.band(v3, (bit32.bnot(v2)))
    end
end

function v2.markRootPinged(a1, a2, a3) -- Line: 819 -- types: a3: number
    a1.pingedLanes = bit32.bor(a1.pingedLanes, (bit32.band(a1.suspendedLanes, a2)))
end

function v2.markRootExpired(a1, a2) -- Line: 825
    a1.expiredLanes = bit32.bor(a1.expiredLanes, (bit32.band(a2, a1.pendingLanes)))
end

function v2.markDiscreteUpdatesExpired(a1) -- Line: 831
    a1.expiredLanes = bit32.bor(a1.expiredLanes, (bit32.band(24, a1.pendingLanes)))
end

function v2.hasDiscreteLanes(a1) -- Line: 837
    return bit32.band(a1, 24) ~= 0
end

function v2.markRootMutableRead(a1, a2) -- Line: 842
    a1.mutableReadLanes = bit32.bor(a1.mutableReadLanes, (bit32.band(a2, a1.pendingLanes)))
end

function v2.markRootFinished(a1, a2) -- Line: 848 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2
    local v3 = bit32.band(a1.pendingLanes, (bit32.bnot(a2)))
    a1.pendingLanes = a2
    a1.suspendedLanes = 0
    a1.pingedLanes = 0
    a1.expiredLanes = bit32.band(a1.expiredLanes, a2)
    a1.mutableReadLanes = bit32.band(a1.mutableReadLanes, a2)
    a1.entangledLanes = bit32.band(a1.entangledLanes, a2)
    local v4 = v3
    while v4 > 0 do
        v1 = pickArbitraryLaneIndex(v4)
        v2 = bit32.lshift(1, v1)
        a1.entanglements[v1] = 0
        a1.eventTimes[v1] = -1
        a1.expirationTimes[v1] = -1
        v4 = bit32.band(v4, (bit32.bnot(v2)))
    end
end

function v2.markRootEntangled(a1, a2) -- Line: 881 -- upvalues: pickArbitraryLaneIndex (ref)
    local v1, v2
    a1.entangledLanes = bit32.bor(a1.entangledLanes, a2)
    local entanglements = a1.entanglements
    local v3 = a2
    while v3 > 0 do
        v1 = pickArbitraryLaneIndex(v3)
        v2 = bit32.lshift(1, v1)
        entanglements[v1] = (bit32.bor(entanglements[v1], a2))
        v3 = bit32.band(v3, (bit32.bnot(v2)))
    end
end

function v2.getBumpedLaneForHydration(a1, a2) -- Line: 897
    -- upvalues: getHighestPriorityLanes (val), DefaultLanePriority (ref), invariant (val)
    getHighestPriorityLanes(a2)
    local v1 = DefaultLanePriority
    local v2 = nil
    if v1 == 15 or v1 == 14 then
        v2 = 0
    elseif v1 == 13 or v1 == 12 then
        v2 = 4
    elseif v1 == 11 or v1 == 10 then
        v2 = 32
    elseif v1 == 9 or v1 == 8 then
        v2 = 256
    elseif v1 == 7 or v1 == 6 or v1 == 5 then
        v2 = 4096
    elseif v1 == 4 then
        v2 = 67108864
    elseif v1 == 3 or v1 == 2 then
        v2 = 134217728
    elseif v1 == 1 then
        v2 = 0
    elseif v1 ~= 0 then
        invariant(false, "Invalid lane: %s. This is a bug in React.", (tostring(v2)))
    else
        v2 = 0
    end
    if bit32.band(v2, (bit32.bor(a1.suspendedLanes, a2))) ~= 0 then
        return 0
    end
    return v2
end

return v2