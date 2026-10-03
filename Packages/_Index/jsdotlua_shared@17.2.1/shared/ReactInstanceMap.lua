-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactInstanceMap
-- Decompile time: 2.46 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Error = v1.Error
local inspect = v1.util.inspect
local getComponentName = require(script.Parent:WaitForChild("getComponentName"))
local v2 = {}

local function isValidFiber(a1) -- Line: 33
    local v1 = false
    if a1.tag ~= nil then
        v1 = false
        if a1.subtreeFlags ~= nil then
            v1 = false
            if a1.lanes ~= nil then
                v1 = a1.childLanes ~= nil
            end
        end
    end
    return v1
end

function v2.remove(a1) -- Line: 40
    a1._reactInternals = nil
end

function v2.get(a1) -- Line: 44 -- upvalues: Error (val), getComponentName (val), inspect (val)
    local _reactInternals = a1._reactInternals
    local v1 = false
    if _reactInternals.tag ~= nil then
        v1 = false
        if _reactInternals.subtreeFlags ~= nil then
            v1 = false
            if _reactInternals.lanes ~= nil then
                v1 = _reactInternals.childLanes ~= nil
            end
        end
    end
    if not v1 then
        error(Error.new("invalid fiber in " .. (getComponentName(a1) or "UNNAMED Component") .. " during get from ReactInstanceMap! " .. inspect(_reactInternals)))
        return _reactInternals
    end
    if _reactInternals.alternate ~= nil then
        local alternate = _reactInternals.alternate
        v1 = false
        if alternate.tag ~= nil then
            v1 = false
            if alternate.subtreeFlags ~= nil then
                v1 = false
                if alternate.lanes ~= nil then
                    v1 = alternate.childLanes ~= nil
                end
            end
        end
        if not v1 then
            v1 = error
            local new_2 = Error.new
            local v2 = getComponentName(a1) or "UNNAMED Component"
            v1(new_2("invalid alternate fiber (" .. (getComponentName(a1) or "UNNAMED alternate") .. ") in " .. v2 .. " during get from ReactInstanceMap! " .. inspect(_reactInternals.alternate)))
        end
    end
    return _reactInternals
end

function v2.has(a1) -- Line: 74
    return a1._reactInternals ~= nil
end

function v2.set(a1, a2) -- Line: 78 -- upvalues: getComponentName (val), inspect (val), Error (val)
    local alternate, v1, v2
    local return_ = a2
    local v3, v4 = a1, a2
    while return_ ~= nil do
        v2 = false
        if return_.tag ~= nil then
            v2 = false
            if return_.subtreeFlags ~= nil then
                v2 = false
                if return_.lanes ~= nil then
                    v2 = return_.childLanes ~= nil
                end
            end
        end
        if not v2 then
            v1 = "invalid fiber in " .. (getComponentName(v3) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. (inspect(return_)) .. "\n"
            if v4 ~= return_ then
                v1 = v1 .. " (from original fiber " .. (getComponentName(v3) or "UNNAMED Component") .. ")"
            end
            error(Error.new(v1))
        elseif return_.alternate ~= nil then
            alternate = return_.alternate
            v2 = false
            if alternate.tag ~= nil then
                v2 = false
                if alternate.subtreeFlags ~= nil then
                    v2 = false
                    if alternate.lanes ~= nil then
                        v2 = alternate.childLanes ~= nil
                    end
                end
            end
            if not v2 then
                v1 = "invalid alternate fiber (" .. (getComponentName(v3) or "UNNAMED alternate") .. ") in " .. (getComponentName(v3) or "UNNAMED Component") .. " being set in ReactInstanceMap! " .. (inspect(return_.alternate)) .. "\n"
                if v4 ~= return_ then
                    v1 = v1 .. " (from original fiber " .. (getComponentName(v3) or "UNNAMED Component") .. ")"
                end
                error(Error.new(v1))
            end
        end
        return_ = return_.return_
    end
    v3._reactInternals = v4
end

return v2