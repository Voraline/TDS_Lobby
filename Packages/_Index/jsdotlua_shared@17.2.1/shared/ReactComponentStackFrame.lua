-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactComponentStackFrame
-- Decompile time: 5.14 ms

local describeUnknownElementTypeFrameInDEV
require(script.Parent:WaitForChild("ReactElementType"))
require(script.Parent:WaitForChild("flowtypes.roblox"))
local ReactSymbols = require(script.Parent:WaitForChild("ReactSymbols"))
local REACT_SUSPENSE_TYPE = ReactSymbols.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = ReactSymbols.REACT_SUSPENSE_LIST_TYPE
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local v1 = require(script.Parent:WaitForChild("ConsolePatchingDev.roblox"))
local disableLogs = v1.disableLogs
local reenableLogs = v1.reenableLogs
local ReactCurrentDispatcher = require(script.Parent:WaitForChild("ReactSharedInternals")).ReactCurrentDispatcher
local describeComponentFrame = nil

local function describeOwner(a1) -- Line: 57
    if type(a1) == "function" then
        return debug.info(a1, "n")
    end
    if type(a1) == "table" then
        return (tostring(a1))
    end
    return nil
end

local function describeBuiltInComponentFrame(a1, a2, a3) -- Line: 66
    -- upvalues: describeComponentFrame (ref)
    local v1 = nil
    if _G.__DEV__ and a3 then
        v1 = if type(a3) ~= "function" then if type(a3) ~= "table" then nil else tostring(a3) else debug.info(a3, "n")
    end
    return describeComponentFrame(a1, a2, v1)
end

local u53 = false
local u61 = nil
if _G.__DEV__ then
    u61 = setmetatable({}, {__mode = "k"})
end

function describeComponentFrame(a1, a2, a3) -- Line: 283 -- types: a1: string?, a3: string?
    local v1 = ""
    if not _G.__DEV__ then
        if a3 then
            v1 = " (created by " .. a3 .. ")"
        end
    elseif a2 then
        local fileName = a2.fileName
        local v2 = string.gsub(fileName, "^(.*)[\\/]", "")
        if string.match(v2, "^init%.") then
            local v3 = string.match(fileName, "^(.*)[\\/]")
            if v3 and #v3 ~= 0 then
                v2 = string.gsub(v3, "^(.*)[\\/]", "") .. "/" .. v2
            end
        end
        v1 = " (at " .. v2 .. ":" .. a2.lineNumber .. ")"
    elseif a3 then
        v1 = " (created by " .. a3 .. ")"
    end
    return "\n    in " .. (a1 or "Unknown") .. v1
end

local function describeClassComponentFrame(a1, a2, a3) -- Line: 316 -- upvalues: describeComponentFrame (ref)
    local v1 = tostring(a1)
    local v2 = nil
    if _G.__DEV__ and a3 then
        v2 = if type(a3) ~= "function" then if type(a3) ~= "table" then nil else tostring(a3) else debug.info(a3, "n")
    end
    return describeComponentFrame(v1, a2, v2)
end

local function describeFunctionComponentFrame(a1, a2, a3) -- Line: 340
    -- upvalues: describeComponentFrame (ref)
    if not a1 then
        return ""
    end
    local v1 = if type(a1) ~= "function" then tostring(a1) else debug.info(a1, "n")
    local v2 = nil
    if _G.__DEV__ and a3 then
        v2 = if type(a3) ~= "function" then if type(a3) ~= "table" then nil else tostring(a3) else debug.info(a3, "n")
    end
    return describeComponentFrame(v1, a2, v2)
end

function describeUnknownElementTypeFrameInDEV(a1, a2, a3) -- Line: 387
    -- upvalues: describeClassComponentFrame (val), describeFunctionComponentFrame (ref)
    -- upvalues: describeBuiltInComponentFrame (val), REACT_SUSPENSE_TYPE (val), REACT_SUSPENSE_LIST_TYPE (val)
    -- upvalues: REACT_FORWARD_REF_TYPE (val), REACT_MEMO_TYPE (val), describeUnknownElementTypeFrameInDEV (val)
    -- upvalues: REACT_BLOCK_TYPE (val), REACT_LAZY_TYPE (val)
    if not _G.__DEV__ or a1 == nil then
        return ""
    end
    if type(a1) == "table" and type(a1.__ctor) == "function" then
        return describeClassComponentFrame(a1, a2, a3)
    end
    if type(a1) == "function" then
        return describeFunctionComponentFrame(a1, a2, a3)
    end
    if type(a1) == "string" then
        return describeBuiltInComponentFrame(a1, a2, a3)
    end
    if a1 == REACT_SUSPENSE_TYPE then
        return describeBuiltInComponentFrame("Suspense", a2, a3)
    end
    if a1 == REACT_SUSPENSE_LIST_TYPE then
        return describeBuiltInComponentFrame("SuspenseList", a2, a3)
    end
    if type(a1) == "table" then
        local v1 = a1["$$typeof"]
        if v1 == REACT_FORWARD_REF_TYPE then
            return describeFunctionComponentFrame(a1.render, a2, a3)
        end
        if v1 == REACT_MEMO_TYPE then
            return describeUnknownElementTypeFrameInDEV(a1.type, a2, a3)
        end
        if v1 == REACT_BLOCK_TYPE then
            return describeFunctionComponentFrame(a1._render, a2, a3)
        end
        if v1 == REACT_LAZY_TYPE then
            local _payload = a1._payload
            local _init = a1._init
            local success, result = pcall(function() -- Line: 446
                -- upvalues: describeUnknownElementTypeFrameInDEV (upval), _init (val), _payload (val), a2 (val)
                -- upvalues: a3 (val)
                describeUnknownElementTypeFrameInDEV(_init(_payload), a2, a3)
            end)
            if success then
                return result
            end
        end
    end
    return ""
end

return {
    describeComponentFrame = describeComponentFrame,
    describeBuiltInComponentFrame = describeBuiltInComponentFrame,
    describeNativeComponentFrame = function(a1, a2) -- Line: 113
        -- upvalues: u53 (ref), u61 (ref), ReactCurrentDispatcher (val), disableLogs (val), reenableLogs (val)
        -- upvalues: describeComponentFrame (ref)
        if a1 and not u53 then
            local result, v1, v2
            if _G.__DEV__ then
                local v3 = u61[a1]
                if v3 ~= nil then
                    return v3
                end
            end
            local u7 = nil
            u53 = true
            local current = nil
            if _G.__DEV__ then
                current = ReactCurrentDispatcher.current
                ReactCurrentDispatcher.current = nil
                disableLogs()
            end
            local u18 = nil
            _, result = xpcall(function() -- Line: 153 -- upvalues: a2 (val), u18 (ref), u7 (ref), a1 (val)
                local result
                if a2 then
                    return
                end
                _, result = pcall(function() -- Line: 159 -- upvalues: u18 (upval)
                    u18 = debug.traceback()
                    error({stack = u18})
                end)
                u7 = result
                a1()
            end, function(a1) -- Line: 169 -- upvalues: u18 (ref)
                return {message = a1, stack = u18}
            end)
            local v4 = nil
            if result and u7 and type(result.stack) == "string" then
                local v5
                v1 = string.split(result.stack, "\n")
                v2 = string.split(u7.stack, "\n")
                local v6 = #v1 - 1
                local v7 = #v2 - 1
                while v6 >= 2 do
                    if not (v7 >= 0) or v1[v6] == v2[v7] then
                        break
                    end
                    v7 = v7 - 1
                end
                while v6 >= 3 do
                    if not (v7 >= 1) then
                        break
                    end
                    v6 = v6 - 1
                    v7 = v7 - 1
                    if v1[v6] ~= v2[v7] then
                        if v6 == 1 and v7 == 1 then
                            break
                        end
                        repeat
                            v6 = v6 - 1
                            v7 = v7 - 1
                            if v7 < 0 or v1[v6] ~= v2[v7] then
                                v5 = "\n" .. "    in " .. v1[v6]
                                if _G.__DEV__ then
                                    u61[a1] = v5
                                end
                                v4 = v5
                            end
                        until not (v6 >= 3) or not (v7 >= 1)
                        break
                    end
                end
            end
            u53 = false
            if _G.__DEV__ then
                ReactCurrentDispatcher.current = current
                reenableLogs()
            end
            if v4 ~= nil then
                return v4
            end
            v1 = if type(a1) ~= "function" then if type(a1) ~= "table" then "" else tostring(a1) else debug.info(a1, "n")
            v2 = ""
            if v1 ~= nil and v1 ~= "" then
                local __DEV__ = _G.__DEV__
                v2 = describeComponentFrame(v1, nil, nil)
            end
            if _G.__DEV__ then
                u61[a1] = v2
            end
            return v2
        end
        return ""
    end,
    describeClassComponentFrame = describeClassComponentFrame,
    describeFunctionComponentFrame = describeFunctionComponentFrame,
    describeUnknownElementTypeFrameInDEV = describeUnknownElementTypeFrameInDEV,
}