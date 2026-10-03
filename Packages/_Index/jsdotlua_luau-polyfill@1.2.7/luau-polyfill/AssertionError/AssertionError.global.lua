-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.AssertionError.AssertionError.global
-- Decompile time: 35.40 ms

local collections = require(script.Parent.Parent.Parent:WaitForChild("collections"))
local Array = collections.Array
local Object = collections.Object
local boolean = require(script.Parent.Parent.Parent:WaitForChild("boolean"))
local string = require(script.Parent.Parent.Parent:WaitForChild("string"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local inspect = collections.inspect
local Error = require(script.Parent.Parent:WaitForChild("Error"))
local u61 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
local u62 = {}
u62.stderr = {
    isTTY = false,
    columns = 0,
    hasColors = function(...) -- Line: 45
        return true
    end,
}

function ErrorCaptureStackTrace(a1, ...) -- Line: 52 -- upvalues: Error (val)
    Error.captureStackTrace(a1, ...)
end

local function removeColors(a1) -- Line: 57
    return a1
end

local u67 = ""
local u68 = ""
local u69 = ""
local u70 = ""
local u71 = {
    deepStrictEqual = "Expected values to be strictly deep-equal:",
    strictEqual = "Expected values to be strictly equal:",
    strictEqualObject = "Expected \"actual\" to be reference-equal to \"expected\":",
    deepEqual = "Expected values to be loosely deep-equal:",
    notDeepStrictEqual = "Expected \"actual\" not to be strictly deep-equal to:",
    notStrictEqual = "Expected \"actual\" to be strictly unequal to:",
    notStrictEqualObject = "Expected \"actual\" not to be reference-equal to \"expected\":",
    notDeepEqual = "Expected \"actual\" not to be loosely deep-equal to:",
    notIdentical = "Values have same structure but are not reference-equal:",
    notDeepEqualUnequal = "Expected values not to be loosely deep-equal:",
}

local function copyError(a1) -- Line: 85 -- upvalues: Object (val)
    local v1 = {}
    for i, j in (Object.keys(a1)) do
        v1[j] = a1[j]
    end
    v1.message = a1.message
    return v1
end

local function inspectValue(a1) -- Line: 96 -- upvalues: inspect (val)
    return inspect(a1, {
        compact = false,
        customInspect = false,
        depth = 1000,
        maxArrayLength = (1 / 0),
        showHidden = false,
        showProxy = false,
        sorted = true,
        getters = true,
    })
end

local function createErrDiff(a1, a2, a3) -- Line: 111
    -- upvalues: inspect (val), string (val), boolean (val), u71 (val), u62 (val), u67 (ref), u70 (ref), Array (val)
    -- upvalues: u68 (ref), u69 (ref)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
    local v14 = ""
    local v15 = ""
    local v16 = ""
    local v17 = false
    local v18 = inspect(a1, {
        compact = false,
        customInspect = false,
        depth = 1000,
        maxArrayLength = (1 / 0),
        showHidden = false,
        showProxy = false,
        sorted = true,
        getters = true,
    })
    local v19 = string.split(v18, "\n")
    local v20 = string.split(inspect(a2, {
        compact = false,
        customInspect = false,
        depth = 1000,
        maxArrayLength = (1 / 0),
        showHidden = false,
        showProxy = false,
        sorted = true,
        getters = true,
    }), "\n")
    local v21 = 0
    local v22 = ""
    if a3 == "strictEqual" then
        if typeof(a1) ~= "table" or a1 == nil or typeof(a2) ~= "table" then
            if typeof(a1) == "function" and typeof(a2) == "function" then
                a3 = "strictEqualObject"
            end
        elseif a2 ~= nil or typeof(a1) == "function" and typeof(a2) == "function" then
            a3 = "strictEqualObject"
        end
    end
    if #v19 == 1 and #v20 == 1 and v19[1] ~= v20[1] then
        v1 = v19[1]
        v2 = if not boolean.toJSBoolean(false) then v20[1] else v20[1]
        v3 = (string.len(v1)) + string.len(v2)
        if v3 <= 12 then
            if typeof(a1) == "table" and a1 ~= nil then
                v1 = v19[#v19]
                v2 = v20[#v20]
                while v1 == v2 do
                    v3 = v21
                    v21 = v21 + 1
                    if not (v3 < 3) then
                        v14 = v1
                    else
                        v16 = ("\n  %s%s"):format(v1, v16)
                    end
                    table.remove(v19)
                    table.remove(v20)
                    if #v19 == 0 or #v20 == 0 then
                        break
                    end
                    v1 = v19[#v19]
                    v2 = v20[#v20]
                end
                v3 = math.max(#v19, #v20)
                if v3 == 0 then
                    v4 = string.split(v18, "\n")
                    if #v4 > 50 then
                        v4[47] = (("%s...%s"):format(u67, u70))
                        while #v4 > 47 do
                            table.remove(v4)
                        end
                    end
                    return (("%s\n\n"):format("Values have same structure but are not reference-equal:")) .. ("%s\n"):format((Array.join(v4, "\n")))
                end
                if v21 >= 5 then
                    v16 = ("\n%s...%s%s"):format(u67, u70, v16)
                    v17 = true
                end
                if v14 ~= "" then
                    v16 = ("\n  %s%s"):format(v14, v16)
                    v14 = ""
                end
                v4 = 0
                v5 = 0
                v6 = u71[a3] .. ("\n%s+ actual%s %s- expected%s"):format(u68, u70, u69, u70)
                v7 = (" %s...%s Lines skipped"):format(u67, u70)
                v8 = v19
                v9 = ("%s+%s"):format(u68, u70)
                v10 = #v20
                if #v19 < v3 then
                    v8 = v20
                    v9 = ("%s-%s"):format(u69, u70)
                    v10 = #v19
                end
                for m = 1, v3 do
                    if not (v10 < m) then
                        v11 = v20[m]
                        v12 = v19[m]
                        v13 = false
                        if v12 ~= v11 then
                            v13 = not boolean.toJSBoolean(string.endsWith(v12, ",")) or string.slice(v12, 0, -1) ~= v11
                        end
                        if v13 and string.endsWith(v11, ",") and string.slice(v11, 0, -1) == v12 then
                            v13 = false
                            v12 = v12 .. ","
                        end
                        if not v13 then
                            v15 = v15 .. v14
                            v14 = ""
                            v5 = v5 + 1
                            if v5 <= 2 then
                                v15 = v15 .. ("\n  %s"):format(v12)
                                v4 = v4 + 1
                            end
                        else
                            if v5 > 2 then
                                if v5 > 3 then
                                    if v5 > 4 then
                                        if v5 ~= 5 then
                                            v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                                            v17 = true
                                        else
                                            v15 = v15 .. ("\n  %s"):format(v19[m - 3])
                                            v4 = v4 + 1
                                        end
                                    end
                                    v15 = v15 .. ("\n  %s"):format(v19[m - 2])
                                    v4 = v4 + 1
                                end
                                v15 = v15 .. ("\n  %s"):format(v19[m - 1])
                                v4 = v4 + 1
                            end
                            v5 = 0
                            v15 = v15 .. ("\n%s+%s %s"):format(u68, u70, v12)
                            v14 = v14 .. ("\n%s-%s %s"):format(u69, u70, v11)
                            v4 = v4 + 2
                        end
                    else
                        if v5 > 2 then
                            if v5 > 3 then
                                if v5 > 4 then
                                    if v5 ~= 5 then
                                        v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                                        v17 = true
                                    else
                                        v15 = v15 .. ("\n  %s"):format(v8[m - 3])
                                        v4 = v4 + 1
                                    end
                                end
                                v15 = v15 .. ("\n  %s"):format(v8[m - 2])
                                v4 = v4 + 1
                            end
                            v15 = v15 .. ("\n  %s"):format(v8[m - 1])
                            v4 = v4 + 1
                        end
                        v5 = 0
                        if v8 ~= v19 then
                            v14 = v14 .. ("\n%s %s"):format(v9, v8[m])
                        else
                            v15 = v15 .. ("\n%s %s"):format(v9, v8[m])
                        end
                        v4 = v4 + 1
                    end
                    if v4 > 50 and m < v3 - 2 then
                        return (("%s%s\n%s\n%s...%s%s\n"):format(v6, v7, v15, u67, u70, v14)) .. ("%s...%s"):format(u67, u70)
                    end
                end
                return ("%s%s\n%s%s%s%s"):format(v6, if not v17 then "" else v7, v15, v14, v16, v22)
            end
            if typeof(a2) == "table" and a2 ~= nil then
                v1 = v19[#v19]
                v2 = v20[#v20]
                while v1 == v2 do
                    v3 = v21
                    v21 = v21 + 1
                    if not (v3 < 3) then
                        v14 = v1
                    else
                        v16 = ("\n  %s%s"):format(v1, v16)
                    end
                    table.remove(v19)
                    table.remove(v20)
                    if #v19 == 0 or #v20 == 0 then
                        break
                    end
                    v1 = v19[#v19]
                    v2 = v20[#v20]
                end
                v3 = math.max(#v19, #v20)
                if v3 == 0 then
                    v4 = string.split(v18, "\n")
                    if #v4 > 50 then
                        v4[47] = (("%s...%s"):format(u67, u70))
                        while #v4 > 47 do
                            table.remove(v4)
                        end
                    end
                    return (("%s\n\n"):format("Values have same structure but are not reference-equal:")) .. ("%s\n"):format((Array.join(v4, "\n")))
                end
                if v21 >= 5 then
                    v16 = ("\n%s...%s%s"):format(u67, u70, v16)
                    v17 = true
                end
                if v14 ~= "" then
                    v16 = ("\n  %s%s"):format(v14, v16)
                    v14 = ""
                end
                v4 = 0
                v5 = 0
                v6 = u71[a3] .. ("\n%s+ actual%s %s- expected%s"):format(u68, u70, u69, u70)
                v7 = (" %s...%s Lines skipped"):format(u67, u70)
                v8 = v19
                v9 = ("%s+%s"):format(u68, u70)
                v10 = #v20
                if #v19 < v3 then
                    v8 = v20
                    v9 = ("%s-%s"):format(u69, u70)
                    v10 = #v19
                end
                for i5 = 1, v3 do
                    if not (v10 < i5) then
                        v11 = v20[i5]
                        v12 = v19[i5]
                        v13 = false
                        if v12 ~= v11 then
                            v13 = not boolean.toJSBoolean(string.endsWith(v12, ",")) or string.slice(v12, 0, -1) ~= v11
                        end
                        if v13 and string.endsWith(v11, ",") and string.slice(v11, 0, -1) == v12 then
                            v13 = false
                            v12 = v12 .. ","
                        end
                        if not v13 then
                            v15 = v15 .. v14
                            v14 = ""
                            v5 = v5 + 1
                            if v5 <= 2 then
                                v15 = v15 .. ("\n  %s"):format(v12)
                                v4 = v4 + 1
                            end
                        else
                            if v5 > 2 then
                                if v5 > 3 then
                                    if v5 > 4 then
                                        if v5 ~= 5 then
                                            v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                                            v17 = true
                                        else
                                            v15 = v15 .. ("\n  %s"):format(v19[i5 - 3])
                                            v4 = v4 + 1
                                        end
                                    end
                                    v15 = v15 .. ("\n  %s"):format(v19[i5 - 2])
                                    v4 = v4 + 1
                                end
                                v15 = v15 .. ("\n  %s"):format(v19[i5 - 1])
                                v4 = v4 + 1
                            end
                            v5 = 0
                            v15 = v15 .. ("\n%s+%s %s"):format(u68, u70, v12)
                            v14 = v14 .. ("\n%s-%s %s"):format(u69, u70, v11)
                            v4 = v4 + 2
                        end
                    else
                        if v5 > 2 then
                            if v5 > 3 then
                                if v5 > 4 then
                                    if v5 ~= 5 then
                                        v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                                        v17 = true
                                    else
                                        v15 = v15 .. ("\n  %s"):format(v8[i5 - 3])
                                        v4 = v4 + 1
                                    end
                                end
                                v15 = v15 .. ("\n  %s"):format(v8[i5 - 2])
                                v4 = v4 + 1
                            end
                            v15 = v15 .. ("\n  %s"):format(v8[i5 - 1])
                            v4 = v4 + 1
                        end
                        v5 = 0
                        if v8 ~= v19 then
                            v14 = v14 .. ("\n%s %s"):format(v9, v8[i5])
                        else
                            v15 = v15 .. ("\n%s %s"):format(v9, v8[i5])
                        end
                        v4 = v4 + 1
                    end
                    if v4 > 50 and i5 < v3 - 2 then
                        return (("%s%s\n%s\n%s...%s%s\n"):format(v6, v7, v15, u67, u70, v14)) .. ("%s...%s"):format(u67, u70)
                    end
                end
                return ("%s%s\n%s%s%s%s"):format(v6, if not v17 then "" else v7, v15, v14, v16, v22)
            end
            if a1 == 0 and a2 == 0 then
                v1 = v19[#v19]
                v2 = v20[#v20]
                while v1 == v2 do
                    v3 = v21
                    v21 = v21 + 1
                    if not (v3 < 3) then
                        v14 = v1
                    else
                        v16 = ("\n  %s%s"):format(v1, v16)
                    end
                    table.remove(v19)
                    table.remove(v20)
                    if #v19 == 0 or #v20 == 0 then
                        break
                    end
                    v1 = v19[#v19]
                    v2 = v20[#v20]
                end
                v3 = math.max(#v19, #v20)
                if v3 == 0 then
                    v4 = string.split(v18, "\n")
                    if #v4 > 50 then
                        v4[47] = (("%s...%s"):format(u67, u70))
                        while #v4 > 47 do
                            table.remove(v4)
                        end
                    end
                    return (("%s\n\n"):format("Values have same structure but are not reference-equal:")) .. ("%s\n"):format((Array.join(v4, "\n")))
                end
                if v21 >= 5 then
                    v16 = ("\n%s...%s%s"):format(u67, u70, v16)
                    v17 = true
                end
                if v14 ~= "" then
                    v16 = ("\n  %s%s"):format(v14, v16)
                    v14 = ""
                end
                v4 = 0
                v5 = 0
                v6 = u71[a3] .. ("\n%s+ actual%s %s- expected%s"):format(u68, u70, u69, u70)
                v7 = (" %s...%s Lines skipped"):format(u67, u70)
                v8 = v19
                v9 = ("%s+%s"):format(u68, u70)
                v10 = #v20
                if #v19 < v3 then
                    v8 = v20
                    v9 = ("%s-%s"):format(u69, u70)
                    v10 = #v19
                end
                for i6 = 1, v3 do
                    if not (v10 < i6) then
                        v11 = v20[i6]
                        v12 = v19[i6]
                        v13 = false
                        if v12 ~= v11 then
                            v13 = not boolean.toJSBoolean(string.endsWith(v12, ",")) or string.slice(v12, 0, -1) ~= v11
                        end
                        if v13 and string.endsWith(v11, ",") and string.slice(v11, 0, -1) == v12 then
                            v13 = false
                            v12 = v12 .. ","
                        end
                        if not v13 then
                            v15 = v15 .. v14
                            v14 = ""
                            v5 = v5 + 1
                            if v5 <= 2 then
                                v15 = v15 .. ("\n  %s"):format(v12)
                                v4 = v4 + 1
                            end
                        else
                            if v5 > 2 then
                                if v5 > 3 then
                                    if v5 > 4 then
                                        if v5 ~= 5 then
                                            v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                                            v17 = true
                                        else
                                            v15 = v15 .. ("\n  %s"):format(v19[i6 - 3])
                                            v4 = v4 + 1
                                        end
                                    end
                                    v15 = v15 .. ("\n  %s"):format(v19[i6 - 2])
                                    v4 = v4 + 1
                                end
                                v15 = v15 .. ("\n  %s"):format(v19[i6 - 1])
                                v4 = v4 + 1
                            end
                            v5 = 0
                            v15 = v15 .. ("\n%s+%s %s"):format(u68, u70, v12)
                            v14 = v14 .. ("\n%s-%s %s"):format(u69, u70, v11)
                            v4 = v4 + 2
                        end
                    else
                        if v5 > 2 then
                            if v5 > 3 then
                                if v5 > 4 then
                                    if v5 ~= 5 then
                                        v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                                        v17 = true
                                    else
                                        v15 = v15 .. ("\n  %s"):format(v8[i6 - 3])
                                        v4 = v4 + 1
                                    end
                                end
                                v15 = v15 .. ("\n  %s"):format(v8[i6 - 2])
                                v4 = v4 + 1
                            end
                            v15 = v15 .. ("\n  %s"):format(v8[i6 - 1])
                            v4 = v4 + 1
                        end
                        v5 = 0
                        if v8 ~= v19 then
                            v14 = v14 .. ("\n%s %s"):format(v9, v8[i6])
                        else
                            v15 = v15 .. ("\n%s %s"):format(v9, v8[i6])
                        end
                        v4 = v4 + 1
                    end
                    if v4 > 50 and i6 < v3 - 2 then
                        return (("%s%s\n%s\n%s...%s%s\n"):format(v6, v7, v15, u67, u70, v14)) .. ("%s...%s"):format(u67, u70)
                    end
                end
                return ("%s%s\n%s%s%s%s"):format(v6, if not v17 then "" else v7, v15, v14, v16, v22)
            end
            return (("%s\n\n"):format(u71[a3])) .. ("%s !== %s\n"):format(v19[1], v20[1])
        end
        if a3 ~= "strictEqualObject" and v3 < (if not u62.stderr.isTTY then 80 else u62.stderr.columns) then
            while true do
                if (string.sub(v1, v21 + 1, v21 + 1)) ~= string.sub(v2, v21 + 1, v21 + 1) then
                    break
                end
                v21 = v21 + 1
            end
            if v21 > 2 then
                v22 = ("\n  %s^"):format((string.rep(" ", v21)))
                v21 = 0
            end
        end
    end
    v1 = v19[#v19]
    v2 = v20[#v20]
    while v1 == v2 do
        v3 = v21
        v21 = v21 + 1
        if not (v3 < 3) then
            v14 = v1
        else
            v16 = ("\n  %s%s"):format(v1, v16)
        end
        table.remove(v19)
        table.remove(v20)
        if #v19 == 0 or #v20 == 0 then
            break
        end
        v1 = v19[#v19]
        v2 = v20[#v20]
    end
    v3 = math.max(#v19, #v20)
    if v3 == 0 then
        v4 = string.split(v18, "\n")
        if #v4 > 50 then
            v4[47] = (("%s...%s"):format(u67, u70))
            while #v4 > 47 do
                table.remove(v4)
            end
        end
        return (("%s\n\n"):format("Values have same structure but are not reference-equal:")) .. ("%s\n"):format((Array.join(v4, "\n")))
    end
    if v21 >= 5 then
        v16 = ("\n%s...%s%s"):format(u67, u70, v16)
        v17 = true
    end
    if v14 ~= "" then
        v16 = ("\n  %s%s"):format(v14, v16)
        v14 = ""
    end
    v4 = 0
    v5 = 0
    v6 = u71[a3] .. ("\n%s+ actual%s %s- expected%s"):format(u68, u70, u69, u70)
    v7 = (" %s...%s Lines skipped"):format(u67, u70)
    v8 = v19
    v9 = ("%s+%s"):format(u68, u70)
    v10 = #v20
    if #v19 < v3 then
        v8 = v20
        v9 = ("%s-%s"):format(u69, u70)
        v10 = #v19
    end
    for i7 = 1, v3 do
        if not (v10 < i7) then
            v11 = v20[i7]
            v12 = v19[i7]
            v13 = false
            if v12 ~= v11 then
                v13 = not boolean.toJSBoolean(string.endsWith(v12, ",")) or string.slice(v12, 0, -1) ~= v11
            end
            if v13 and string.endsWith(v11, ",") and string.slice(v11, 0, -1) == v12 then
                v13 = false
                v12 = v12 .. ","
            end
            if not v13 then
                v15 = v15 .. v14
                v14 = ""
                v5 = v5 + 1
                if v5 <= 2 then
                    v15 = v15 .. ("\n  %s"):format(v12)
                    v4 = v4 + 1
                end
            else
                if v5 > 2 then
                    if v5 > 3 then
                        if v5 > 4 then
                            if v5 ~= 5 then
                                v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                                v17 = true
                            else
                                v15 = v15 .. ("\n  %s"):format(v19[i7 - 3])
                                v4 = v4 + 1
                            end
                        end
                        v15 = v15 .. ("\n  %s"):format(v19[i7 - 2])
                        v4 = v4 + 1
                    end
                    v15 = v15 .. ("\n  %s"):format(v19[i7 - 1])
                    v4 = v4 + 1
                end
                v15 = v15 .. ("\n%s+%s %s"):format(u68, u70, v12)
                v14 = v14 .. ("\n%s-%s %s"):format(u69, u70, v11)
                v4 = v4 + 2
            end
        else
            if v5 > 2 then
                if v5 > 3 then
                    if v5 > 4 then
                        if v5 ~= 5 then
                            v15 = v15 .. ("\n%s...%s"):format(u67, u70)
                            v17 = true
                        else
                            v15 = v15 .. ("\n  %s"):format(v8[i7 - 3])
                            v4 = v4 + 1
                        end
                    end
                    v15 = v15 .. ("\n  %s"):format(v8[i7 - 2])
                    v4 = v4 + 1
                end
                v15 = v15 .. ("\n  %s"):format(v8[i7 - 1])
                v4 = v4 + 1
            end
            if v8 ~= v19 then
                v14 = v14 .. ("\n%s %s"):format(v9, v8[i7])
            else
                v15 = v15 .. ("\n%s %s"):format(v9, v8[i7])
            end
            v4 = v4 + 1
        end
        if v4 > 50 and i7 < v3 - 2 then
            return (("%s%s\n%s\n%s...%s%s\n"):format(v6, v7, v15, u67, u70, v14)) .. ("%s...%s"):format(u67, u70)
        end
    end
    return ("%s%s\n%s%s%s%s"):format(v6, if not v17 then "" else v7, v15, v14, v16, v22)
end

local v1 = {__index = Error}
local u78 = setmetatable({}, v1)
u78.__index = u78

function u78.__tostring(a1) -- Line: 391
    return a1:toString()
end

function u78.new(a1) -- Line: 404
    -- upvalues: Error (val), u78 (val), u62 (val), u67 (ref), u68 (ref), u70 (ref), u69 (ref), Array (val)
    -- upvalues: Object (val), u61 (val), createErrDiff (val), u71 (val), string (val), inspect (val), boolean (val)
    local v1, v2
    local message = a1.message
    local operator = a1.operator
    local stackStartFn = a1.stackStartFn
    local actual = a1.actual
    local expected = a1.expected
    if message == nil then
        local v3
        if u62.stderr.isTTY then
            if not u62.stderr:hasColors() then
                u67 = ""
                u68 = ""
                u70 = ""
                u69 = ""
            else
                u67 = "\027[34m"
                u68 = "\027[32m"
                u70 = "\027[39m"
                u69 = "\027[31m"
            end
        end
        if typeof(actual) == "table"
            and actual ~= nil
            and typeof(expected) == "table"
            and expected ~= nil
            and Array.indexOf(Object.keys(actual), "stack") ~= -1
            and u61(actual, Error)
            and Array.indexOf(Object.keys(expected), "stack") ~= -1
            and u61(expected, Error) then
            v3 = actual
            actual = {}
            for i, j in (Object.keys(v3)) do
                actual[j] = v3[j]
            end
            actual.message = v3.message
            v3 = expected
            expected = {}
            for k, n in (Object.keys(v3)) do
                expected[n] = v3[n]
            end
            expected.message = v3.message
        end
        if operator == "deepStrictEqual" or operator == "strictEqual" then
            v2 = Error.new(createErrDiff(actual, expected, operator))
            v1 = setmetatable(v2, u78)
        else
            local new, v4, v5
            if operator == "notDeepStrictEqual" then
                v3 = u71[operator]
                v2 = string.split(inspect(actual, {
                    compact = false,
                    customInspect = false,
                    depth = 1000,
                    maxArrayLength = (1 / 0),
                    showHidden = false,
                    showProxy = false,
                    sorted = true,
                    getters = true,
                }), "\n")
                if operator == "notStrictEqual" then
                    if typeof(actual) ~= "table" then
                        if typeof(actual) == "function" then
                            v3 = "Expected \"actual\" not to be reference-equal to \"expected\":"
                        end
                    elseif actual ~= nil or typeof(actual) == "function" then
                        v3 = "Expected \"actual\" not to be reference-equal to \"expected\":"
                    end
                end
                if #v2 > 50 then
                    v2[47] = (("%s...%s"):format(u67, u70))
                    while #v2 > 47 do
                        table.remove(v2)
                    end
                end
                if #v2 ~= 1 then
                    v4 = Error.new(("%s\n\n%s\n"):format(v3, (Array.join(v2, "\n"))))
                else
                    new = Error.new
                    v5 = v2[1]
                    v4 = new(("%s%s%s"):format(v3, if not (5 < (string.len(v2[1]))) then " " else "\n\n", v5))
                end
                v1 = setmetatable(v4, u78)
            elseif operator ~= "notStrictEqual" then
                local v6
                v3 = inspect(actual, {
                    compact = false,
                    customInspect = false,
                    depth = 1000,
                    maxArrayLength = (1 / 0),
                    showHidden = false,
                    showProxy = false,
                    sorted = true,
                    getters = true,
                })
                v2 = inspect(expected, {
                    compact = false,
                    customInspect = false,
                    depth = 1000,
                    maxArrayLength = (1 / 0),
                    showHidden = false,
                    showProxy = false,
                    sorted = true,
                    getters = true,
                })
                local v7 = u71[tostring(operator)]
                if operator ~= "notDeepEqual" or v3 ~= v2 then
                    if 512 < (string.len(v3)) then
                        v3 = ("%s..."):format((string.slice(v3, 0, 509)))
                    end
                    if 512 < (string.len(v2)) then
                        v2 = ("%s..."):format((string.slice(v2, 0, 509)))
                    end
                    if operator ~= "deepEqual" then
                        v4 = u71[("%sUnequal"):format((tostring(operator)))]
                        if not boolean.toJSBoolean(v4) then
                            v2 = (" %s %s"):format(tostring(operator), v2)
                        else
                            v3 = ("%s\n\n%s\n\nshould not loosely deep-equal\n\n"):format(v4, v3)
                        end
                    else
                        v3 = ("%s\n\n%s\n\nshould loosely deep-equal\n\n"):format(v7, v3)
                    end
                    v6 = Error.new(("%s%s"):format(v3, v2))
                else
                    v3 = ("%s\n\n%s"):format(v7, v3)
                    if 1024 < (string.len(v3)) then
                        v3 = ("%s..."):format((string.slice(v3, 0, 1021)))
                    end
                    v6 = Error.new(v3)
                end
                v1 = setmetatable(v6, u78)
            else
                v3 = u71[operator]
                v2 = string.split(inspect(actual, {
                    compact = false,
                    customInspect = false,
                    depth = 1000,
                    maxArrayLength = (1 / 0),
                    showHidden = false,
                    showProxy = false,
                    sorted = true,
                    getters = true,
                }), "\n")
                if operator == "notStrictEqual" then
                    if typeof(actual) ~= "table" then
                        if typeof(actual) == "function" then
                            v3 = "Expected \"actual\" not to be reference-equal to \"expected\":"
                        end
                    elseif actual ~= nil or typeof(actual) == "function" then
                        v3 = "Expected \"actual\" not to be reference-equal to \"expected\":"
                    end
                end
                if #v2 > 50 then
                    v2[47] = (("%s...%s"):format(u67, u70))
                    while #v2 > 47 do
                        table.remove(v2)
                    end
                end
                if #v2 ~= 1 then
                    v4 = Error.new(("%s\n\n%s\n"):format(v3, (Array.join(v2, "\n"))))
                else
                    new = Error.new
                    v5 = v2[1]
                    v4 = new(("%s%s%s"):format(v3, if not (5 < (string.len(v2[1]))) then " " else "\n\n", v5))
                end
                v1 = setmetatable(v4, u78)
            end
        end
    else
        v2 = Error.new((tostring(message)))
        v1 = setmetatable(v2, u78)
    end
    v1.generatedMessage = not boolean.toJSBoolean(message)
    v1.name = "AssertionError [ERR_ASSERTION]"
    v1.code = "ERR_ASSERTION"
    v1.actual = actual
    v1.expected = expected
    v1.operator = operator
    ErrorCaptureStackTrace(v1, stackStartFn or u78.new)
    v1.name = "AssertionError"
    return v1
end

function u78:toString() -- Line: 573
    return ("%s [%s]: %s"):format(self.name, self.code, self.message)
end

u78.name = "AssertionError"
return {AssertionError = u78}