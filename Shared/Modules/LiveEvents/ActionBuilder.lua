-- Script path: ReplicatedStorage.Shared.Modules.LiveEvents.ActionBuilder
-- Decompile time: 1.99 ms

require(script.Parent.Types)
local u5 = {}
local u6 = {
    contexts = true,
    conflicts = true,
    chaos = true,
    destructive = true,
    confirmation = true,
    defaultTarget = true,
    stops = true,
    replaces = true,
    finishOnApply = true,
    lifetime = true,
    rehearsable = true,
    repeatable = true,
    allowConcurrent = true,
    version = true,
}
local u7 = {Lobby = true, Game = true}

function u5.number(a1, a2, a3, a4, a5, a6) -- Line: 27
    -- upvalues: 
    return {
        kind = "number",
        key = a1,
        label = a2,
        default = a3,
        min = a4,
        max = a5,
        integer = a6,
    }
end

function u5.duration(a1, a2) -- Line: 47 -- upvalues: u5 (val) -- types: a1: number?, a2: boolean?
    return u5.number("duration", "Duration (seconds)", a1 or 30, 1, 120, a2)
end

function u5.select(a1, a2, a3, a4, a5) -- Line: 52 -- types: a1: string, a2: string, a3: table, a4: string, a5: string?
    return {
        kind = "select",
        key = a1,
        label = a2,
        options = a3,
        default = a4,
        preview = a5,
    }
end

function u5.toggle(a1, a2, a3) -- Line: 69 -- types: a1: string, a2: string, a3: boolean
    return {kind = "boolean", key = a1, label = a2, default = a3}
end

function u5.text(a1, a2, a3, a4) -- Line: 74 -- types: a1: string, a2: string, a3: string, a4: number
    return {
        kind = "text",
        key = a1,
        label = a2,
        default = a3,
        max = a4,
    }
end

function u5.content(a1, a2, a3, a4) -- Line: 79 -- types: a1: string, a2: string, a3: string, a4: number?
    return {
        kind = "content",
        key = a1,
        label = a2,
        default = a3,
        max = a4 or 80,
    }
end

function u5.seconds(a1) -- Line: 89 -- types: a1: number
    return function() -- Line: 90 -- upvalues: a1 (val)
        return a1
    end
end

function u5.untilRunEnd() -- Line: 95
    return (1 / 0)
end

function u5.action(a1, a2, a3, a4, a5, a6) -- Line: 99
    -- upvalues: u6 (val), u7 (val)
    local v1 = a6 or {}
    for i in v1 do
        assert(u6[i], (("Live event action \"%*\" has unknown option \"%*\""):format(a1, i)))
    end
    local v2 = true
    if v1.lifetime ~= nil then
        v2 = type(v1.lifetime) == "function"
    end
    assert(v2, (("Live event action \"%*\" needs a lifetime function, such as Action.seconds(10)"):format(a1)))
    local contexts = v1.contexts or {"Game"}
    assert(#contexts > 0, (("Live event action \"%*\" needs at least one context"):format(a1)))
    for j, k in contexts do
        assert(u7[k], (("Live event action \"%*\" has unknown context \"%*\""):format(a1, k)))
    end
    v2 = nil
    local v3 = {}
    for n, m in a5 do
        assert(not v3[m.key], (("Live event action \"%*\" declares field \"%*\" twice"):format(a1, m.key)))
        v3[m.key] = true
        if m.key == "duration" then
            v2 = "duration"
        end
    end
    local v4 = true
    if v2 == nil then
        v4 = true
        if v1.finishOnApply == nil then
            v4 = v1.lifetime ~= nil
        end
    end
    assert(
        v4,
        (("Live event action \"%*\" has no duration field. Set finishOnApply = true if it ends once"):format(a1)) .. " applied, or lifetime if it keeps running."
    )
    local v5 = {
        id = a1,
        version = v1.version or 1,
        label = a2,
        description = a3,
        category = a4,
        contexts = contexts,
        fields = a5,
        durationField = v2,
        lifetime = v1.lifetime,
    }
    local conflicts = v1.conflicts or {}
    v5.conflictGroups = conflicts
    v5.chaosEligible = v1.chaos == true
    v5.destructive = v1.destructive == true
    v5.confirmation = v1.confirmation
    v5.defaultTarget = v1.defaultTarget
    v5.stops = v1.stops
    v5.replaces = v1.replaces
    v5.finishOnApply = v1.finishOnApply
    v5.rehearsable = v1.rehearsable ~= false
    v5.repeatable = v1.repeatable
    v5.allowConcurrent = v1.allowConcurrent
    return v5
end

return u5