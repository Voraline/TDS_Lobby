-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberErrorLogger
-- Decompile time: 1.46 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local inspect = v1.util.inspect
local setTimeout = v1.setTimeout
local shared = require(script.Parent.Parent:WaitForChild("shared"))
local console = shared.console
local errorToString = shared.errorToString
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactCapturedValue"))
local showErrorDialog = require(script.Parent:WaitForChild("ReactFiberErrorDialog")).showErrorDialog
local ClassComponent = require(script.Parent:WaitForChild("ReactWorkTags")).ClassComponent
local getComponentName = (require((script.Parent.Parent:WaitForChild("shared")))).getComponentName
return {
    logCapturedError = function(a1, a2) -- Line: 32
        -- upvalues: showErrorDialog (val), ClassComponent (val), console (val), getComponentName (val), inspect (val)
        -- upvalues: setTimeout (val), errorToString (val)
        local success, result = pcall(function() -- Line: 33
            -- upvalues: showErrorDialog (upval), a1 (val), a2 (val), ClassComponent (upval), console (upval)
            -- upvalues: getComponentName (upval), inspect (upval)
            if showErrorDialog(a1, a2) == false then
                return nil
            end
            local value = a2.value
            if not _G.__DEV__ then
                console.error(inspect(value))
                return nil
            end
            local source = a2.source
            local stack = a2.stack
            if value ~= nil and value._suppressLogging then
                if a1.tag == ClassComponent then
                    return
                end
                console.error(value)
            end
            local v1 = if source == nil then nil else getComponentName(source.type)
            local v2 = if not v1 then "The above error occurred in one of your React components:" else "The above error occurred in the <" .. (tostring(v1)) .. "> component:"
            local v3 = getComponentName(a1.type)
            local v4 = v2 .. "\n" .. (stack or "") .. "\n\n" .. (if not v3 then "Consider adding an error boundary to your tree to customize error handling behavior.\nVisit https://reactjs.org/link/error-boundaries to learn more about error boundaries." else "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. v3 .. ".")
            console.error(v4)
            return nil
        end)
        if not success then
            warn("failed to error with error: " .. inspect(result))
            setTimeout(function() -- Line: 124 -- upvalues: errorToString (upval), result (val)
                error(errorToString(result))
            end)
        end
    end,
}