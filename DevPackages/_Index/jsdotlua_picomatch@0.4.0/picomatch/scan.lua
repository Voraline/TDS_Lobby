-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_picomatch@0.4.0.picomatch.scan
-- Decompile time: 28.93 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Boolean = v1.Boolean
local String = v1.String
local utils = require(script.Parent:WaitForChild("utils"))
local constants = require(script.Parent:WaitForChild("constants"))
local CHAR_ASTERISK = constants.CHAR_ASTERISK
local CHAR_AT = constants.CHAR_AT
local CHAR_BACKWARD_SLASH = constants.CHAR_BACKWARD_SLASH
local CHAR_COMMA = constants.CHAR_COMMA
local CHAR_DOT = constants.CHAR_DOT
local CHAR_EXCLAMATION_MARK = constants.CHAR_EXCLAMATION_MARK
local CHAR_FORWARD_SLASH = constants.CHAR_FORWARD_SLASH
local CHAR_LEFT_CURLY_BRACE = constants.CHAR_LEFT_CURLY_BRACE
local CHAR_LEFT_PARENTHESES = constants.CHAR_LEFT_PARENTHESES
local CHAR_LEFT_SQUARE_BRACKET = constants.CHAR_LEFT_SQUARE_BRACKET
local CHAR_PLUS = constants.CHAR_PLUS
local CHAR_QUESTION_MARK = constants.CHAR_QUESTION_MARK
local CHAR_RIGHT_CURLY_BRACE = constants.CHAR_RIGHT_CURLY_BRACE
local CHAR_RIGHT_PARENTHESES = constants.CHAR_RIGHT_PARENTHESES
local CHAR_RIGHT_SQUARE_BRACKET = constants.CHAR_RIGHT_SQUARE_BRACKET

local function isPathSeparator(a1) -- Line: 28 -- upvalues: CHAR_FORWARD_SLASH (val), CHAR_BACKWARD_SLASH (val)
    local v1 = true
    if a1 ~= CHAR_FORWARD_SLASH then
        v1 = a1 == CHAR_BACKWARD_SLASH
    end
    return v1
end

local function depth(a1) -- Line: 32 -- upvalues: Boolean (val)
    if a1.isPrefix ~= true then
        a1.depth = if not Boolean.toJSBoolean(a1.isGlobstar) then 1 else (1 / 0)
    end
end

return function(a1, a2) -- Line: 55
    -- upvalues: String (val), CHAR_BACKWARD_SLASH (val), CHAR_LEFT_CURLY_BRACE (val), Boolean (val), CHAR_DOT (val)
    -- upvalues: CHAR_COMMA (val), CHAR_RIGHT_CURLY_BRACE (val), CHAR_FORWARD_SLASH (val), CHAR_PLUS (val)
    -- upvalues: CHAR_AT (val), CHAR_ASTERISK (val), CHAR_QUESTION_MARK (val), CHAR_EXCLAMATION_MARK (val)
    -- upvalues: CHAR_LEFT_PARENTHESES (val), CHAR_RIGHT_PARENTHESES (val), CHAR_LEFT_SQUARE_BRACKET (val)
    -- upvalues: CHAR_RIGHT_SQUARE_BRACKET (val), utils (val)
    local toJSBoolean, toJSBoolean_2, toJSBoolean_3, toJSBoolean_4, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = a2 or {}
    local u455 = #a1 + 1
    local v12 = true
    if v11.parts ~= true then
        v12 = v11.scanToEnd == true
    end
    local v13 = {}
    local v14 = {}
    local v15 = {}
    local u702 = a1
    local u539 = 0
    local v16 = 1
    local v17 = 1
    local isBrace = false
    local isBracket = false
    local isGlob = false
    local isExtglob = false
    local isGlobstar = false
    local v18 = false
    local backslashes = false
    local negated = false
    local v19 = false
    local v20 = false
    local v21 = 0
    local u32 = nil
    local u668 = nil
    local v22 = {value = "", depth = 0, isGlob = false}

    local function eos() -- Line: 84 -- upvalues: u539 (ref), u455 (val)
        return u455 <= u539
    end

    local function peek() -- Line: 87 -- upvalues: String (upval), u702 (ref), u539 (ref)
        return String.charCodeAt(u702, u539 + 1)
    end

    local function advance() -- Line: 90 -- upvalues: u32 (ref), u668 (ref), u539 (ref), String (upval), u702 (ref)
        u32 = u668
        u539 = u539 + 1
        return String.charCodeAt(u702, u539)
    end

    local v23 = a1
    while u539 < u455 do
        u32 = u668
        u539 = u539 + 1
        u668 = String.charCodeAt(u702, u539)
        if u668 ~= CHAR_BACKWARD_SLASH then
            if v18 ~= true and u668 ~= CHAR_LEFT_CURLY_BRACE then
                if u668 == CHAR_FORWARD_SLASH then
                    table.insert(v13, u539)
                    table.insert(v14, v22)
                    v22 = {value = "", depth = 0, isGlob = false}
                    if v20 ~= true then
                        if u32 ~= CHAR_DOT or u539 ~= v16 + 1 then
                            v17 = u539 + 1
                        else
                            v16 = v16 + 2
                        end
                    end
                    continue
                end
                if v11.noext ~= true then
                    v2 = true
                    if u668 ~= CHAR_PLUS then
                        v2 = true
                        if u668 ~= CHAR_AT then
                            v2 = true
                            if u668 ~= CHAR_ASTERISK then
                                v2 = true
                                if u668 ~= CHAR_QUESTION_MARK then
                                    v2 = u668 == CHAR_EXCLAMATION_MARK
                                end
                            end
                        end
                    end
                    if v2 and (String.charCodeAt(u702, u539 + 1)) == CHAR_LEFT_PARENTHESES then
                        v22.isGlob = true
                        isGlob = v22.isGlob
                        v22.isExtglob = true
                        isExtglob = v22.isExtglob
                        if u668 == CHAR_EXCLAMATION_MARK and u539 == v16 then
                            v19 = true
                        end
                        if v12 == true then
                            while true do
                                if not (u455 <= u539) then
                                    toJSBoolean = Boolean.toJSBoolean
                                    u539 = u539 + 1
                                    u668 = String.charCodeAt(u702, u539)
                                    if toJSBoolean(u668) then
                                        if u668 == CHAR_BACKWARD_SLASH then
                                            v22.backslashes = true
                                            backslashes = v22.backslashes
                                            u539 = u539 + 1
                                            u668 = String.charCodeAt(u702, u539)
                                            continue
                                        end
                                        if u668 ~= CHAR_RIGHT_PARENTHESES then
                                            continue
                                        else
                                            v22.isGlob = true
                                            isGlob = v22.isGlob
                                        end
                                    end
                                end
                                break
                            end
                        end
                        break
                    end
                end
                if u668 == CHAR_ASTERISK then
                    if u32 == CHAR_ASTERISK then
                        v22.isGlobstar = true
                        isGlobstar = v22.isGlobstar
                    end
                    v22.isGlob = true
                    isGlob = v22.isGlob
                    if v12 == true then
                        continue
                    end
                    break
                end
                if u668 == CHAR_QUESTION_MARK then
                    v22.isGlob = true
                    isGlob = v22.isGlob
                    if v12 == true then
                        continue
                    end
                    break
                end
                if u668 == CHAR_LEFT_SQUARE_BRACKET then
                    while true do
                        if not (u455 <= u539) then
                            toJSBoolean_2 = Boolean.toJSBoolean
                            u539 = u539 + 1
                            v1 = String.charCodeAt(u702, u539)
                            if toJSBoolean_2(v1) then
                                if v1 == CHAR_BACKWARD_SLASH then
                                    v22.backslashes = true
                                    backslashes = v22.backslashes
                                    u539 = u539 + 1
                                    String.charCodeAt(u702, u539)
                                    continue
                                end
                                if v1 ~= CHAR_RIGHT_SQUARE_BRACKET then
                                    continue
                                else
                                    v22.isBracket = true
                                    isBracket = v22.isBracket
                                    v22.isGlob = true
                                    isGlob = v22.isGlob
                                end
                            end
                        end
                        if v12 == true then
                            break
                        end
                        break
                    end
                end
                if v11.nonegate ~= true and u668 == CHAR_EXCLAMATION_MARK and u539 == v16 then
                    v22.negated = true
                    negated = v22.negated
                    v16 = v16 + 1
                    continue
                end
                if v11.noparen ~= true and u668 == CHAR_LEFT_PARENTHESES then
                    v22.isGlob = true
                    isGlob = v22.isGlob
                    if v12 == true then
                        while true do
                            if not (u455 <= u539) then
                                toJSBoolean_3 = Boolean.toJSBoolean
                                u539 = u539 + 1
                                u668 = String.charCodeAt(u702, u539)
                                if toJSBoolean_3(u668) then
                                    if u668 == CHAR_LEFT_PARENTHESES then
                                        v22.backslashes = true
                                        backslashes = v22.backslashes
                                        u539 = u539 + 1
                                        u668 = String.charCodeAt(u702, u539)
                                        continue
                                    end
                                    if u668 ~= CHAR_RIGHT_PARENTHESES then
                                        continue
                                    end
                                end
                            end
                            break
                        end
                    end
                    break
                end
                if isGlob ~= true then
                    continue
                end
                if v12 == true then
                    continue
                end
                break
            end
            v21 = v21 + 1
            while true do
                if not (u455 <= u539) then
                    toJSBoolean_4 = Boolean.toJSBoolean
                    u539 = u539 + 1
                    u668 = String.charCodeAt(u702, u539)
                    if toJSBoolean_4(u668) then
                        if u668 == CHAR_BACKWARD_SLASH then
                            v22.backslashes = true
                            backslashes = v22.backslashes
                            u539 = u539 + 1
                            String.charCodeAt(u702, u539)
                            continue
                        end
                        if u668 == CHAR_LEFT_CURLY_BRACE then
                            v21 = v21 + 1
                            continue
                        end
                        if v18 == true then
                            if v18 == true then
                                if u668 ~= CHAR_RIGHT_CURLY_BRACE then
                                    continue
                                else
                                    v21 = v21 - 1
                                    if v21 ~= 0 then
                                        continue
                                    else
                                        v22.isBrace = true
                                        isBrace = v22.isBrace
                                    end
                                end
                            elseif u668 == CHAR_COMMA then
                                v22.isBrace = true
                                isBrace = v22.isBrace
                                v22.isGlob = true
                                isGlob = v22.isGlob
                                if v12 == true then
                                    continue
                                end
                            elseif u668 ~= CHAR_RIGHT_CURLY_BRACE then
                                continue
                            else
                                v21 = v21 - 1
                                if v21 ~= 0 then
                                    continue
                                else
                                    v22.isBrace = true
                                    isBrace = v22.isBrace
                                end
                            end
                        elseif u668 == CHAR_DOT then
                            u539 = u539 + 1
                            u668 = String.charCodeAt(u702, u539)
                            if u668 == CHAR_DOT then
                                v22.isBrace = true
                                isBrace = v22.isBrace
                                v22.isGlob = true
                                isGlob = v22.isGlob
                                if v12 == true then
                                    continue
                                end
                            elseif v18 == true then
                                if u668 ~= CHAR_RIGHT_CURLY_BRACE then
                                    continue
                                else
                                    v21 = v21 - 1
                                    if v21 ~= 0 then
                                        continue
                                    else
                                        v22.isBrace = true
                                        isBrace = v22.isBrace
                                    end
                                end
                            elseif u668 == CHAR_COMMA then
                                v22.isBrace = true
                                isBrace = v22.isBrace
                                v22.isGlob = true
                                isGlob = v22.isGlob
                                if v12 == true then
                                    continue
                                end
                            elseif u668 ~= CHAR_RIGHT_CURLY_BRACE then
                                continue
                            else
                                v21 = v21 - 1
                                if v21 ~= 0 then
                                    continue
                                else
                                    v22.isBrace = true
                                    isBrace = v22.isBrace
                                end
                            end
                        elseif v18 == true then
                            if u668 ~= CHAR_RIGHT_CURLY_BRACE then
                                continue
                            else
                                v21 = v21 - 1
                                if v21 ~= 0 then
                                    continue
                                else
                                    v22.isBrace = true
                                    isBrace = v22.isBrace
                                end
                            end
                        elseif u668 == CHAR_COMMA then
                            v22.isBrace = true
                            isBrace = v22.isBrace
                            v22.isGlob = true
                            isGlob = v22.isGlob
                            if v12 == true then
                                continue
                            end
                        elseif u668 ~= CHAR_RIGHT_CURLY_BRACE then
                            continue
                        else
                            v21 = v21 - 1
                            if v21 ~= 0 then
                                continue
                            else
                                v22.isBrace = true
                                isBrace = v22.isBrace
                            end
                        end
                    end
                end
                if v12 == true then
                    break
                end
                break
            end
        else
            v22.backslashes = true
            backslashes = v22.backslashes
            u539 = u539 + 1
            u668 = String.charCodeAt(u702, u539)
            if u668 == CHAR_LEFT_CURLY_BRACE then end
        end
    end
    if v11.noext == true then
        isExtglob = false
        isGlob = false
    end
    v1 = u702
    v2 = ""
    local v24 = ""
    if v16 > 1 then
        v2 = String.slice(u702, 1, v16)
        u702 = String.slice(u702, v16)
        v17 = v17 - v16
    end
    if not Boolean.toJSBoolean(v1) or isGlob ~= true then
        if isGlob ~= true then
            v1 = u702
        else
            v1 = ""
            v24 = u702
        end
    elseif v17 > 1 then
        v1 = String.slice(u702, 1, v17)
        v24 = String.slice(u702, v17)
    elseif isGlob ~= true then
        v1 = u702
    else
        v1 = ""
        v24 = u702
    end
    if Boolean.toJSBoolean(v1) and v1 ~= "" and v1 ~= "/" and v1 ~= u702 then
        v4 = String.charCodeAt(v1, #v1)
        v3 = true
        if v4 ~= CHAR_FORWARD_SLASH then
            v3 = v4 == CHAR_BACKWARD_SLASH
        end
        if v3 then
            v1 = String.slice(v1, 1, -1)
        end
    end
    if v11.unescape == true then
        if Boolean.toJSBoolean(v24) then
            v24 = utils.removeBackslashes(v24)
        end
        if Boolean.toJSBoolean(v1) and backslashes == true then
            v1 = utils.removeBackslashes(v1)
        end
    end
    v3 = {}
    v3.prefix = v2
    v3.input = v23
    v3.start = v16
    v3.base = v1
    v3.glob = v24
    v3.isBrace = isBrace
    v3.isBracket = isBracket
    v3.isGlob = isGlob
    v3.isExtglob = isExtglob
    v3.isGlobstar = isGlobstar
    v3.negated = negated
    v3.negatedExtglob = v19
    if v11.tokens == true then
        v3.maxDepth = 0
        v5 = u668
        v4 = true
        if v5 ~= CHAR_FORWARD_SLASH then
            v4 = v5 == CHAR_BACKWARD_SLASH
        end
        if not v4 then
            table.insert(v14, v22)
        end
        v3.tokens = v14
    end
    if v11.parts == true then
        v4 = nil
        v5 = #v13
        for i = 1, v5 do
            v7 = if not Boolean.toJSBoolean(v4) then v16 else v4 + 1
            v8 = v13[i]
            v9 = String.slice(v23, v7, v8)
            if Boolean.toJSBoolean(v11.tokens) then
                if i ~= 1 or v16 == 1 then
                    v14[i].value = v9
                else
                    v14[i].isPrefix = true
                    v14[i].value = v2
                end
                v10 = v14[i]
                if v10.isPrefix ~= true then
                    v10.depth = if not Boolean.toJSBoolean(v10.isGlobstar) then 1 else (1 / 0)
                end
                v3.maxDepth = v3.maxDepth + v14[i].depth
            end
            if i ~= 1 or v9 ~= "" then
                table.insert(v15, v9)
            end
            v4 = v8
        end
        if Boolean.toJSBoolean(v4) and v4 + 1 < #v23 then
            v5 = String.slice(v23, v4 + 1)
            table.insert(v15, v5)
            if Boolean.toJSBoolean(v11.tokens) then
                v14[#v14].value = v5
                v6 = v14[#v14]
                if v6.isPrefix ~= true then
                    v6.depth = if not Boolean.toJSBoolean(v6.isGlobstar) then 1 else (1 / 0)
                end
                v3.maxDepth = v3.maxDepth + v14[#v14].depth
            end
        end
        v3.slashes = v13
        v3.parts = v15
    elseif v11.tokens == true then
        v4 = nil
        v5 = #v13
        for j = 1, v5 do
            v7 = if not Boolean.toJSBoolean(v4) then v16 else v4 + 1
            v8 = v13[j]
            v9 = String.slice(v23, v7, v8)
            if Boolean.toJSBoolean(v11.tokens) then
                if j ~= 1 or v16 == 1 then
                    v14[j].value = v9
                else
                    v14[j].isPrefix = true
                    v14[j].value = v2
                end
                v10 = v14[j]
                if v10.isPrefix ~= true then
                    v10.depth = if not Boolean.toJSBoolean(v10.isGlobstar) then 1 else (1 / 0)
                end
                v3.maxDepth = v3.maxDepth + v14[j].depth
            end
            if j ~= 1 or v9 ~= "" then
                table.insert(v15, v9)
            end
            v4 = v8
        end
        if Boolean.toJSBoolean(v4) and v4 + 1 < #v23 then
            v5 = String.slice(v23, v4 + 1)
            table.insert(v15, v5)
            if Boolean.toJSBoolean(v11.tokens) then
                v14[#v14].value = v5
                v6 = v14[#v14]
                if v6.isPrefix ~= true then
                    v6.depth = if not Boolean.toJSBoolean(v6.isGlobstar) then 1 else (1 / 0)
                end
                v3.maxDepth = v3.maxDepth + v14[#v14].depth
            end
        end
        v3.slashes = v13
        v3.parts = v15
    end
    return v3
end