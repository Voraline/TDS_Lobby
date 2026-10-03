-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberComponentStack
-- Decompile time: 2.06 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local HostComponent = ReactWorkTags.HostComponent
local LazyComponent = ReactWorkTags.LazyComponent
local SuspenseComponent = ReactWorkTags.SuspenseComponent
local SuspenseListComponent = ReactWorkTags.SuspenseListComponent
local FunctionComponent = ReactWorkTags.FunctionComponent
local IndeterminateComponent = ReactWorkTags.IndeterminateComponent
local ForwardRef = ReactWorkTags.ForwardRef
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local ClassComponent = ReactWorkTags.ClassComponent
local ReactComponentStackFrame = require(script.Parent.Parent:WaitForChild("shared")).ReactComponentStackFrame
local describeBuiltInComponentFrame = ReactComponentStackFrame.describeBuiltInComponentFrame
local describeFunctionComponentFrame = ReactComponentStackFrame.describeFunctionComponentFrame
local describeClassComponentFrame = ReactComponentStackFrame.describeClassComponentFrame

local function describeFiber(a1) -- Line: 37
    -- upvalues: HostComponent (val), describeBuiltInComponentFrame (val), LazyComponent (val), SuspenseComponent (val)
    -- upvalues: SuspenseListComponent (val), FunctionComponent (val), IndeterminateComponent (val)
    -- upvalues: SimpleMemoComponent (val), describeFunctionComponentFrame (val), ForwardRef (val), ClassComponent (val)
    -- upvalues: describeClassComponentFrame (val)
    local type = nil
    if _G.__DEV__ then
        local _debugOwner = a1._debugOwner
        if _debugOwner then
            type = _debugOwner.type
        end
    end
    local _debugSource = nil
    if _G.__DEV__ then
        _debugSource = a1._debugSource
    end
    if a1.tag == HostComponent then
        return describeBuiltInComponentFrame(a1.type, _debugSource, type)
    end
    if a1.tag == LazyComponent then
        return describeBuiltInComponentFrame("Lazy", _debugSource, type)
    end
    if a1.tag == SuspenseComponent then
        return describeBuiltInComponentFrame("Suspense", _debugSource, type)
    end
    if a1.tag == SuspenseListComponent then
        return describeBuiltInComponentFrame("SuspenseList", _debugSource, type)
    end
    if a1.tag ~= FunctionComponent and a1.tag ~= IndeterminateComponent and a1.tag ~= SimpleMemoComponent then
        if a1.tag == ForwardRef then
            return describeFunctionComponentFrame(a1.type.render, _debugSource, type)
        end
        if a1.tag == ClassComponent then
            return describeClassComponentFrame(a1.type, _debugSource, type)
        end
        return ""
    end
    return describeFunctionComponentFrame(a1.type, _debugSource, type)
end

return {
    getStackByFiberInDevAndProd = function(a1) -- Line: 75 -- upvalues: describeFiber (val)
        local success, result = pcall(function() -- Line: 76 -- upvalues: a1 (val), describeFiber (upval)
            local v1 = ""
            local return_ = a1
            repeat
                v1 = v1 .. describeFiber(return_)
                return_ = return_.return_
            until return_ == nil
            return v1
        end)
        if success then
            return result
        end
        if typeof(result) == "table" and result.message and result.stack then
            return "\nError generating stack: " .. result.message .. "\n" .. tostring(result.stack)
        end
        return "\nError generating stack: " .. tostring(result)
    end,
}