-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.checkPropTypes
-- Decompile time: 5.40 ms

local Error = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Error
local console = require(script.Parent:WaitForChild("console"))
local u18 = {}
local describeUnknownElementTypeFrameInDEV = require(script.Parent:WaitForChild("ReactComponentStackFrame")).describeUnknownElementTypeFrameInDEV
local ReactSharedInternals = require(script.Parent:WaitForChild("ReactSharedInternals"))
local describeError = (require((script.Parent:WaitForChild("ErrorHandling.roblox")))).describeError
local ReactDebugCurrentFrame = ReactSharedInternals.ReactDebugCurrentFrame

local function setCurrentlyValidatingElement(a1) -- Line: 32
    -- upvalues: describeUnknownElementTypeFrameInDEV (val), ReactDebugCurrentFrame (val)
    if _G.__DEV__ then
        if a1 then
            local _owner = a1._owner
            ReactDebugCurrentFrame.setExtraStackFrame((describeUnknownElementTypeFrameInDEV(a1.type, a1._source, if _owner == nil then nil else _owner.type)))
            return
        end
        ReactDebugCurrentFrame.setExtraStackFrame(nil)
    end
end

return function(a1, a2, a3, a4, a5, a6) -- Line: 49
    -- upvalues: console (val), Error (val), describeError (val), describeUnknownElementTypeFrameInDEV (val)
    -- upvalues: ReactDebugCurrentFrame (val), u18 (val)
    local _owner, _owner_2, result, v1, v2, v3, v4, v5
    if _G.__DEV__ then
        if a1 and a2 then
            console.warn("You've defined both propTypes and validateProps on " .. (a5 or "a component"))
        end
        if a2 then
            if typeof(a2) == "function" then
                v3, v4 = a2(a3)
                if not v3 then
                    error((string.format(
                        "validateProps failed on a %s type in %s: %s",
                        a4,
                        a5 or "<UNKNOWN Component>",
                        (tostring(v4 or "<Validator function did not supply a message>"))
                    )))
                end
            else
                console.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(
                    typeof(a2),
                    a5 or ""
                ))
            end
        end
        if a1 then
            assert(typeof(a1) == "table", "propTypes needs to be a table")
            v4 = nil
            v5 = nil
            for i, j in a1, v4, v5 do
                _, result = xpcall(function() -- Line: 113 -- upvalues: a1 (val), i (val), Error (upval), a5 (val), a4 (val), a3 (val)
                    if typeof(a1[i]) ~= "function" then
                        local v1 = Error.new((a5 or "React class") .. ": " .. a4 .. " type `" .. i .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. (typeof(a1[i])) .. "`.This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.")
                        v1.name = "Invariant Violation"
                        error(v1)
                    end
                    return a1[i](a3, i, a5, a4, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED")
                end, describeError)
                v1 = typeof(result) == "table"
                if result ~= nil and not v1 then
                    if _G.__DEV__ then
                        if not v2 then
                            ReactDebugCurrentFrame.setExtraStackFrame(nil)
                        else
                            _owner = v2._owner
                            ReactDebugCurrentFrame.setExtraStackFrame((describeUnknownElementTypeFrameInDEV(v2.type, v2._source, if _owner == nil then nil else _owner.type)))
                        end
                    end
                    console.error(string.format(
                        "%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).",
                        a5 or "React class",
                        a4,
                        i,
                        (typeof(result))
                    ))
                    if _G.__DEV__ then
                        ReactDebugCurrentFrame.setExtraStackFrame(nil)
                    end
                end
                if v1 and u18[result.message] == nil then
                    u18[(tostring(result.message))] = true
                    if _G.__DEV__ then
                        if not v2 then
                            ReactDebugCurrentFrame.setExtraStackFrame(nil)
                        else
                            _owner_2 = v2._owner
                            ReactDebugCurrentFrame.setExtraStackFrame((describeUnknownElementTypeFrameInDEV(v2.type, v2._source, if _owner_2 == nil then nil else _owner_2.type)))
                        end
                    end
                    console.warn(string.format("Failed %s type: %s", a4, (tostring(result.message))))
                    if _G.__DEV__ then
                        ReactDebugCurrentFrame.setExtraStackFrame(nil)
                    end
                end
            end
        end
    elseif _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if a1 and a2 then
            console.warn("You've defined both propTypes and validateProps on " .. (a5 or "a component"))
        end
        if a2 then
            if typeof(a2) == "function" then
                v3, v4 = a2(a3)
                if not v3 then
                    error((string.format(
                        "validateProps failed on a %s type in %s: %s",
                        a4,
                        a5 or "<UNKNOWN Component>",
                        (tostring(v4 or "<Validator function did not supply a message>"))
                    )))
                end
            else
                console.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(
                    typeof(a2),
                    a5 or ""
                ))
            end
        end
        if a1 then
            assert(typeof(a1) == "table", "propTypes needs to be a table")
            v4 = nil
            v5 = nil
            for k, n in a1, v4, v5 do
                _, result = xpcall(function() -- Line: 113 -- upvalues: a1 (val), k (val), Error (upval), a5 (val), a4 (val), a3 (val)
                    if typeof(a1[k]) ~= "function" then
                        local v1 = Error.new((a5 or "React class") .. ": " .. a4 .. " type `" .. k .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. (typeof(a1[k])) .. "`.This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.")
                        v1.name = "Invariant Violation"
                        error(v1)
                    end
                    return a1[k](a3, k, a5, a4, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED")
                end, describeError)
                v1 = typeof(result) == "table"
                if result ~= nil and not v1 then
                    if _G.__DEV__ then
                        if not v2 then
                            ReactDebugCurrentFrame.setExtraStackFrame(nil)
                        else
                            _owner = v2._owner
                            ReactDebugCurrentFrame.setExtraStackFrame((describeUnknownElementTypeFrameInDEV(v2.type, v2._source, if _owner == nil then nil else _owner.type)))
                        end
                    end
                    console.error(string.format(
                        "%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).",
                        a5 or "React class",
                        a4,
                        k,
                        (typeof(result))
                    ))
                    if _G.__DEV__ then
                        ReactDebugCurrentFrame.setExtraStackFrame(nil)
                    end
                end
                if v1 and u18[result.message] == nil then
                    u18[(tostring(result.message))] = true
                    if _G.__DEV__ then
                        if not v2 then
                            ReactDebugCurrentFrame.setExtraStackFrame(nil)
                        else
                            _owner_2 = v2._owner
                            ReactDebugCurrentFrame.setExtraStackFrame((describeUnknownElementTypeFrameInDEV(v2.type, v2._source, if _owner_2 == nil then nil else _owner_2.type)))
                        end
                    end
                    console.warn(string.format("Failed %s type: %s", a4, (tostring(result.message))))
                    if _G.__DEV__ then
                        ReactDebugCurrentFrame.setExtraStackFrame(nil)
                    end
                end
            end
        end
    end
end