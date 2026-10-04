-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHostContext.new
-- Decompile time: 1.57 ms

require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local ReactFiberHostConfig = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
local getChildHostContext = ReactFiberHostConfig.getChildHostContext
local getRootHostContext = ReactFiberHostConfig.getRootHostContext
local createCursor = v1.createCursor
local push = v1.push
local pop = v1.pop
local u29 = {}
local u32 = createCursor(u29)
local u35 = createCursor(u29)
local u38 = createCursor(u29)

function requiredContext(a1) -- Line: 40
    return a1
end

function getRootHostContainer() -- Line: 50 -- upvalues: u38 (val)
    return u38.current
end

function pushHostContainer(a1, a2) -- Line: 57
    -- upvalues: push (val), u38 (val), u35 (val), u32 (val), u29 (val), getRootHostContext (val), pop (val)
    push(u38, a2, a1)
    push(u35, a1, a1)
    push(u32, u29, a1)
    local v1 = getRootHostContext(a2)
    pop(u32, a1)
    push(u32, v1, a1)
end

function popHostContainer(a1) -- Line: 77 -- upvalues: pop (val), u32 (val), u35 (val), u38 (val)
    pop(u32, a1)
    pop(u35, a1)
    pop(u38, a1)
end

function getHostContext() -- Line: 83 -- upvalues: u32 (val)
    return u32.current
end

function pushHostContext(a1) -- Line: 90
    -- upvalues: u38 (val), u32 (val), getChildHostContext (val), push (val), u35 (val)
    local v1 = requiredContext(u38.current)
    local v2 = requiredContext(u32.current)
    local v3 = getChildHostContext(v2, a1.type, v1)
    if v2 == v3 then
        return
    end
    push(u35, a1, a1)
    push(u32, v3, a1)
end

function popHostContext(a1) -- Line: 106 -- upvalues: u35 (val), pop (val), u32 (val)
    if u35.current ~= a1 then
        return
    end
    pop(u32, a1)
    pop(u35, a1)
end

return {
    getHostContext = getHostContext,
    getRootHostContainer = getRootHostContainer,
    popHostContainer = popHostContainer,
    popHostContext = popHostContext,
    pushHostContainer = pushHostContainer,
    pushHostContext = pushHostContext,
}