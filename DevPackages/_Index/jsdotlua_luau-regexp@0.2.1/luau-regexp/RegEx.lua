-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_luau-regexp@0.2.1.luau-regexp.RegEx
-- Decompile time: 1525.95 ms

local insert_tokenized_sub, tkn_char_match
local u4 = setmetatable({}, {__mode = "k"})
local u5 = {}
local u6 = {}
local u7 = {}
local u8 = nil

local function to_str_arr(a1, a2) -- Line: 54
    local codepoint, offset_2, pack, v1, v2, v3
    if a2 then
        a1 = string.sub(a1, (utf8.offset(a1, a2)))
    end
    local v4 = utf8.len(a1)
    if v4 <= 1999 then
        return {n = v4, s = a1, utf8.codepoint(a1, 1, #a1)}
    end
    local v5 = math.ceil(v4 / 1999)
    local v6 = table.create(v4)
    local v7 = 1
    for i = 1, v5 do
        pack = table.pack
        codepoint = utf8.codepoint
        v1 = utf8.offset(a1, i * 1999 - 1998)
        offset_2 = utf8.offset
        v2 = not (i ~= v5) and 1998 - ((v4 - 1) % 1999 + 1) or -1
        v3 = pack(codepoint(a1, v1, offset_2(a1, i * 1999 - v2) - 1))
        table.move(v3, 1, v3.n, v7, v6)
        v7 = v7 + v3.n
    end
    v6.s = a1
    v6.n = v4
    return v6
end

local function from_str_arr(a1) -- Line: 74
    local char, v1, v2, v3
    local n = a1.n or #a1
    if n <= 7997 then
        return utf8.char(table.unpack(a1))
    end
    local v4 = math.ceil(n / 7997)
    local v5 = table.create(v4)
    for i = 1, v4 do
        char = utf8.char
        v1 = i * 7997 - 7996
        v3 = i * 7997
        v2 = v3 - (not (i ~= v4) and 7997 - ((n - 1) % 7997 + 1) or 0)
        v5[i] = (char(table.unpack(a1, v1, v2)))
    end
    return table.concat(v5)
end

local function utf8_sub(a1, a2, a3) -- Line: 87
    local v1 = utf8.offset(a1, a3)
    return (string.sub(a1, utf8.offset(a1, a2), v1 and v1 - 1))
end

local u12 = {
    a = "anchored",
    i = "caseless",
    m = "multiline",
    s = "dotall",
    u = "unicode",
    U = "ungreedy",
    x = "extended",
}
local u13 = {
    alnum = true,
    alpha = true,
    ascii = true,
    blank = true,
    cntrl = true,
    digit = true,
    graph = true,
    lower = true,
    print = true,
    punct = true,
    space = true,
    upper = true,
    word = true,
    xdigit = true,
}
local u14 = {
    [68] = {"class", "digit", true},
    [83] = {"class", "space", true},
    [87] = {"class", "word", true},
    [100] = {"class", "digit", false},
    [115] = {"class", "space", false},
    [119] = {"class", "word", false},
    [72] = {"class", "blank", true},
    [86] = {"class", "vertical_tab", true},
    [104] = {"class", "blank", false},
    [118] = {"class", "vertical_tab", false},
    [78] = {78},
    [82] = {82},
    [66] = 8,
    [110] = 10,
    [114] = 13,
    [116] = 9,
}
local u63 = {
    [98] = {98, {"class", "word", false}},
    [66] = {66, {"class", "word", false}},
    [75] = {75},
    [71] = {71},
    [74] = {74},
    [90] = {90},
    [122] = {122},
}
local u129 = {
    [33] = true,
    [34] = true,
    [35] = true,
    [36] = true,
    [37] = true,
    [38] = true,
    [39] = true,
    [40] = true,
    [41] = true,
    [42] = true,
    [43] = true,
    [44] = true,
    [45] = true,
    [46] = true,
    [47] = true,
    [58] = true,
    [59] = true,
    [60] = true,
    [61] = true,
    [62] = true,
    [63] = true,
    [64] = true,
    [91] = true,
    [92] = true,
    [93] = true,
    [94] = true,
    [95] = true,
    [96] = true,
    [123] = true,
    [124] = true,
    [125] = true,
    [126] = true,
}
local u162 = {36}
local u164 = {46}
local u166 = {94}
local u168 = {124}

local function check_re(a1, a2, a3) -- Line: 150 -- upvalues: u4 (val), u5 (val)
    if a1 == "Match" then
        return function(...) -- Line: 152 -- upvalues: u4 (upval), a2 (val), a3 (val)
            if (select("#", ...)) < 1 then
                error("missing argument #1 (Match expected)", 2)
            end
            local v1, v2 = ...
            if not u4[v1] then
                error(string.format("invalid argument #1 to %q (Match expected, got %s)", a2, (typeof(v1))), 2)
            elseif u4[v1].name == "Match" then
                v1 = u4[v1]
            else
                error(string.format("invalid argument #1 to %q (Match expected, got %s)", a2, (typeof(v1))), 2)
            end
            if a2 == "group" then
                if v2 == nil then
                    v2 = 0
                end
            elseif a2 == "span" and v2 == nil then
                v2 = 0
            end
            return a3(v1, v2)
        end
    end
    return function(...) -- Line: 171 -- upvalues: u4 (upval), a2 (val), u5 (upval), a3 (val)
        local v1 = select("#", ...)
        if v1 < 1 then
            error("missing argument #1 (RegEx expected)", 2)
        elseif v1 < 2 then
            error("missing argument #2 (string expected)", 2)
        end
        local v2, v3, v4, v5, v6, v7 = ...
        if not u4[v2] or u4[v2].name ~= "RegEx" then
            if type(v2) ~= "string" and type(v2) ~= "number" then
                error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", a2, (typeof(v2))), 2)
            end
            v2 = u5.fromstring(v2)
        elseif a2 ~= "sub" then
            if type(v3) == "number" then
                v3 = v3 .. ""
            elseif type(v3) ~= "string" then
                error(string.format("invalid argument #2 to %q (string expected, got %s)", a2, (typeof(v3))), 2)
            end
        elseif type(v4) == "number" then
            v4 = v4 .. ""
        elseif type(v4) ~= "string" then
            error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v4))), 2)
        end
        if a2 ~= "sub" and a2 ~= "split" then
            local v8 = typeof(v4)
            if v8 ~= "nil" then
                v4 = tonumber(v4)
                if not v4 then
                    error(string.format("invalid argument #3 to %q (number expected, got %s)", a2, v8), 2)
                else
                    v4 = if not (v4 < 0) then math.max(math.floor(v4 + 0.5), 1) else #v3 + math.floor(v4 + 0.5) + 1
                end
            end
        end
        v2 = u4[v2]
        if a2 == "match" then
            v5 = ...
        elseif a2 == "matchiter" then
            v5 = ...
        elseif a2 == "sub" then
            v7 = ...
        end
        return a3(v2, v3, v4, v5, v6, v7)
    end
end

local function match_tostr(a1) -- Line: 219 -- upvalues: u4 (val)
    local spans = u4[a1].spans
    local v1 = spans[0][1]
    local v2 = spans[0][2]
    if v2 <= v1 then
        return string.format("Match (%d..%d, empty)", v1, v2 - 1)
    end
    local format = string.format
    local v3 = v2 - 1
    local input = spans.input
    local v4 = utf8.offset(input, v2)
    return format("Match (%d..%d): %s", v1, v3, (string.sub(input, utf8.offset(input, v1), v4 and v4 - 1)))
end

local function new_match(a1, a2, a3, a4) -- Line: 228 -- upvalues: u8 (ref), u7 (ref), match_tostr (val), u4 (val)
    a1.source = a3
    a1.input = a4
    local v1 = newproxy(true)
    local v2 = getmetatable(v1)
    v2.__metatable = u8
    local v3 = u7
    v2.__index = setmetatable(a1, v3)
    v2.__tostring = match_tostr
    u4[v1] = {name = "Match", spans = a1, group_id = a2}
    return v1
end

local function u173(a1, a2) -- Line: 240
    local spans = a1.spans
    local v1 = spans[not (type(a2) ~= "number") and a2 or a1.group_id[a2]]
    if not v1 then
        return nil
    end
    local input = a1.spans.input
    local v2 = v1[1]
    local v3 = v1[2]
    v3 = utf8.offset(input, v3)
    return (string.sub(input, utf8.offset(input, v2), v3 and v3 - 1))
end

local u174 = "group"

function u7.group(...) -- Line: 152 -- upvalues: u4 (val), u174 (val), u173 (val)
    if (select("#", ...)) < 1 then
        error("missing argument #1 (Match expected)", 2)
    end
    local v1, v2 = ...
    if not u4[v1] then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u174, (typeof(v1))), 2)
    elseif u4[v1].name == "Match" then
        v1 = u4[v1]
    else
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u174, (typeof(v1))), 2)
    end
    if u174 == "group" then
        if v2 == nil then
            v2 = 0
        end
    elseif u174 == "span" and v2 == nil then
        v2 = 0
    end
    return u173(v1, v2)
end

local function u176(a1, a2) -- Line: 248
    local spans = a1.spans
    local v1 = spans[not (type(a2) ~= "number") and a2 or a1.group_id[a2]]
    if not v1 then
        return nil
    end
    return v1[1], v1[2] - 1
end

local u177 = "span"

function u7.span(...) -- Line: 152 -- upvalues: u4 (val), u177 (val), u176 (val)
    if (select("#", ...)) < 1 then
        error("missing argument #1 (Match expected)", 2)
    end
    local v1, v2 = ...
    if not u4[v1] then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u177, (typeof(v1))), 2)
    elseif u4[v1].name == "Match" then
        v1 = u4[v1]
    else
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u177, (typeof(v1))), 2)
    end
    if u177 == "group" then
        if v2 == nil then
            v2 = 0
        end
    elseif u177 == "span" and v2 == nil then
        v2 = 0
    end
    return u176(v1, v2)
end

local function u179(a1) -- Line: 256
    local input, v1, v2, v3, v4, v5
    local spans = a1.spans
    if not (0 < spans.n) then
        local input_2 = spans.input
        local v6 = spans[0][1]
        local v7 = spans[0][2]
        v7 = utf8.offset(input_2, v7)
        return (string.sub(input_2, utf8.offset(input_2, v6), v7 and v7 - 1))
    end
    local v8 = table.create(spans.n)
    local n = spans.n
    for i = 0, n do
        v4 = spans[i]
        if v4 then
            input = spans.input
            v5 = v4[1]
            v1 = v4[2]
            v1 = utf8.offset(input, v1)
            v2 = utf8.offset(input, v5)
            v3 = v1 and v1 - 1
            v8[i] = (string.sub(input, v2, v3))
        end
    end
    return table.unpack(v8, 1, spans.n)
end

local u180 = "groups"

function u7.groups(...) -- Line: 152 -- upvalues: u4 (val), u180 (val), u179 (val)
    if (select("#", ...)) < 1 then
        error("missing argument #1 (Match expected)", 2)
    end
    local v1, v2 = ...
    if not u4[v1] then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u180, (typeof(v1))), 2)
    elseif u4[v1].name == "Match" then
        v1 = u4[v1]
    else
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u180, (typeof(v1))), 2)
    end
    if u180 == "group" then
        if v2 == nil then
            v2 = 0
        end
    elseif u180 == "span" and v2 == nil then
        v2 = 0
    end
    return u179(v1, v2)
end

local function u182(a1) -- Line: 271
    local input, v1, v2, v3, v4, v5
    local spans = a1.spans
    local v6 = {}
    for k, v in pairs(a1.group_id) do
        v5 = spans[v]
        if v5 then
            input = spans.input
            v1 = v5[1]
            v2 = v5[2]
            v2 = utf8.offset(input, v2)
            v3 = utf8.offset(input, v1)
            v4 = v2 and v2 - 1
            v6[k] = (string.sub(input, v3, v4))
        end
    end
    return v6
end

local u183 = "groupdict"

function u7.groupdict(...) -- Line: 152 -- upvalues: u4 (val), u183 (val), u182 (val)
    if (select("#", ...)) < 1 then
        error("missing argument #1 (Match expected)", 2)
    end
    local v1, v2 = ...
    if not u4[v1] then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u183, (typeof(v1))), 2)
    elseif u4[v1].name == "Match" then
        v1 = u4[v1]
    else
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u183, (typeof(v1))), 2)
    end
    if u183 == "group" then
        if v2 == nil then
            v2 = 0
        end
    elseif u183 == "span" and v2 == nil then
        v2 = 0
    end
    return u182(v1, v2)
end

local function u185(a1) -- Line: 283
    local input, v1, v2, v3, v4, v5
    local spans = a1.spans
    local v6 = table.create(spans.n)
    local n = spans.n
    for i = 0, n do
        v4 = spans[i]
        if v4 then
            input = spans.input
            v5 = v4[1]
            v1 = v4[2]
            v1 = utf8.offset(input, v1)
            v2 = utf8.offset(input, v5)
            v3 = v1 and v1 - 1
            v6[i] = (string.sub(input, v2, v3))
        end
    end
    v6.n = spans.n
    return v6
end

local u186 = "groupdict"

function u7.grouparr(...) -- Line: 152 -- upvalues: u4 (val), u186 (val), u185 (val)
    if (select("#", ...)) < 1 then
        error("missing argument #1 (Match expected)", 2)
    end
    local v1, v2 = ...
    if not u4[v1] then
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u186, (typeof(v1))), 2)
    elseif u4[v1].name == "Match" then
        v1 = u4[v1]
    else
        error(string.format("invalid argument #1 to %q (Match expected, got %s)", u186, (typeof(v1))), 2)
    end
    if u186 == "group" then
        if v2 == nil then
            v2 = 0
        end
    elseif u186 == "span" and v2 == nil then
        v2 = 0
    end
    return u185(v1, v2)
end

local u188 = {
    CR = 0,
    LF = 1,
    CRLF = 2,
    ANYRLF = 3,
    ANY = 4,
    NUL = 5,
}

local function is_newline(a1, a2, a3) -- Line: 300
    local v1
    local newline = a3.newline
    local v2 = a1[a2]
    if newline == 0 then
        return v2 == 13
    end
    if newline == 2 then
        v1 = false
        if v2 == 10 then
            v1 = a1[a2 - 1] == 32
        end
        return v1
    end
    if newline == 3 then
        v1 = true
        if v2 ~= 10 then
            v1 = v2 == 13
        end
        return v1
    end
    if newline ~= 4 then
        if newline == 5 then
            return v2 == 0
        end
        return v2 == 10
    end
    v1 = true
    if v2 ~= 10 then
        v1 = true
        if v2 ~= 11 then
            v1 = true
            if v2 ~= 12 then
                v1 = true
                if v2 ~= 13 then
                    v1 = true
                    if v2 ~= 133 then
                        v1 = true
                        if v2 ~= 8232 then
                            v1 = v2 == 8233
                        end
                    end
                end
            end
        end
    end
    return v1
end

function tkn_char_match(a1, a2, a3, a4, a5) -- Line: 324 -- upvalues: tkn_char_match (val), u129 (val), is_newline (val)
    local v1, v2, v3, v4, v5
    local v6 = a2[a3]
    if not v6 then
        return false
    end
    if a4.ignoreCase and v6 >= 97 and v6 <= 122 then
        v6 = v6 - 32
    end
    if type(a1) == "number" then
        return a1 == v6
    end
    if a1[1] == "charset" then
        for i, v in ipairs(a1[3]) do
            if tkn_char_match(v, a2, a3, a4, a5) then
                return not a1[2]
            end
        end
        return a1[2]
    end
    if a1[1] == "range" then
        local ignoreCase
        if not (a1[2] <= v6) then
            ignoreCase = a4.ignoreCase
            if ignoreCase then
                ignoreCase = false
                if v6 >= 65 then
                    ignoreCase = false
                    if v6 <= 90 then
                        ignoreCase = false
                        v3 = v6 + 32
                        if a1[2] <= v3 then
                            ignoreCase = v6 + 32 <= a1[3]
                        end
                    end
                end
            end
        else
            ignoreCase = true
            if not (v6 <= a1[3]) then
                ignoreCase = a4.ignoreCase
                if ignoreCase then
                    ignoreCase = false
                    if v6 >= 65 then
                        ignoreCase = false
                        if v6 <= 90 then
                            ignoreCase = false
                            v3 = v6 + 32
                            if a1[2] <= v3 then
                                ignoreCase = v6 + 32 <= a1[3]
                            end
                        end
                    end
                end
            end
        end
        return ignoreCase
    end
    if a1[1] ~= "class" then
        if a1[1] == "category" then
            v2 = (false)[v6] or "Cn"
            v3 = a1[3]
            v4 = #v3
            if v4 ~= 3 then
                if v2:sub(1, v4) == v3 then
                    return not a1[2]
                end
                return a1[2]
            end
            v5 = false
            if v3 == "Xan" or v3 == "Xwd" then
                v1 = v2:find("^[LN]")
                if not v1 then
                    v1 = false
                    if v3 == "Xwd" then
                        v1 = v6 == 95
                    end
                end
                v5 = v1
            elseif v3 == "Xps" or v3 == "Xsp" then
                v1 = true
                if v2:sub(1, 1) ~= "Z" then
                    v1 = false
                    if v6 >= 9 then
                        v1 = v6 <= 13
                    end
                end
                v5 = v1
            elseif v3 == "Xuc" then
                v5 = tkn_char_match(false, a2, a3, a4, a5)
            end
            if a1[2] then
                return not v5
            end
            return v5
        end
        if a1[1] == 46 then
            return a4.dotAll or not is_newline(a2, a3, a5)
        end
        if a1[1] == 78 then
            return not is_newline(a2, a3, a5)
        end
        if a1[1] == 82 then
            if a5.newline_seq == 0 then
                v2 = true
                if v6 ~= 10 then
                    v2 = v6 == 13
                end
                return v2
            end
            v2 = true
            if v6 ~= 10 then
                v2 = true
                if v6 ~= 11 then
                    v2 = true
                    if v6 ~= 12 then
                        v2 = true
                        if v6 ~= 13 then
                            v2 = true
                            if v6 ~= 133 then
                                v2 = true
                                if v6 ~= 8232 then
                                    v2 = v6 == 8233
                                end
                            end
                        end
                    end
                end
            end
            return v2
        end
        return false
    end
    v2 = a1[2]
    v3 = a1[3]
    v4 = false
    if v2 == "xdigit" then
        if v6 >= 48 then
            v5 = true
            if not (v6 <= 57) then
                if not (v6 >= 65) then
                    v5 = false
                    if v6 >= 97 then
                        v5 = v6 <= 102
                    end
                else
                    v5 = true
                    if not (v6 <= 70) then
                        v5 = false
                        if v6 >= 97 then
                            v5 = v6 <= 102
                        end
                    end
                end
            end
        elseif not (v6 >= 65) then
            v5 = false
            if v6 >= 97 then
                v5 = v6 <= 102
            end
        else
            v5 = true
            if not (v6 <= 70) then
                v5 = false
                if v6 >= 97 then
                    v5 = v6 <= 102
                end
            end
        end
        v4 = v5
    elseif v2 == "ascii" then
        v4 = v6 <= 127
    elseif v2 == "vertical_tab" then
        if not (v6 >= 10) then
            v5 = true
            if v6 ~= 8232 then
                v5 = v6 == 8233
            end
        else
            v5 = true
            if not (v6 <= 13) then
                v5 = true
                if v6 ~= 8232 then
                    v5 = v6 == 8233
                end
            end
        end
        v4 = v5
    elseif a4.unicode then
        local v7
        v5 = (false)[v6] or "Cn"
        v1 = v5:sub(1, 1)
        if v2 == "alnum" then
            v7 = true
            if v1 ~= "L" then
                v7 = true
                if v5 ~= "Nl" then
                    v7 = v5 == "Nd"
                end
            end
            v4 = v7
        elseif v2 == "alpha" then
            v7 = true
            if v1 ~= "L" then
                v7 = v5 == "Nl"
            end
            v4 = v7
        elseif v2 == "blank" then
            v7 = true
            if v5 ~= "Zs" then
                v7 = v6 == 9
            end
            v4 = v7
        elseif v2 == "cntrl" then
            v4 = v5 == "Cc"
        elseif v2 == "digit" then
            v4 = v5 == "Nd"
        elseif v2 == "graph" then
            v7 = false
            if v1 ~= "P" then
                v7 = v1 ~= "C"
            end
            v4 = v7
        elseif v2 == "lower" then
            v4 = v5 == "Ll"
        elseif v2 == "print" then
            v4 = v1 ~= "C"
        elseif v2 == "punct" then
            v4 = v1 == "P"
        elseif v2 == "space" then
            v7 = true
            if v1 ~= "Z" then
                v7 = false
                if v6 >= 9 then
                    v7 = v6 <= 13
                end
            end
            v4 = v7
        elseif v2 == "upper" then
            v4 = v5 == "Lu"
        elseif v2 == "word" then
            v7 = true
            if v1 ~= "L" then
                v7 = true
                if v5 ~= "Nl" then
                    v7 = true
                    if v5 ~= "Nd" then
                        v7 = v5 == "Pc"
                    end
                end
            end
            v4 = v7
        end
    elseif v2 == "alnum" then
        if v6 >= 48 then
            v5 = true
            if not (v6 <= 57) then
                if not (v6 >= 65) then
                    v5 = false
                    if v6 >= 97 then
                        v5 = v6 <= 122
                    end
                else
                    v5 = true
                    if not (v6 <= 90) then
                        v5 = false
                        if v6 >= 97 then
                            v5 = v6 <= 122
                        end
                    end
                end
            end
        elseif not (v6 >= 65) then
            v5 = false
            if v6 >= 97 then
                v5 = v6 <= 122
            end
        else
            v5 = true
            if not (v6 <= 90) then
                v5 = false
                if v6 >= 97 then
                    v5 = v6 <= 122
                end
            end
        end
        v4 = v5
    elseif v2 == "alpha" then
        if not (v6 >= 65) then
            v5 = false
            if v6 >= 97 then
                v5 = v6 <= 122
            end
        else
            v5 = true
            if not (v6 <= 90) then
                v5 = false
                if v6 >= 97 then
                    v5 = v6 <= 122
                end
            end
        end
        v4 = v5
    elseif v2 == "blank" then
        v5 = true
        if v6 ~= 9 then
            v5 = v6 == 32
        end
        v4 = v5
    elseif v2 == "cntrl" then
        v5 = true
        if not (v6 <= 31) then
            v5 = v6 == 127
        end
        v4 = v5
    elseif v2 == "digit" then
        v5 = false
        if v6 >= 48 then
            v5 = v6 <= 57
        end
        v4 = v5
    elseif v2 == "graph" then
        v5 = false
        if v6 >= 33 then
            v5 = v6 <= 126
        end
        v4 = v5
    elseif v2 == "lower" then
        v5 = false
        if v6 >= 97 then
            v5 = v6 <= 122
        end
        v4 = v5
    elseif v2 == "print" then
        v5 = false
        if v6 >= 32 then
            v5 = v6 <= 126
        end
        v4 = v5
    elseif v2 == "punct" then
        v4 = u129[v6]
    elseif v2 == "space" then
        if not (v6 >= 9) then
            v5 = v6 == 32
        else
            v5 = true
            if not (v6 <= 13) then
                v5 = v6 == 32
            end
        end
        v4 = v5
    elseif v2 == "upper" then
        v5 = false
        if v6 >= 65 then
            v5 = v6 <= 90
        end
        v4 = v5
    elseif v2 == "word" then
        if v6 >= 48 then
            v5 = true
            if not (v6 <= 57) then
                if v6 >= 65 then
                    v5 = true
                    if not (v6 <= 90) then
                        if not (v6 >= 97) then
                            v5 = v6 == 95
                        else
                            v5 = true
                            if not (v6 <= 122) then
                                v5 = v6 == 95
                            end
                        end
                    end
                elseif not (v6 >= 97) then
                    v5 = v6 == 95
                else
                    v5 = true
                    if not (v6 <= 122) then
                        v5 = v6 == 95
                    end
                end
            end
        elseif v6 >= 65 then
            v5 = true
            if not (v6 <= 90) then
                if not (v6 >= 97) then
                    v5 = v6 == 95
                else
                    v5 = true
                    if not (v6 <= 122) then
                        v5 = v6 == 95
                    end
                end
            end
        elseif not (v6 >= 97) then
            v5 = v6 == 95
        else
            v5 = true
            if not (v6 <= 122) then
                v5 = v6 == 95
            end
        end
        v4 = v5
    end
    if v3 then
        return not v4
    end
    return v4
end

local function find_alternation(a1, a2, a3) -- Line: 449 -- upvalues: u168 (val)
    local v1, v2, v3, v4
    while true do
        v3 = a1[a2]
        v4 = type(v3) == "table"
        if v3 == u168 then
            return a2, a3
        end
        if v4 and v3[1] == 40 then
            if a3 then
                v2 = a3 + v3.count
            end
            v1 = v3[3]
            v1 = v1 + 1
            continue
        end
        if v4 and v3[1] == "quantifier" and type(v3[5]) == "table" and v3[5][1] == 40 then
            if a3 then
                v2 = a3 + v3[5].count
            end
            v1 = v3[5][3]
            v1 = v1 + 1
            continue
        end
        if not v3 then
            return nil, a3
        end
        if v4 and v3[1] == 41 then
            return nil, a3
        end
        if a3 then
            v2 = if not v4 then a3 + 1 else if v3[1] ~= "quantifier" then a3 + 1 else a3 + v3[3]
        end
        v1 = a2 + 1
    end
end

local function re_rawfind(a1, a2, a3, a4, a5, a6) -- Line: 478
    -- upvalues: find_alternation (val), tkn_char_match (val), is_newline (val)
    local multiline, multiline_2, s, s_2, s_3, s_4, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18
    local jmp = 0
    local v19 = a3
    local v20 = a3
    local v21 = {}
    local v22, v23, v24, v25, v26, v27 = a1, a2, a4, a5, a3, a6
    while jmp do
        if jmp ~= 0 then
            v1 = v22[jmp]
            v2 = false
            if type(v1) == "table" then
                v2 = v1[1]
            end
            if not v1 then
                break
            end
            if v1 ~= "ACCEPT" then
                if v1 ~= "PRUNE" and v1 ~= "SKIP" then
                    if v2 == 40 then
                        v6 = {"group", jmp, v19, nil, v1[2], v1[3], v1[4]}
                        table.insert(v21, 1, v6)
                        jmp = jmp + 1
                        if v1[4] == 33 then
                            v6 = v1[5] and 0
                        else
                            v6 = false
                            if v1[4] == 61 then
                                v6 = v1[5] and 0
                            end
                        end
                        v3, v4 = find_alternation(v22, jmp, v6)
                        if v3 then
                            table.insert(v21, 1, {"alternation", v3, v19})
                        end
                        if v4 then
                            v19 = v19 - v4
                        end
                        continue
                    end
                    if v2 == 41 and v1[4] ~= 33 then
                        if v1[4] == 33 or v1[4] == 61 then
                            while true do
                                v3 = nil
                                v4 = table.remove(v21, 1)
                                if v4[1] ~= "group" then
                                    if v4[1] == "matchStart" and not v3 and v1[4] ~= 61 then end
                                    continue
                                end
                                if v4[2] == v1[3] then
                                    break
                                end
                                if v4[1] == "matchStart" and not v3 and v1[4] ~= 61 then end
                            end
                            if v1[4] == 33 then
                                if not v1[5] then
                                    v19 = v4[3]
                                end
                            elseif v1[4] == 61 and not v1[5] then
                                v19 = v4[3]
                            end
                            if v3 then
                                table.insert(v21, 1, v3)
                            end
                        elseif v1[4] ~= 62 then
                            for i, v in ipairs(v21) do
                                if v[1] == "group" and v[2] == v1[3] then
                                    if v.jmp then
                                        jmp = v.jmp
                                    end
                                    v[4] = v19
                                    if v[7] ~= "quantifier" or not (v[10] + 1 < v[9]) then
                                        break
                                    end
                                    if v22[v1[3]][4] ~= "lazy" or v[10] + 1 < v[8] then
                                        jmp = v1[3]
                                    end
                                    v8 = v22[v1[3]]
                                    v9 = {}
                                    v11 = v[2]
                                    v14 = v8[5][2]
                                    v15 = v8[5][3]
                                    v16 = v8[2]
                                    v17 = v8[3]
                                    v18 = v[10] + 1
                                    v9[1] = "group"
                                    v9[2] = v11
                                    v9[3] = v19
                                    v9[4] = nil
                                    v9[5] = v14
                                    v9[6] = v15
                                    v9[7] = "quantifier"
                                    v9[8] = v16
                                    v9[9] = v17
                                    v9[10] = v18
                                    v9[11] = v[11]
                                    v9[12] = v8[4]
                                    table.insert(v21, 1, v9)
                                    if not v[11] then
                                        break
                                    end
                                    table.insert(v21, 1, {"alternation", v[11], v19})
                                    break
                                end
                            end
                        else
                            repeat
                                v3 = table.remove(v21, 1)
                                if not v3 then
                                    break
                                end
                            until v3[1] == "group" and v3[2] == v1[3]
                        end
                        jmp = jmp + 1
                        continue
                    end
                    if v2 == 75 then
                        table.insert(v21, 1, {"matchStart", v19})
                        jmp = jmp + 1
                        continue
                    end
                    if v2 == 124 then
                        v3 = jmp
                        repeat
                            v3 = v3 + 1
                            v4 = type(v22[v3]) == "table"
                            v5 = v22[v3]
                            if v4 then
                                if v5[1] == 40
                                    or v5[1] == "quantifier" and type(v5[5]) == "table" and v5[5][1] == 40 then
                                    v3 = not (v5[1] ~= "quantifier") and v5[5][3] or v5[3]
                                end
                            end
                            if v4 and v5[1] == 41 then
                                break
                            end
                        until not v5
                        if not v22[v3] then
                            jmp = v3
                        else
                            for i2, i3 in ipairs(v21) do
                                if i3[1] == "group" and i3[6] == v3 then
                                    jmp = i3[6]
                                    break
                                end
                            end
                        end
                        continue
                    end
                    if v2 == "recurmatch" then
                        v6 = {}
                        v8 = v1[3]
                        v12 = v22[v1[3]][3]
                        v6[1] = "group"
                        v6[2] = v8
                        v6[3] = v19
                        v6[4] = nil
                        v6[5] = nil
                        v6[6] = v12
                        v6[7] = nil
                        v6.jmp = jmp
                        table.insert(v21, 1, v6)
                        v3 = find_alternation(v22, v1[3] + 1)
                        if v3 then
                            table.insert(v21, 1, {"alternation", v3, v19})
                        end
                        continue
                    end
                    v3 = nil
                    if v1 == "FAIL" then
                        v3 = false
                    elseif v2 == 41 then
                        repeat
                            v4 = table.remove(v21, 1)
                        until v4[1] == "group" and v4[2] == v1[3]
                    elseif v2 == "quantifier" then
                        v5 = v1[5]
                        if type(v5) ~= "table" then
                            v4 = nil
                            v5 = nil
                            v6 = 1
                            v7 = false
                            if type(v1[5]) == "table" then
                                v7 = v1[5][1] == "backref"
                            end
                            if v7 then
                                v6 = 0
                                v8 = v1[5][2]
                                for i5, k in ipairs(v21) do
                                    if k[1] == "group" and k[5] == v8 then
                                        v4 = k[3]
                                        v5 = k[4]
                                        v6 = v5 - v4
                                        break
                                    end
                                end
                            end
                            v8 = v19 + v1[2] * v6
                            v9 = 0
                            while v9 < v1[3] do
                                if not v7 then
                                    if not tkn_char_match(v1[5], v23, v19, v24, v25) then
                                        break
                                    end
                                else
                                    if not v4 or not v5 then
                                        break
                                    end
                                    s = v23.s
                                    v14 = utf8.offset(s, v5)
                                    v11 = string.sub(s, utf8.offset(s, v4), v14 and v14 - 1)
                                    s_2 = v23.s
                                    v14 = v19 + v6
                                    v14 = utf8.offset(s_2, v14)
                                    if v11 ~= string.sub(s_2, utf8.offset(s_2, v19), v14 and v14 - 1) then
                                        break
                                    end
                                end
                                v19 = v19 + v6
                                v9 = v9 + 1
                            end
                            if v1[2] <= v9 and v1[4] ~= "possessive" then
                                if v1[4] == "lazy" then
                                    v10 = v19
                                    v19 = v8
                                    v8 = v10
                                end
                                v13 = {}
                                v16 = math.min(v8, v23.n + 1)
                                v18 = if v1[4] ~= "lazy" then -1 else 1
                                v13[1] = "quantifier"
                                v13[2] = jmp
                                v13[3] = v19
                                v13[4] = v16
                                v13[5] = v18 * v6
                                table.insert(v21, 1, v13)
                            end
                        elseif v1[5][1] ~= 40 then
                            v4 = nil
                            v5 = nil
                            v6 = 1
                            v7 = false
                            if type(v1[5]) == "table" then
                                v7 = v1[5][1] == "backref"
                            end
                            if v7 then
                                v6 = 0
                                v8 = v1[5][2]
                                for i6, n2 in ipairs(v21) do
                                    if n2[1] == "group" and n2[5] == v8 then
                                        v4 = n2[3]
                                        v5 = n2[4]
                                        v6 = v5 - v4
                                        break
                                    end
                                end
                            end
                            v8 = v19 + v1[2] * v6
                            v9 = 0
                            while v9 < v1[3] do
                                if not v7 then
                                    if not tkn_char_match(v1[5], v23, v19, v24, v25) then
                                        break
                                    end
                                else
                                    if not v4 or not v5 then
                                        break
                                    end
                                    s = v23.s
                                    v14 = utf8.offset(s, v5)
                                    v11 = string.sub(s, utf8.offset(s, v4), v14 and v14 - 1)
                                    s_2 = v23.s
                                    v14 = v19 + v6
                                    v14 = utf8.offset(s_2, v14)
                                    if v11 ~= string.sub(s_2, utf8.offset(s_2, v19), v14 and v14 - 1) then
                                        break
                                    end
                                end
                                v19 = v19 + v6
                                v9 = v9 + 1
                            end
                            if v1[2] <= v9 and v1[4] ~= "possessive" then
                                if v1[4] == "lazy" then
                                    v10 = v19
                                    v19 = v8
                                    v8 = v10
                                end
                                v13 = {}
                                v16 = math.min(v8, v23.n + 1)
                                v18 = if v1[4] ~= "lazy" then -1 else 1
                                v13[1] = "quantifier"
                                v13[2] = jmp
                                v13[3] = v19
                                v13[4] = v16
                                v13[5] = v18 * v6
                                table.insert(v21, 1, v13)
                            end
                        else
                            v4 = find_alternation(v22, jmp + 1)
                            if v4 then
                                table.insert(v21, 1, {"alternation", v4, v19})
                            end
                            v8 = {}
                            v13 = v1[5][2]
                            v14 = v1[5][3]
                            v8[1] = "group"
                            v8[2] = jmp
                            v8[3] = v19
                            v8[4] = nil
                            v8[5] = v13
                            v8[6] = v14
                            v8[7] = "quantifier"
                            v8[8] = v1[2]
                            v8[9] = v1[3]
                            v8[10] = 0
                            v8[11] = v4
                            v8[12] = v1[4]
                            table.insert(v21, if not v4 then 1 else 2, v8)
                            if v1[4] == "lazy" and v1[2] == 0 then
                                jmp = v1[5][3]
                            end
                            v3 = true
                        end
                    elseif v2 ~= "backref" then
                        v4 = v23[v19]
                        if v2 == 36 or v2 == 90 or v2 == 122 then
                            v5 = true
                            if v19 ~= v23.n + 1 then
                                if v2 ~= 36 or not v24.multiline then
                                    v5 = false
                                    if v2 == 90 then
                                        v5 = false
                                        if v19 == v23.n then
                                            v5 = is_newline(v23, v19, v25)
                                        end
                                    end
                                else
                                    v5 = is_newline(v23, v19 + 1, v25)
                                    if not v5 then
                                        v5 = false
                                        if v2 == 90 then
                                            v5 = false
                                            if v19 == v23.n then
                                                v5 = is_newline(v23, v19, v25)
                                            end
                                        end
                                    end
                                end
                            end
                            v3 = v5
                        elseif v2 == 94 or v2 == 65 or v2 == 71 then
                            v5 = true
                            if v19 ~= 1 then
                                if v2 ~= 94 or not v24.multiline then
                                    v5 = false
                                    if v2 == 71 then
                                        v5 = v19 == v26
                                    end
                                else
                                    v5 = is_newline(v23, v19 - 1, v25)
                                    if not v5 then
                                        v5 = false
                                        if v2 == 71 then
                                            v5 = v19 == v26
                                        end
                                    end
                                end
                            end
                            v3 = v5
                        elseif v2 == 66 then
                            multiline = true
                            if v19 ~= 1 then
                                multiline = v24.multiline and is_newline(v23, v19 - 1, v25)
                            end
                            multiline_2 = true
                            if v19 ~= v23.n + 1 then
                                multiline_2 = v24.multiline and is_newline(v23, v19, v25)
                            end
                            v7 = if not tkn_char_match(v1[2], v23[v19 - 1], v24) then tkn_char_match(v1[2], v4, v24) and 1 else 0
                            if v7 == 0 then
                                v3 = multiline_2 or not tkn_char_match(v1[2], v4, v24)
                            elseif v7 then
                                v3 = multiline or not tkn_char_match(v1[2], v23[v19 - 1], v24)
                            end
                            if v2 == 66 then
                                v3 = not v3
                            end
                        elseif v2 ~= 98 then
                            v3 = tkn_char_match(v1, v23, v19, v24, v25)
                            v19 = v19 + 1
                        else
                            multiline = true
                            if v19 ~= 1 then
                                multiline = v24.multiline and is_newline(v23, v19 - 1, v25)
                            end
                            multiline_2 = true
                            if v19 ~= v23.n + 1 then
                                multiline_2 = v24.multiline and is_newline(v23, v19, v25)
                            end
                            v7 = if not tkn_char_match(v1[2], v23[v19 - 1], v24) then tkn_char_match(v1[2], v4, v24) and 1 else 0
                            if v7 == 0 then
                                v3 = multiline_2 or not tkn_char_match(v1[2], v4, v24)
                            elseif v7 then
                                v3 = multiline or not tkn_char_match(v1[2], v23[v19 - 1], v24)
                            end
                            if v2 == 66 then
                                v3 = not v3
                            end
                        end
                    else
                        v4 = nil
                        v5 = nil
                        v6 = v1[2]
                        for i4, j in ipairs(v21) do
                            if j[1] == "group" and j[5] == v6 then
                                v4 = j[3]
                                v5 = j[4]
                                break
                            end
                        end
                        if v4 and v5 then
                            v7 = v19
                            v19 = v19 + (v5 - v4)
                            s_3 = v23.s
                            v11 = utf8.offset(s_3, v5)
                            v8 = string.sub(s_3, utf8.offset(s_3, v4), v11 and v11 - 1)
                            s_4 = v23.s
                            v11 = utf8.offset(s_4, v19)
                            v3 = v8 == string.sub(s_4, utf8.offset(s_4, v7), v11 and v11 - 1)
                        end
                    end
                    if not v3 then
                        while true do
                            v4 = v21[1] and v21[1][1]
                            v5 = v21[1]
                            if v4 and v4 ~= "PRUNE" and v4 ~= "SKIP" then
                                if v4 == "alternation" then
                                    jmp = v5[2]
                                    v19 = v5[3]
                                    v6, v7 = find_alternation(v22, jmp + 1)
                                    if not v6 then
                                        table.remove(v21, 1)
                                    else
                                        v5[2] = v6
                                    end
                                    if v7 then
                                        v19 = v19 - v7
                                    end
                                    jmp = jmp + 1
                                    break
                                end
                                if v4 ~= "group" then
                                    if v4 == "quantifier" and (math.sign(v5[4] - v5[3])) == math.sign(v5[5]) then
                                        v5[3] = v5[3] + v5[5]
                                        jmp = v5[2]
                                        v19 = v5[3]
                                        jmp = jmp + 1
                                        break
                                    end
                                    table.remove(v21, 1)
                                    continue
                                end
                                if v5[7] ~= "quantifier" then
                                    if v5[7] == 33 then
                                        table.remove(v21, 1)
                                        jmp = v5[6]
                                        v19 = v5[3]
                                        jmp = jmp + 1
                                        break
                                    end
                                    table.remove(v21, 1)
                                    continue
                                end
                                if v5[12] == "greedy" then
                                    v6 = v5[10]
                                    if v5[8] <= v6 then
                                        jmp = not (v5[12] ~= "greedy") and v5[6] or v5[2]
                                        v19 = v5[3]
                                        if v5[12] == "greedy" then
                                            table.remove(v21, 1)
                                            jmp = jmp + 1
                                            break
                                        end
                                        v6 = v5[10]
                                        if not (v5[8] <= v6) then
                                            table.remove(v21, 1)
                                            continue
                                        end
                                        v5[13] = true
                                        jmp = jmp + 1
                                        break
                                    end
                                end
                                if v5[12] == "lazy" and v5[10] < v5[9] and not v5[13] then
                                    jmp = not (v5[12] ~= "greedy") and v5[6] or v5[2]
                                    v19 = v5[3]
                                    if v5[12] == "greedy" then
                                        table.remove(v21, 1)
                                        jmp = jmp + 1
                                        break
                                    end
                                    v6 = v5[10]
                                    if v5[8] <= v6 then
                                        v5[13] = true
                                        jmp = jmp + 1
                                        break
                                    end
                                end
                                table.remove(v21, 1)
                                continue
                            end
                            if v4 then
                                table.clear(v21)
                            end
                            if v23.n < v20 then
                                if v27 then
                                    return false
                                end
                                return nil
                            end
                            v20 = not (v4 ~= "SKIP") and v5[2] or v20 + 1
                            v19 = v20
                            jmp = 1
                            break
                        end
                    end
                    jmp = jmp + 1
                    continue
                end
                table.insert(v21, 1, {v1, v19})
                jmp = jmp + 1
            else
                v3 = true
                v4 = jmp
                while true do
                    v4 = v4 + 1
                    v5 = type(v22[v4]) == "table"
                    v6 = v22[v4]
                    if not v5 then
                        if not v5 or v6[1] ~= 41 then
                            if v6 then
                                continue
                            end
                        elseif v6[4] == 33 or v6[4] == 61 then
                            v3 = false
                            jmp = v4
                        elseif v6 then
                            continue
                        end
                    elseif v6[1] == 40 then
                        v4 = not (v6[1] ~= "quantifier") and v6[5][3] or v6[3]
                        if v6 then
                            continue
                        end
                    elseif v6[1] ~= "quantifier" or type(v6[5]) ~= "table" then
                        if not v5 or v6[1] ~= 41 then
                            if v6 then
                                continue
                            end
                        elseif v6[4] == 33 or v6[4] == 61 then
                            v3 = false
                            jmp = v4
                        elseif v6 then
                            continue
                        end
                    elseif v6[5][1] == 40 then
                        v4 = not (v6[1] ~= "quantifier") and v6[5][3] or v6[3]
                        if v6 then
                            continue
                        end
                    elseif not v5 or v6[1] ~= 41 then
                        if v6 then
                            continue
                        end
                    elseif v6[4] == 33 or v6[4] == 61 then
                        v3 = false
                        jmp = v4
                    elseif v6 then
                        continue
                    end
                    if v3 then
                        break
                    end
                    break
                end
            end
        else
            jmp = jmp + 1
            v1 = find_alternation(v22, jmp)
            if v1 then
                table.insert(v21, 1, {"alternation", v1, v19})
            end
        end
    end
    if v27 then
        return true
    end
    v1 = false
    v2 = table.create(v22.group_n)
    local group_n = v22.group_n
    v2[0] = {v20, v19}
    v2.n = group_n
    for i7, m in ipairs(v21) do
        if m[1] ~= "matchStart" then
            if m[1] == "group" and m[5] and not v2[m[5]] then
                v8 = m[5]
                v2[v8] = {m[3], m[4]}
            end
        elseif not v1 then
            v2[0][1] = m[2]
        elseif m[1] == "group" and m[5] and not v2[m[5]] then
            v8 = m[5]
            v2[v8] = {m[3], m[4]}
        end
    end
    return v2
end

local function u193(a1, a2, a3) -- Line: 775 -- upvalues: re_rawfind (val), to_str_arr (val)
    return (re_rawfind(a1.token, to_str_arr(a2, a3), 1, a1.flags, a1.verb_flags, true))
end

local u194 = "test"

function u6.test(...) -- Line: 171 -- upvalues: u4 (val), u194 (val), u5 (val), u193 (val)
    local v1 = select("#", ...)
    if v1 < 1 then
        error("missing argument #1 (RegEx expected)", 2)
    elseif v1 < 2 then
        error("missing argument #2 (string expected)", 2)
    end
    local v2, v3, v4, v5, v6, v7 = ...
    if not u4[v2] or u4[v2].name ~= "RegEx" then
        if type(v2) ~= "string" and type(v2) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", u194, (typeof(v2))), 2)
        end
        v2 = u5.fromstring(v2)
    elseif u194 ~= "sub" then
        if type(v3) == "number" then
            v3 = v3 .. ""
        elseif type(v3) ~= "string" then
            error(string.format("invalid argument #2 to %q (string expected, got %s)", u194, (typeof(v3))), 2)
        end
    elseif type(v4) == "number" then
        v4 = v4 .. ""
    elseif type(v4) ~= "string" then
        error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v4))), 2)
    end
    if u194 ~= "sub" and u194 ~= "split" then
        local v8 = typeof(v4)
        if v8 ~= "nil" then
            v4 = tonumber(v4)
            if not v4 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", u194, v8), 2)
            else
                v4 = if not (v4 < 0) then math.max(math.floor(v4 + 0.5), 1) else #v3 + math.floor(v4 + 0.5) + 1
            end
        end
    end
    v2 = u4[v2]
    if u194 == "match" then
        v5 = ...
    elseif u194 == "matchiter" then
        v5 = ...
    elseif u194 == "sub" then
        v7 = ...
    end
    return u193(v2, v3, v4, v5, v6, v7)
end

local function u196(a1, a2, a3, a4) -- Line: 779 -- upvalues: re_rawfind (val), to_str_arr (val), new_match (val)
    local v1 = re_rawfind(a1.token, to_str_arr(a2, a3), 1, a1.flags, a1.verb_flags, false)
    if not v1 then
        return nil
    end
    return (new_match(v1, a1.group_id, a4, a2))
end

local u197 = "match"

function u6.match(...) -- Line: 171 -- upvalues: u4 (val), u197 (val), u5 (val), u196 (val)
    local v1 = select("#", ...)
    if v1 < 1 then
        error("missing argument #1 (RegEx expected)", 2)
    elseif v1 < 2 then
        error("missing argument #2 (string expected)", 2)
    end
    local v2, v3, v4, v5, v6, v7 = ...
    if not u4[v2] or u4[v2].name ~= "RegEx" then
        if type(v2) ~= "string" and type(v2) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", u197, (typeof(v2))), 2)
        end
        v2 = u5.fromstring(v2)
    elseif u197 ~= "sub" then
        if type(v3) == "number" then
            v3 = v3 .. ""
        elseif type(v3) ~= "string" then
            error(string.format("invalid argument #2 to %q (string expected, got %s)", u197, (typeof(v3))), 2)
        end
    elseif type(v4) == "number" then
        v4 = v4 .. ""
    elseif type(v4) ~= "string" then
        error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v4))), 2)
    end
    if u197 ~= "sub" and u197 ~= "split" then
        local v8 = typeof(v4)
        if v8 ~= "nil" then
            v4 = tonumber(v4)
            if not v4 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", u197, v8), 2)
            else
                v4 = if not (v4 < 0) then math.max(math.floor(v4 + 0.5), 1) else #v3 + math.floor(v4 + 0.5) + 1
            end
        end
    end
    v2 = u4[v2]
    if u197 == "match" then
        v5 = ...
    elseif u197 == "matchiter" then
        v5 = ...
    elseif u197 == "sub" then
        v7 = ...
    end
    return u196(v2, v3, v4, v5, v6, v7)
end

local function u199(a1, a2, a3, a4) -- Line: 787 -- upvalues: to_str_arr (val), re_rawfind (val), new_match (val)
    local u8 = to_str_arr(a2, a3)
    local u9 = 1
    return function() -- Line: 790 -- upvalues: u9 (ref), u8 (ref), re_rawfind (upval), a1 (val), new_match (upval), a4 (val)
        local v1 = false
        if u9 <= u8.n + 1 then
            v1 = re_rawfind(a1.token, u8, u9, a1.flags, a1.verb_flags, false)
        end
        if not v1 then
            return nil
        end
        local v2 = v1[0][2]
        local v3 = v1[0][1]
        u9 = v2 + (if not (v1[0][2] <= v3) then 0 else 1)
        return (new_match(v1, a1.group_id, a4, u8.s))
    end
end

local u200 = "matchall"

function u6.matchall(...) -- Line: 171 -- upvalues: u4 (val), u200 (val), u5 (val), u199 (val)
    local v1 = select("#", ...)
    if v1 < 1 then
        error("missing argument #1 (RegEx expected)", 2)
    elseif v1 < 2 then
        error("missing argument #2 (string expected)", 2)
    end
    local v2, v3, v4, v5, v6, v7 = ...
    if not u4[v2] or u4[v2].name ~= "RegEx" then
        if type(v2) ~= "string" and type(v2) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", u200, (typeof(v2))), 2)
        end
        v2 = u5.fromstring(v2)
    elseif u200 ~= "sub" then
        if type(v3) == "number" then
            v3 = v3 .. ""
        elseif type(v3) ~= "string" then
            error(string.format("invalid argument #2 to %q (string expected, got %s)", u200, (typeof(v3))), 2)
        end
    elseif type(v4) == "number" then
        v4 = v4 .. ""
    elseif type(v4) ~= "string" then
        error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v4))), 2)
    end
    if u200 ~= "sub" and u200 ~= "split" then
        local v8 = typeof(v4)
        if v8 ~= "nil" then
            v4 = tonumber(v4)
            if not v4 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", u200, v8), 2)
            else
                v4 = if not (v4 < 0) then math.max(math.floor(v4 + 0.5), 1) else #v3 + math.floor(v4 + 0.5) + 1
            end
        end
    end
    v2 = u4[v2]
    if u200 == "match" then
        v5 = ...
    elseif u200 == "matchiter" then
        v5 = ...
    elseif u200 == "sub" then
        v7 = ...
    end
    return u199(v2, v3, v4, v5, v6, v7)
end

function insert_tokenized_sub(a1, a2, a3, a4) -- Line: 800 -- upvalues: insert_tokenized_sub (val)
    local move_2, v1, v2
    for i, v in ipairs(a4) do
        if type(v) ~= "table" then
            if a3[v] then
                table.move(a2, a3[v][1], a3[v][2] - 1, #a1 + 1, a1)
            end
        elseif v[1] ~= "condition" then
            move_2 = table.move
            v1 = #v
            v2 = #a1 + 1
            move_2(v, 1, v1, v2, a1)
        elseif not a3[v[2]] then
            if v[4] then
                insert_tokenized_sub(a1, a2, a3, v[4])
            end
        elseif not v[3] then
            table.move(a2, a3[v[2]][1], a3[v[2]][2] - 1, #a1 + 1, a1)
        else
            insert_tokenized_sub(a1, a2, a3, v[3])
        end
    end
    a1.n = #a1
    return a1
end

local function u203(a1, a2, a3, a4, a5, a6) -- Line: 824
    -- upvalues: to_str_arr (val), u14 (val), re_rawfind (val), insert_tokenized_sub (val), new_match (val)
    -- upvalues: from_str_arr (val)
    local s_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    if a5 ~= nil and type(a5) ~= "number" and type(a5) ~= "string" then
        error(string.format("invalid argument #5 to 'sub' (string expected, got %s)", (typeof(a5))), 3)
    end
    local v11 = {l = false, o = false, u = false}
    local v12, v13, v14, v15, v16 = a2, a4, a3, a1, a6
    for j in string.gmatch(a5 or "", utf8.charpattern) do
        if v11[j] ~= false then
            error("invalid regular expression substitution flag " .. j, 3)
        end
        v11[j] = true
    end
    local v17 = type(v12)
    if v17 == "number" then
        v12 = v12 .. ""
    elseif v17 ~= "string" and v17 ~= "function" then
        if not v11.o or v17 ~= "table" then
            error(string.format(
                "invalid argument #2 to 'sub' (string/function%s expected, got %s)",
                if not v11.o then "" else "/table",
                (typeof(v12))
            ), 3)
        end
    end
    if tonumber(v13) then
        v13 = tonumber(v13)
        if v13 <= -1 or v13 ~= v13 then
            v13 = (1 / 0)
        end
    elseif v13 == nil then
        v13 = (1 / 0)
    else
        error(string.format("invalid argument #4 to 'sub' (number expected, got %s)", (typeof(v13))), 3)
    end
    if v13 < 1 then
        return v14, 0
    end
    local v18 = 0
    if v17 == "string" then
        v12 = to_str_arr(v12)
        if not v11.l then
            local s, v19, v20
            v10 = 0
            v1 = table.create(3)
            local group_n = v15.token.group_n
            v2 = {}
            while v10 < v12.n do
                v3 = v10
                while true do
                    v3 = v3 + 1
                    if not v12[v3] or v12[v3] == 36 or v12[v3] == 92 then
                        break
                    end
                    if v12[v3] ~= 58 and v12[v3] ~= 125 then
                        continue
                    end
                    if v2[1] then
                        break
                    end
                end
                v18 = v18 + (v3 - v10 - 1)
                if 1 < v3 - v10 then
                    table.insert(v1, (table.move(v12, v10 + 1, v3 - 1, 1, (table.create(v3 - v10 - 1)))))
                end
                if v12[v3] == 58 then
                    v4 = v2[1]
                    if v4[2] then
                        error("malformed substitution pattern", 3)
                    end
                    v4[2] = (table.move(v1, v4[3], #v1, 1, table.create(#v1 + 1 - v4[3])))
                    v7 = #v1
                    v5 = v4[3]
                    for n2 = v7, v5, -1 do
                        v1[n2] = nil
                    end
                elseif v12[v3] == 125 then
                    v4 = table.remove(v2, 1)
                    v5 = table.move(v1, v4[3], #v1, 1, table.create(#v1 + 1 - v4[3]))
                    v8 = #v1
                    v6 = v4[3]
                    for k = v8, v6, -1 do
                        v1[k] = nil
                    end
                    v8 = {}
                    v19 = v4[1]
                    v20 = false
                    if v4[2] ~= true then
                        v20 = v4[2] or v5
                    end
                    v8[1] = "condition"
                    v8[2] = v19
                    v8[3] = v20
                    v8[4] = v4[2] and v5
                    table.insert(v1, v8)
                elseif v12[v3] then
                    v3 = v3 + 1
                    v4 = v12[v3]
                    if not v4 then
                        if v12[v3 - 1] == 92 then
                            error("replacement string must not end with a trailing backslash", 3)
                        end
                        v5 = v1[#v1]
                        if type(v5) ~= "table" then
                            table.insert(v1, {v12[v3 - 1]})
                        else
                            table.insert(v5, v12[v3 - 1])
                        end
                    elseif v4 ~= 92 then
                        if v4 == 48 then
                            table.insert(v1, 0)
                        elseif not (v4 > 48) then
                            if v4 ~= 123 or v12[v3 - 1] ~= 36 then
                                v5 = nil
                                if v12[v3 - 1] ~= 36 then
                                    v5 = u14[v12[v3]]
                                    if type(v5) ~= "number" then
                                        v5 = nil
                                    end
                                elseif v4 ~= 36 then
                                    v6 = v1[#v1]
                                    if type(v6) ~= "table" then
                                        table.insert(v1, {36})
                                    else
                                        table.insert(v6, 36)
                                    end
                                end
                                v6 = v1[#v1]
                                if type(v6) ~= "table" then
                                    table.insert(v1, {v5 or v12[v3]})
                                else
                                    table.insert(v6, v5 or v12[v3])
                                end
                                v18 = v18 + 1
                            else
                                v3 = v3 + 1
                                v5 = v3
                                while v12[v3] do
                                    if 48 <= v12[v3] and v12[v3] <= 57 then
                                        v3 = v3 + 1
                                        continue
                                    end
                                    if 65 <= v12[v3] and v12[v3] <= 90 then
                                        v3 = v3 + 1
                                        continue
                                    end
                                    if 97 <= v12[v3] and v12[v3] <= 122 then
                                        v3 = v3 + 1
                                        continue
                                    end
                                    if v12[v3] ~= 95 then
                                        break
                                    end
                                    v3 = v3 + 1
                                end
                                if v12[v3] == 125 then
                                    if v3 == v5 then
                                        error("malformed substitution pattern", 3)
                                    else
                                        s = v12.s
                                        v8 = utf8.offset(s, v3)
                                        v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                        if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                            v6 = v15.group_id[v6]
                                            if not v11.u then
                                                if not v6 or group_n < v6 then
                                                    error("reference to non-existent subpattern", 3)
                                                end
                                            end
                                        else
                                            v6 = tonumber(v6)
                                            if not v11.u and group_n < v6 then
                                                error("reference to non-existent subpattern", 3)
                                            end
                                        end
                                        if v12[v3] ~= 58 then
                                            table.insert(v1, v6)
                                        else
                                            v3 = v3 + 1
                                            v9 = {}
                                            v20 = v12[v3] == 45
                                            v9[1] = v6
                                            v9[2] = v20
                                            v9[3] = #v1 + 1
                                            table.insert(v2, v9)
                                        end
                                    end
                                elseif v12[v3] ~= 58 then
                                    error("malformed substitution pattern", 3)
                                elseif v12[v3 + 1] == 43 then
                                    if v3 == v5 then
                                        error("malformed substitution pattern", 3)
                                    else
                                        s = v12.s
                                        v8 = utf8.offset(s, v3)
                                        v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                        if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                            v6 = v15.group_id[v6]
                                            if not v11.u then
                                                if not v6 or group_n < v6 then
                                                    error("reference to non-existent subpattern", 3)
                                                end
                                            end
                                        else
                                            v6 = tonumber(v6)
                                            if not v11.u and group_n < v6 then
                                                error("reference to non-existent subpattern", 3)
                                            end
                                        end
                                        if v12[v3] ~= 58 then
                                            table.insert(v1, v6)
                                        else
                                            v3 = v3 + 1
                                            v9 = {}
                                            v20 = v12[v3] == 45
                                            v9[1] = v6
                                            v9[2] = v20
                                            v9[3] = #v1 + 1
                                            table.insert(v2, v9)
                                        end
                                    end
                                elseif v12[v3 + 1] ~= 45 or v3 == v5 then
                                    error("malformed substitution pattern", 3)
                                else
                                    s = v12.s
                                    v8 = utf8.offset(s, v3)
                                    v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                    if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                        v6 = v15.group_id[v6]
                                        if not v11.u then
                                            if not v6 or group_n < v6 then
                                                error("reference to non-existent subpattern", 3)
                                            end
                                        end
                                    else
                                        v6 = tonumber(v6)
                                        if not v11.u and group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                    if v12[v3] ~= 58 then
                                        table.insert(v1, v6)
                                    else
                                        v3 = v3 + 1
                                        v9 = {}
                                        v20 = v12[v3] == 45
                                        v9[1] = v6
                                        v9[2] = v20
                                        v9[3] = #v1 + 1
                                        table.insert(v2, v9)
                                    end
                                end
                            end
                        elseif v4 <= 57 then
                            v6 = v4 - 48
                            while v12[v3 + 1] do
                                if not (48 <= v12[v3 + 1]) or not (v12[v3 + 1] <= 57) then
                                    break
                                end
                                v6 = v6 .. v12[v3 + 1] - 48
                                v3 = v3 + 1
                            end
                            v6 = tonumber(v6)
                            if not v11.u and group_n < v6 then
                                error("reference to non-existent subpattern", 3)
                            end
                            table.insert(v1, v6)
                        elseif v4 ~= 123 or v12[v3 - 1] ~= 36 then
                            v5 = nil
                            if v12[v3 - 1] ~= 36 then
                                v5 = u14[v12[v3]]
                                if type(v5) ~= "number" then
                                    v5 = nil
                                end
                            elseif v4 ~= 36 then
                                v6 = v1[#v1]
                                if type(v6) ~= "table" then
                                    table.insert(v1, {36})
                                else
                                    table.insert(v6, 36)
                                end
                            end
                            v6 = v1[#v1]
                            if type(v6) ~= "table" then
                                table.insert(v1, {v5 or v12[v3]})
                            else
                                table.insert(v6, v5 or v12[v3])
                            end
                            v18 = v18 + 1
                        else
                            v3 = v3 + 1
                            v5 = v3
                            while v12[v3] do
                                if 48 <= v12[v3] and v12[v3] <= 57 then
                                    v3 = v3 + 1
                                    continue
                                end
                                if 65 <= v12[v3] and v12[v3] <= 90 then
                                    v3 = v3 + 1
                                    continue
                                end
                                if 97 <= v12[v3] and v12[v3] <= 122 then
                                    v3 = v3 + 1
                                    continue
                                end
                                if v12[v3] ~= 95 then
                                    break
                                end
                                v3 = v3 + 1
                            end
                            if v12[v3] == 125 then
                                if v3 == v5 then
                                    error("malformed substitution pattern", 3)
                                else
                                    s = v12.s
                                    v8 = utf8.offset(s, v3)
                                    v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                    if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                        v6 = v15.group_id[v6]
                                        if not v11.u then
                                            if not v6 or group_n < v6 then
                                                error("reference to non-existent subpattern", 3)
                                            end
                                        end
                                    else
                                        v6 = tonumber(v6)
                                        if not v11.u and group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                    if v12[v3] ~= 58 then
                                        table.insert(v1, v6)
                                    else
                                        v3 = v3 + 1
                                        v9 = {}
                                        v20 = v12[v3] == 45
                                        v9[1] = v6
                                        v9[2] = v20
                                        v9[3] = #v1 + 1
                                        table.insert(v2, v9)
                                    end
                                end
                            elseif v12[v3] ~= 58 then
                                error("malformed substitution pattern", 3)
                            elseif v12[v3 + 1] == 43 then
                                if v3 == v5 then
                                    error("malformed substitution pattern", 3)
                                else
                                    s = v12.s
                                    v8 = utf8.offset(s, v3)
                                    v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                    if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                        v6 = v15.group_id[v6]
                                        if not v11.u then
                                            if not v6 or group_n < v6 then
                                                error("reference to non-existent subpattern", 3)
                                            end
                                        end
                                    else
                                        v6 = tonumber(v6)
                                        if not v11.u and group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                    if v12[v3] ~= 58 then
                                        table.insert(v1, v6)
                                    else
                                        v3 = v3 + 1
                                        v9 = {}
                                        v20 = v12[v3] == 45
                                        v9[1] = v6
                                        v9[2] = v20
                                        v9[3] = #v1 + 1
                                        table.insert(v2, v9)
                                    end
                                end
                            elseif v12[v3 + 1] ~= 45 or v3 == v5 then
                                error("malformed substitution pattern", 3)
                            else
                                s = v12.s
                                v8 = utf8.offset(s, v3)
                                v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                    v6 = v15.group_id[v6]
                                    if not v11.u then
                                        if not v6 or group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                else
                                    v6 = tonumber(v6)
                                    if not v11.u and group_n < v6 then
                                        error("reference to non-existent subpattern", 3)
                                    end
                                end
                                if v12[v3] ~= 58 then
                                    table.insert(v1, v6)
                                else
                                    v3 = v3 + 1
                                    v9 = {}
                                    v20 = v12[v3] == 45
                                    v9[1] = v6
                                    v9[2] = v20
                                    v9[3] = #v1 + 1
                                    table.insert(v2, v9)
                                end
                            end
                        end
                    elseif v12[v3 - 1] == 36 then
                        v5 = v1[#v1]
                        if type(v5) ~= "table" then
                            table.insert(v1, {36})
                        else
                            table.insert(v5, 36)
                        end
                        v3 = v3 - 1
                        v18 = v18 + 1
                    elseif v4 == 48 then
                        table.insert(v1, 0)
                    elseif not (v4 > 48) then
                        if v4 ~= 123 or v12[v3 - 1] ~= 36 then
                            v5 = nil
                            if v12[v3 - 1] ~= 36 then
                                v5 = u14[v12[v3]]
                                if type(v5) ~= "number" then
                                    v5 = nil
                                end
                            elseif v4 ~= 36 then
                                v6 = v1[#v1]
                                if type(v6) ~= "table" then
                                    table.insert(v1, {36})
                                else
                                    table.insert(v6, 36)
                                end
                            end
                            v6 = v1[#v1]
                            if type(v6) ~= "table" then
                                table.insert(v1, {v5 or v12[v3]})
                            else
                                table.insert(v6, v5 or v12[v3])
                            end
                            v18 = v18 + 1
                        else
                            v3 = v3 + 1
                            v5 = v3
                            while v12[v3] do
                                if 48 <= v12[v3] and v12[v3] <= 57 then
                                    v3 = v3 + 1
                                    continue
                                end
                                if 65 <= v12[v3] and v12[v3] <= 90 then
                                    v3 = v3 + 1
                                    continue
                                end
                                if 97 <= v12[v3] and v12[v3] <= 122 then
                                    v3 = v3 + 1
                                    continue
                                end
                                if v12[v3] ~= 95 then
                                    break
                                end
                                v3 = v3 + 1
                            end
                            if v12[v3] == 125 then
                                if v3 == v5 then
                                    error("malformed substitution pattern", 3)
                                else
                                    s = v12.s
                                    v8 = utf8.offset(s, v3)
                                    v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                    if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                        v6 = v15.group_id[v6]
                                        if not v11.u then
                                            if not v6 or group_n < v6 then
                                                error("reference to non-existent subpattern", 3)
                                            end
                                        end
                                    else
                                        v6 = tonumber(v6)
                                        if not v11.u and group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                    if v12[v3] ~= 58 then
                                        table.insert(v1, v6)
                                    else
                                        v3 = v3 + 1
                                        v9 = {}
                                        v20 = v12[v3] == 45
                                        v9[1] = v6
                                        v9[2] = v20
                                        v9[3] = #v1 + 1
                                        table.insert(v2, v9)
                                    end
                                end
                            elseif v12[v3] ~= 58 then
                                error("malformed substitution pattern", 3)
                            elseif v12[v3 + 1] == 43 then
                                if v3 == v5 then
                                    error("malformed substitution pattern", 3)
                                else
                                    s = v12.s
                                    v8 = utf8.offset(s, v3)
                                    v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                    if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                        v6 = v15.group_id[v6]
                                        if not v11.u then
                                            if not v6 or group_n < v6 then
                                                error("reference to non-existent subpattern", 3)
                                            end
                                        end
                                    else
                                        v6 = tonumber(v6)
                                        if not v11.u and group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                    if v12[v3] ~= 58 then
                                        table.insert(v1, v6)
                                    else
                                        v3 = v3 + 1
                                        v9 = {}
                                        v20 = v12[v3] == 45
                                        v9[1] = v6
                                        v9[2] = v20
                                        v9[3] = #v1 + 1
                                        table.insert(v2, v9)
                                    end
                                end
                            elseif v12[v3 + 1] ~= 45 or v3 == v5 then
                                error("malformed substitution pattern", 3)
                            else
                                s = v12.s
                                v8 = utf8.offset(s, v3)
                                v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                    v6 = v15.group_id[v6]
                                    if not v11.u then
                                        if not v6 or group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                else
                                    v6 = tonumber(v6)
                                    if not v11.u and group_n < v6 then
                                        error("reference to non-existent subpattern", 3)
                                    end
                                end
                                if v12[v3] ~= 58 then
                                    table.insert(v1, v6)
                                else
                                    v3 = v3 + 1
                                    v9 = {}
                                    v20 = v12[v3] == 45
                                    v9[1] = v6
                                    v9[2] = v20
                                    v9[3] = #v1 + 1
                                    table.insert(v2, v9)
                                end
                            end
                        end
                    elseif v4 <= 57 then
                        v6 = v4 - 48
                        while v12[v3 + 1] do
                            if not (48 <= v12[v3 + 1]) or not (v12[v3 + 1] <= 57) then
                                break
                            end
                            v6 = v6 .. v12[v3 + 1] - 48
                            v3 = v3 + 1
                        end
                        v6 = tonumber(v6)
                        if not v11.u and group_n < v6 then
                            error("reference to non-existent subpattern", 3)
                        end
                        table.insert(v1, v6)
                    elseif v4 ~= 123 or v12[v3 - 1] ~= 36 then
                        v5 = nil
                        if v12[v3 - 1] ~= 36 then
                            v5 = u14[v12[v3]]
                            if type(v5) ~= "number" then
                                v5 = nil
                            end
                        elseif v4 ~= 36 then
                            v6 = v1[#v1]
                            if type(v6) ~= "table" then
                                table.insert(v1, {36})
                            else
                                table.insert(v6, 36)
                            end
                        end
                        v6 = v1[#v1]
                        if type(v6) ~= "table" then
                            table.insert(v1, {v5 or v12[v3]})
                        else
                            table.insert(v6, v5 or v12[v3])
                        end
                        v18 = v18 + 1
                    else
                        v3 = v3 + 1
                        v5 = v3
                        while v12[v3] do
                            if 48 <= v12[v3] and v12[v3] <= 57 then
                                v3 = v3 + 1
                                continue
                            end
                            if 65 <= v12[v3] and v12[v3] <= 90 then
                                v3 = v3 + 1
                                continue
                            end
                            if 97 <= v12[v3] and v12[v3] <= 122 then
                                v3 = v3 + 1
                                continue
                            end
                            if v12[v3] ~= 95 then
                                break
                            end
                            v3 = v3 + 1
                        end
                        if v12[v3] == 125 then
                            if v3 == v5 then
                                error("malformed substitution pattern", 3)
                            else
                                s = v12.s
                                v8 = utf8.offset(s, v3)
                                v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                    v6 = v15.group_id[v6]
                                    if not v11.u then
                                        if not v6 or group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                else
                                    v6 = tonumber(v6)
                                    if not v11.u and group_n < v6 then
                                        error("reference to non-existent subpattern", 3)
                                    end
                                end
                                if v12[v3] ~= 58 then
                                    table.insert(v1, v6)
                                else
                                    v3 = v3 + 1
                                    v9 = {}
                                    v20 = v12[v3] == 45
                                    v9[1] = v6
                                    v9[2] = v20
                                    v9[3] = #v1 + 1
                                    table.insert(v2, v9)
                                end
                            end
                        elseif v12[v3] ~= 58 then
                            error("malformed substitution pattern", 3)
                        elseif v12[v3 + 1] == 43 then
                            if v3 == v5 then
                                error("malformed substitution pattern", 3)
                            else
                                s = v12.s
                                v8 = utf8.offset(s, v3)
                                v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                                if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                    v6 = v15.group_id[v6]
                                    if not v11.u then
                                        if not v6 or group_n < v6 then
                                            error("reference to non-existent subpattern", 3)
                                        end
                                    end
                                else
                                    v6 = tonumber(v6)
                                    if not v11.u and group_n < v6 then
                                        error("reference to non-existent subpattern", 3)
                                    end
                                end
                                if v12[v3] ~= 58 then
                                    table.insert(v1, v6)
                                else
                                    v3 = v3 + 1
                                    v9 = {}
                                    v20 = v12[v3] == 45
                                    v9[1] = v6
                                    v9[2] = v20
                                    v9[3] = #v1 + 1
                                    table.insert(v2, v9)
                                end
                            end
                        elseif v12[v3 + 1] ~= 45 or v3 == v5 then
                            error("malformed substitution pattern", 3)
                        else
                            s = v12.s
                            v8 = utf8.offset(s, v3)
                            v6 = string.sub(s, utf8.offset(s, v5), v8 and v8 - 1)
                            if not (48 <= v12[v5]) or not (v12[v5] <= 57) then
                                v6 = v15.group_id[v6]
                                if not v11.u then
                                    if not v6 or group_n < v6 then
                                        error("reference to non-existent subpattern", 3)
                                    end
                                end
                            else
                                v6 = tonumber(v6)
                                if not v11.u and group_n < v6 then
                                    error("reference to non-existent subpattern", 3)
                                end
                            end
                            if v12[v3] ~= 58 then
                                table.insert(v1, v6)
                            else
                                v3 = v3 + 1
                                v9 = {}
                                v20 = v12[v3] == 45
                                v9[1] = v6
                                v9[2] = v20
                                v9[3] = #v1 + 1
                                table.insert(v2, v9)
                            end
                        end
                    end
                end
                v10 = v3
            end
            if v2[1] then
                error("malformed substitution pattern", 3)
            end
            if v1[2] or type(v1[1]) ~= "table" or v1[1][1] == "condition" then
                v12 = v1
                v17 = "subst_string"
            else
                v3 = v1[1]
                v12.n = #v1[1]
                v12 = v3
            end
        end
    end
    v14 = to_str_arr(v14)
    v10 = 0
    v1 = 1
    local v21 = 0
    while v1 <= v14.n + v10 + 1 do
        v2 = re_rawfind(v15.token, v14, v1, v15.flags, v15.verb_flags, false)
        if not v2 then
            break
        end
        v3 = nil
        if v17 == "string" then
            v3 = v12
        elseif v17 ~= "subst_string" then
            if v17 ~= "table" then
                v5 = v12((new_match(v2, v15.group_id, v16, v14.s)))
            else
                s_2 = v14.s
                v7 = v2[0][1]
                v8 = v2[0][2]
                v8 = utf8.offset(s_2, v8)
                v5 = v12[(string.sub(s_2, utf8.offset(s_2, v7), v8 and v8 - 1))]
            end
            if v5 == v4 then
                v6 = v2[0][2] - v2[0][1]
                v3 = table.move(v14, v2[0][1], v2[0][2] - 1, 1, table.create(v6))
                v3.n = v6
            elseif not v11.o then
                if type(v5) == "string" then
                    v3 = to_str_arr(v5)
                elseif type(v5) == "number" then
                    v3 = to_str_arr(v5 .. "")
                elseif not v11.o then
                    v3 = {n = 0}
                else
                    error(string.format("invalid replacement value (a %s)", (type(v5))), 3)
                end
            elseif not v5 then
                v6 = v2[0][2] - v2[0][1]
                v3 = table.move(v14, v2[0][1], v2[0][2] - 1, 1, table.create(v6))
                v3.n = v6
            elseif type(v5) == "string" then
                v3 = to_str_arr(v5)
            elseif type(v5) == "number" then
                v3 = to_str_arr(v5 .. "")
            elseif not v11.o then
                v3 = {n = 0}
            else
                error(string.format("invalid replacement value (a %s)", (type(v5))), 3)
            end
        else
            v3 = insert_tokenized_sub(table.create(v18), v14, v2, v12)
        end
        v4 = v2[0][2] - v2[0][1]
        v5 = math.min(v3.n, v4)
        v6 = v5 - 1
        for m = 0, v6 do
            v9 = v2[0][1] + m
            v14[v9] = v3[m + 1]
        end
        v6 = v2[0][1] + v5
        v1 = v2[0][2]
        if v3.n < v4 then
            v7 = v4 - v3.n
            for i6 = 1, v7 do
                table.remove(v14, v6)
                v10 = v10 - 1
                v1 = v1 - 1
            end
        elseif v4 < v3.n then
            v7 = v3.n - v4
            for i5 = 1, v7 do
                table.insert(v14, v6 + i5 - 1, v3[v5 + i5])
                v10 = v10 + 1
                v1 = v1 + 1
            end
        end
        if v4 <= 0 then
            v1 = v1 + 1
        end
        v21 = v21 + 1
        if v13 < v21 + 1 then
            break
        end
    end
    return (from_str_arr(v14)), v21
end

local u204 = "sub"

function u6.sub(...) -- Line: 171 -- upvalues: u4 (val), u204 (val), u5 (val), u203 (val)
    local v1 = select("#", ...)
    if v1 < 1 then
        error("missing argument #1 (RegEx expected)", 2)
    elseif v1 < 2 then
        error("missing argument #2 (string expected)", 2)
    end
    local v2, v3, v4, v5, v6, v7 = ...
    if not u4[v2] or u4[v2].name ~= "RegEx" then
        if type(v2) ~= "string" and type(v2) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", u204, (typeof(v2))), 2)
        end
        v2 = u5.fromstring(v2)
    elseif u204 ~= "sub" then
        if type(v3) == "number" then
            v3 = v3 .. ""
        elseif type(v3) ~= "string" then
            error(string.format("invalid argument #2 to %q (string expected, got %s)", u204, (typeof(v3))), 2)
        end
    elseif type(v4) == "number" then
        v4 = v4 .. ""
    elseif type(v4) ~= "string" then
        error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v4))), 2)
    end
    if u204 ~= "sub" and u204 ~= "split" then
        local v8 = typeof(v4)
        if v8 ~= "nil" then
            v4 = tonumber(v4)
            if not v4 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", u204, v8), 2)
            else
                v4 = if not (v4 < 0) then math.max(math.floor(v4 + 0.5), 1) else #v3 + math.floor(v4 + 0.5) + 1
            end
        end
    end
    v2 = u4[v2]
    if u204 == "match" then
        v5 = ...
    elseif u204 == "matchiter" then
        v5 = ...
    elseif u204 == "sub" then
        v7 = ...
    end
    return u203(v2, v3, v4, v5, v6, v7)
end

local function u206(a1, a2, a3) -- Line: 1062 -- upvalues: to_str_arr (val), re_rawfind (val)
    local s, v1, v2, v3, v4
    if tonumber(a3) then
        a3 = tonumber(a3)
        if a3 <= -1 or a3 ~= a3 then
            a3 = (1 / 0)
        end
    elseif a3 == nil then
        a3 = (1 / 0)
    else
        error(string.format("invalid argument #3 to 'split' (number expected, got %s)", (typeof(a3))), 3)
    end
    local v5 = to_str_arr(a2)
    local v6 = 1
    local v7 = 0
    local v8 = {}
    local v9 = 0
    while v6 <= v5.n + 1 do
        v7 = v7 + 1
        v3 = false
        if v7 <= a3 then
            v3 = re_rawfind(a1.token, v5, v6, a1.flags, a1.verb_flags, false)
        end
        if not v3 then
            break
        end
        s = v5.s
        v1 = v6 - v9
        v2 = v3[0][1]
        v2 = utf8.offset(s, v2)
        table.insert(v8, (string.sub(s, utf8.offset(s, v1), v2 and v2 - 1)))
        v4 = v3[0][1]
        v9 = if not (v3[0][2] <= v4) then 0 else 1
        v6 = v3[0][2] + v9
    end
    table.insert(v8, (string.sub(v5.s, (utf8.offset(v5.s, v6 - v9)))))
    return v8
end

local u207 = "split"

function u6.split(...) -- Line: 171 -- upvalues: u4 (val), u207 (val), u5 (val), u206 (val)
    local v1 = select("#", ...)
    if v1 < 1 then
        error("missing argument #1 (RegEx expected)", 2)
    elseif v1 < 2 then
        error("missing argument #2 (string expected)", 2)
    end
    local v2, v3, v4, v5, v6, v7 = ...
    if not u4[v2] or u4[v2].name ~= "RegEx" then
        if type(v2) ~= "string" and type(v2) ~= "number" then
            error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", u207, (typeof(v2))), 2)
        end
        v2 = u5.fromstring(v2)
    elseif u207 ~= "sub" then
        if type(v3) == "number" then
            v3 = v3 .. ""
        elseif type(v3) ~= "string" then
            error(string.format("invalid argument #2 to %q (string expected, got %s)", u207, (typeof(v3))), 2)
        end
    elseif type(v4) == "number" then
        v4 = v4 .. ""
    elseif type(v4) ~= "string" then
        error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(v4))), 2)
    end
    if u207 ~= "sub" and u207 ~= "split" then
        local v8 = typeof(v4)
        if v8 ~= "nil" then
            v4 = tonumber(v4)
            if not v4 then
                error(string.format("invalid argument #3 to %q (number expected, got %s)", u207, v8), 2)
            else
                v4 = if not (v4 < 0) then math.max(math.floor(v4 + 0.5), 1) else #v3 + math.floor(v4 + 0.5) + 1
            end
        end
    end
    v2 = u4[v2]
    if u207 == "match" then
        v5 = ...
    elseif u207 == "matchiter" then
        v5 = ...
    elseif u207 == "sub" then
        v7 = ...
    end
    return u206(v2, v3, v4, v5, v6, v7)
end

local function re_index(a1, a2) -- Line: 1092 -- upvalues: u6 (ref), u4 (val)
    return u6[a2] or u4[a1].flags[a2]
end

local function re_tostr(a1) -- Line: 1096 -- upvalues: u4 (val)
    return u4[a1].pattern_repr .. u4[a1].flag_repr
end

local u211 = {
    [58] = true,
    [33] = true,
    [61] = true,
    [62] = true,
    [124] = true,
}

local function tokenize_ptn(a1, a2) -- Line: 1112
    -- upvalues: u188 (val), u211 (val), u168 (val), u164 (val), u14 (val), u13 (val), u63 (val), u166 (val), u162 (val)
    local s, s_10, s_11, s_12, s_13, s_14, s_15, s_16, s_2, s_3, s_4, s_5, s_6, s_7, s_8, s_9, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12
    if a2.unicode then
        return "options.unicodeData cannot be turned off while having unicode flag"
    end
    local v13 = 1
    local n = a1.n
    local v14 = 0
    local v15 = {}
    local v16 = {}
    local v17 = {newline = 1, newline_seq = 1, not_empty = 0}
    local v18, v19 = a1, a2
    while v13 <= n do
        v11 = v18[v13]
        if v11 == 40 then
            v12 = nil
            if v18[v13 + 1] == 42 then
                v13 = v13 + 2
                v1 = v13
                while v18[v13] do
                    if 48 <= v18[v13] and v18[v13] <= 57 then
                        v13 = v13 + 1
                        continue
                    end
                    if 65 <= v18[v13] and v18[v13] <= 90 then
                        v13 = v13 + 1
                        continue
                    end
                    if 97 <= v18[v13] and v18[v13] <= 122 then
                        v13 = v13 + 1
                        continue
                    end
                    if v18[v13] ~= 95 and v18[v13] ~= 58 then
                        break
                    end
                    v13 = v13 + 1
                end
                if v18[v13] ~= 41 and v18[v13 - 1] ~= 58 then
                    return "quantifier doesn't follow a repeatable pattern"
                end
                s = v18.s
                v4 = utf8.offset(s, v13)
                v2 = string.sub(s, utf8.offset(s, v1), v4 and v4 - 1)
                if v2 ~= "positive_lookahead:"
                    and v2 ~= "negative_lookhead:"
                    and v2 ~= "positive_lookbehind:"
                    and v2 ~= "negative_lookbehind:"
                    and not v2:find("^[pn]l[ab]:$") then
                    if v2 == "atomic:" then
                        v12 = {40, nil, nil, 62, nil}
                        if v12 then
                            table.insert(v15, v12)
                        end
                        v13 = v13 + 1
                        continue
                    end
                    if v2 ~= "ACCEPT" and v2 ~= "FAIL" and v2 ~= "F" and v2 ~= "PRUNE" and v2 ~= "SKIP" then
                        if u188[v2] then
                            v17.newline = v2
                            if v15[1] then
                                return "this verb must be placed at the beginning of the regex"
                            end
                            if v12 then
                                table.insert(v15, v12)
                            end
                            v13 = v13 + 1
                            continue
                        end
                        if v2 ~= "BSR_ANYCRLF" and v2 ~= "BSR_UNICODE" then
                            if v2 ~= "NOTEMPTY" and v2 ~= "NOTEMPTY_ATSTART" then
                                return "unknown or malformed verb"
                            end
                            v17.not_empty = if v2 ~= "NOTEMPTY" then 2 else 1
                            if v15[1] then
                                return "this verb must be placed at the beginning of the regex"
                            end
                            if v12 then
                                table.insert(v15, v12)
                            end
                            v13 = v13 + 1
                            continue
                        end
                        v17.newline_seq = if v2 ~= "BSR_UNICODE" then 0 else 1
                        if v15[1] then
                            return "this verb must be placed at the beginning of the regex"
                        end
                        if v12 then
                            table.insert(v15, v12)
                        end
                        v13 = v13 + 1
                        continue
                    end
                    v12 = if v2 ~= "F" then v2 else "FAIL"
                    if v12 then
                        table.insert(v15, v12)
                    end
                    v13 = v13 + 1
                    continue
                end
                v12 = {
                    40,
                    nil,
                    nil,
                    if not v2:find("^n") then 61 else 33,
                    v2:find("b", 3, true) and 1,
                }
                if v12 then
                    table.insert(v15, v12)
                end
            elseif v18[v13 + 1] ~= 63 then
                v14 = v14 + 1
                v12 = {40, v14, nil, nil}
                if v12 then
                    table.insert(v15, v12)
                end
            else
                v13 = v13 + 2
                if v18[v13] ~= 35 then
                    if not v18[v13] then
                        return "unterminated parenthetical"
                    end
                    v1 = {40, nil, nil, v18[v13], nil}
                    v12 = v1
                    if v18[v13] == 48 and v18[v13 + 1] == 41 then
                        v12[1] = "recurmatch"
                        v12[2] = 0
                        v12[3] = 0
                        v12[5] = nil
                        if v12 then
                            table.insert(v15, v12)
                        end
                        v13 = v13 + 1
                        continue
                    end
                    if 48 < v18[v13] and v18[v13] <= 57 then
                        v1 = v13
                        v13 = v13 + 1
                        while 48 <= v18[v13] do
                            if not (v18[v13] <= 48) then
                                break
                            end
                            v13 = v13 + 1
                        end
                        if v18[v13] ~= 41 then
                            return "invalid group structure"
                        end
                        s_2 = v18.s
                        v6 = utf8.offset(s_2, v13)
                        v3 = tonumber((string.sub(s_2, utf8.offset(s_2, v1), v6 and v6 - 1)))
                        v12[1] = "recurmatch"
                        v12[2] = v3
                        v12[4] = nil
                        if v12 then
                            table.insert(v15, v12)
                        end
                        v13 = v13 + 1
                        continue
                    end
                    if v18[v13] == 60 and v18[v13 + 1] == 33 then
                        v13 = v13 + 1
                        v12[4] = v18[v13]
                        v12[5] = 1
                        if v12 then
                            table.insert(v15, v12)
                        end
                        v13 = v13 + 1
                        continue
                    end
                    if v18[v13 + 1] == 61 then
                        v13 = v13 + 1
                        v12[4] = v18[v13]
                        v12[5] = 1
                    elseif v18[v13] ~= 124 then
                        if v18[v13] ~= 80 and v18[v13] ~= 60 and v18[v13] ~= 39 then
                            if not u211[v18[v13]] then
                                return "invalid group structure"
                            end
                            if v12 then
                                table.insert(v15, v12)
                            end
                            v13 = v13 + 1
                            continue
                        end
                        if v18[v13] == 80 then
                            v13 = v13 + 1
                        end
                        if v18[v13] == 61 then
                            v1 = v13 + 1
                            while v18[v13] do
                                if 48 <= v18[v13] and v18[v13] <= 57 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 65 <= v18[v13] and v18[v13] <= 90 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 97 <= v18[v13] and v18[v13] <= 122 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if v18[v13] ~= 95 then
                                    break
                                end
                                v13 = v13 + 1
                            end
                            if not v18[v13] then
                                return "unterminated parenthetical"
                            end
                            if v18[v13] == 41 and v13 ~= v1 then
                                v2 = {}
                                s_3 = v18.s
                                v6 = utf8.offset(s_3, v13)
                                v9 = utf8.offset(s_3, v1)
                                v2[1] = "backref"
                                v2[2] = (string.sub(s_3, v9, v6 and v6 - 1))
                                v12 = v2
                                if v12 then
                                    table.insert(v15, v12)
                                end
                                v13 = v13 + 1
                                continue
                            end
                            return "invalid group structure"
                        end
                        if v18[v13] ~= 60 then
                            if v18[v13 - 1] ~= 80 and v18[v13] == 39 then
                                v1 = if v18[v13] ~= 39 then 62 else 39
                                v2 = v13 + 1
                                v13 = v13 + 1
                                if v18[v13] == 41 then
                                    return "missing character in subpattern"
                                end
                                if 48 <= v18[v13] and v18[v13] <= 57 then
                                    return "subpattern name must not begin with a digit"
                                end
                                if 65 <= v18[v13] and v18[v13] <= 90 then
                                    v13 = v13 + 1
                                    while v18[v13] do
                                        if 48 <= v18[v13] and v18[v13] <= 57 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if 65 <= v18[v13] and v18[v13] <= 90 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if 97 <= v18[v13] and v18[v13] <= 122 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if v18[v13] ~= 95 then
                                            break
                                        end
                                        v13 = v13 + 1
                                    end
                                    if not v18[v13] then
                                        return "unterminated parenthetical"
                                    end
                                    if v18[v13] ~= v1 then
                                        return "invalid character in subpattern"
                                    end
                                    s_4 = v18.s
                                    v5 = utf8.offset(s_4, v13)
                                    v3 = string.sub(s_4, utf8.offset(s_4, v2), v5 and v5 - 1)
                                    v14 = v14 + 1
                                    if (v16[v3] or v14) ~= v14 then
                                        return "subpattern name already exists"
                                    end
                                    for k, v in pairs(v16) do
                                        if v3 ~= k and v14 == v then
                                            return "different names for subpatterns of the same number aren't permitted"
                                        end
                                    end
                                    v16[v3] = v14
                                    v12[2] = v14
                                    v12[4] = nil
                                    if v12 then
                                        table.insert(v15, v12)
                                    end
                                    v13 = v13 + 1
                                    continue
                                end
                                if 97 <= v18[v13] and v18[v13] <= 122 then
                                    v13 = v13 + 1
                                    while v18[v13] do
                                        if 48 <= v18[v13] and v18[v13] <= 57 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if 65 <= v18[v13] and v18[v13] <= 90 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if 97 <= v18[v13] and v18[v13] <= 122 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if v18[v13] ~= 95 then
                                            break
                                        end
                                        v13 = v13 + 1
                                    end
                                    if not v18[v13] then
                                        return "unterminated parenthetical"
                                    end
                                    if v18[v13] ~= v1 then
                                        return "invalid character in subpattern"
                                    end
                                    s_4 = v18.s
                                    v5 = utf8.offset(s_4, v13)
                                    v3 = string.sub(s_4, utf8.offset(s_4, v2), v5 and v5 - 1)
                                    v14 = v14 + 1
                                    if (v16[v3] or v14) ~= v14 then
                                        return "subpattern name already exists"
                                    end
                                    for k2, i in pairs(v16) do
                                        if v3 ~= k2 and v14 == i then
                                            return "different names for subpatterns of the same number aren't permitted"
                                        end
                                    end
                                    v16[v3] = v14
                                    v12[2] = v14
                                    v12[4] = nil
                                    if v12 then
                                        table.insert(v15, v12)
                                    end
                                    v13 = v13 + 1
                                    continue
                                end
                                if v18[v13] ~= 95 then
                                    return "invalid character in subpattern"
                                end
                                v13 = v13 + 1
                                while v18[v13] do
                                    if 48 <= v18[v13] and v18[v13] <= 57 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if 65 <= v18[v13] and v18[v13] <= 90 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if 97 <= v18[v13] and v18[v13] <= 122 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if v18[v13] ~= 95 then
                                        break
                                    end
                                    v13 = v13 + 1
                                end
                                if not v18[v13] then
                                    return "unterminated parenthetical"
                                end
                                if v18[v13] ~= v1 then
                                    return "invalid character in subpattern"
                                end
                                s_4 = v18.s
                                v5 = utf8.offset(s_4, v13)
                                v3 = string.sub(s_4, utf8.offset(s_4, v2), v5 and v5 - 1)
                                v14 = v14 + 1
                                if (v16[v3] or v14) ~= v14 then
                                    return "subpattern name already exists"
                                end
                                for k3, j in pairs(v16) do
                                    if v3 ~= k3 and v14 == j then
                                        return "different names for subpatterns of the same number aren't permitted"
                                    end
                                end
                                v16[v3] = v14
                                v12[2] = v14
                                v12[4] = nil
                                if v12 then
                                    table.insert(v15, v12)
                                end
                                v13 = v13 + 1
                                continue
                            end
                            return "invalid group structure"
                        end
                        v1 = if v18[v13] ~= 39 then 62 else 39
                        v2 = v13 + 1
                        v13 = v13 + 1
                        if v18[v13] == 41 then
                            return "missing character in subpattern"
                        end
                        if 48 <= v18[v13] and v18[v13] <= 57 then
                            return "subpattern name must not begin with a digit"
                        end
                        if 65 <= v18[v13] and v18[v13] <= 90 then
                            v13 = v13 + 1
                            while v18[v13] do
                                if 48 <= v18[v13] and v18[v13] <= 57 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 65 <= v18[v13] and v18[v13] <= 90 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 97 <= v18[v13] and v18[v13] <= 122 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if v18[v13] ~= 95 then
                                    break
                                end
                                v13 = v13 + 1
                            end
                            if not v18[v13] then
                                return "unterminated parenthetical"
                            end
                            if v18[v13] ~= v1 then
                                return "invalid character in subpattern"
                            end
                            s_4 = v18.s
                            v5 = utf8.offset(s_4, v13)
                            v3 = string.sub(s_4, utf8.offset(s_4, v2), v5 and v5 - 1)
                            v14 = v14 + 1
                            if (v16[v3] or v14) ~= v14 then
                                return "subpattern name already exists"
                            end
                            for k4, k5 in pairs(v16) do
                                if v3 ~= k4 and v14 == k5 then
                                    return "different names for subpatterns of the same number aren't permitted"
                                end
                            end
                            v16[v3] = v14
                            v12[2] = v14
                            v12[4] = nil
                            if v12 then
                                table.insert(v15, v12)
                            end
                            v13 = v13 + 1
                            continue
                        end
                        if 97 <= v18[v13] and v18[v13] <= 122 then
                            v13 = v13 + 1
                            while v18[v13] do
                                if 48 <= v18[v13] and v18[v13] <= 57 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 65 <= v18[v13] and v18[v13] <= 90 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 97 <= v18[v13] and v18[v13] <= 122 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if v18[v13] ~= 95 then
                                    break
                                end
                                v13 = v13 + 1
                            end
                            if not v18[v13] then
                                return "unterminated parenthetical"
                            end
                            if v18[v13] ~= v1 then
                                return "invalid character in subpattern"
                            end
                            s_4 = v18.s
                            v5 = utf8.offset(s_4, v13)
                            v3 = string.sub(s_4, utf8.offset(s_4, v2), v5 and v5 - 1)
                            v14 = v14 + 1
                            if (v16[v3] or v14) ~= v14 then
                                return "subpattern name already exists"
                            end
                            for k6, n2 in pairs(v16) do
                                if v3 ~= k6 and v14 == n2 then
                                    return "different names for subpatterns of the same number aren't permitted"
                                end
                            end
                            v16[v3] = v14
                            v12[2] = v14
                            v12[4] = nil
                            if v12 then
                                table.insert(v15, v12)
                            end
                            v13 = v13 + 1
                            continue
                        end
                        if v18[v13] ~= 95 then
                            return "invalid character in subpattern"
                        end
                        v13 = v13 + 1
                        while v18[v13] do
                            if 48 <= v18[v13] and v18[v13] <= 57 then
                                v13 = v13 + 1
                                continue
                            end
                            if 65 <= v18[v13] and v18[v13] <= 90 then
                                v13 = v13 + 1
                                continue
                            end
                            if 97 <= v18[v13] and v18[v13] <= 122 then
                                v13 = v13 + 1
                                continue
                            end
                            if v18[v13] ~= 95 then
                                break
                            end
                            v13 = v13 + 1
                        end
                        if not v18[v13] then
                            return "unterminated parenthetical"
                        end
                        if v18[v13] ~= v1 then
                            return "invalid character in subpattern"
                        end
                        s_4 = v18.s
                        v5 = utf8.offset(s_4, v13)
                        v3 = string.sub(s_4, utf8.offset(s_4, v2), v5 and v5 - 1)
                        v14 = v14 + 1
                        if (v16[v3] or v14) ~= v14 then
                            return "subpattern name already exists"
                        end
                        for k7, m in pairs(v16) do
                            if v3 ~= k7 and v14 == m then
                                return "different names for subpatterns of the same number aren't permitted"
                            end
                        end
                        v16[v3] = v14
                        v12[2] = v14
                        v12[4] = nil
                    else
                        v12[5] = v14
                    end
                    if v12 then
                        table.insert(v15, v12)
                    end
                else
                    v13 = table.find(v18, 41, v13)
                    if not v13 then
                        return "unterminated parenthetical"
                    end
                end
            end
            v13 = v13 + 1
        elseif v11 == 41 then
            v12 = #v15 + 1
            v1 = -1
            v2 = 0
            v3 = 0
            v4 = 0
            while true do
                v12 = v12 - 1
                v5 = v15[v12]
                v6 = type(v15[v12]) == "table"
                if not v6 or v5[1] ~= 40 then
                    if v5 == u168 then
                        v1 = if v2 == v1 or v1 == -1 then v2 else nil
                        v3 = math.max(v3, v4)
                    elseif v2 then
                        v2 = if not v6 then v2 + 1 else if v5[1] ~= "quantifier" then v2 + 1 else if v5[2] ~= v5[3] then nil else v2 + v5[2]
                    end
                    if not (v12 < 1) then
                        continue
                    end
                else
                    v4 = v4 + 1
                    if v2 and v5.count then
                        v2 = v2 + v5.count
                    end
                    if not v5[3] then
                        if v5[4] == 124 then
                            v14 = v5[5] + math.max(v3, v4)
                        end
                        v1 = if v2 == v1 then v2 else if v1 == -1 then v2 else nil
                    elseif not (v12 < 1) then
                        continue
                    end
                end
                if v12 < 1 then
                    return "unmatched ) in regular expression"
                end
                v5 = v15[v12]
                v6 = #v15 + 1
                v7 = {
                    41,
                    v5[2],
                    v12,
                    v5[4],
                    v5[5],
                    count = v1,
                }
                if v5[4] ~= 33 and v5[4] ~= 61 then
                    v5[3] = v6
                    table.insert(v15, v7)
                    v13 = v13 + 1
                    break
                end
                if v5[5] and not v1 then
                    return "lookbehind assertion is not fixed width"
                end
                v5[3] = v6
                table.insert(v15, v7)
                v13 = v13 + 1
                break
            end
        elseif v11 == 46 then
            table.insert(v15, u164)
            v13 = v13 + 1
        elseif v11 == 91 then
            v12 = false
            v1 = nil
            v13 = v13 + 1
            v2 = v13
            if v18[v13] == 94 then
                v12 = true
                v13 = v13 + 1
            elseif v18[v13] == 46 or v18[v13] == 58 or v18[v13] == 61 then
                v1 = v18[v13]
            end
            if v18[v13] == 91 then
                v3 = {}
            elseif v18[v13] ~= 92 then
                v3 = {v18[v13]}
                v13 = v13 + 1
            else
                v3 = {}
            end
            while v18[v13] ~= 93 do
                if not v18[v13] then
                    return "unterminated character class"
                end
                if v18[v13] == 45 and v3[1] then
                    v5 = v3[1]
                    if type(v5) == "number" then
                        if v18[v13 + 1] == 93 then
                            table.insert(v3, 1, 45)
                            v13 = v13 + 1
                            continue
                        end
                        v13 = v13 + 1
                        v4 = v18[v13]
                        if v4 == 91 then
                            if v18[v13 + 1] ~= 46 and v18[v13 + 1] ~= 58 and v18[v13 + 1] ~= 61 then
                                if 91 < v3[1] then
                                    return "invalid range in character class"
                                end
                                v3[1] = {"range", v3[1], v4}
                                v13 = v13 + 1
                                continue
                            end
                            v5 = v13 + 2
                            repeat
                                v5 = table.find(v18, 93, v5)
                            until not v5 or v18[v5 - 1] ~= 92
                            if not v5 then
                                return "unterminated character class"
                            end
                            if v18[v5 - 1] == v18[v13 + 1] and v5 - 1 ~= v13 + 1 then
                                return "invalid range in character class"
                            end
                            if 91 < v3[1] then
                                return "invalid range in character class"
                            end
                            v3[1] = {"range", v3[1], v4}
                            v13 = v13 + 1
                            continue
                        end
                        if v4 ~= 92 then
                            if not (v4 < v3[1]) then
                                v3[1] = {"range", v3[1], v4}
                                v13 = v13 + 1
                                continue
                            end
                            return "invalid range in character class"
                        end
                        v13 = v13 + 1
                        if v18[v13] ~= 120 then
                            if 48 <= v18[v13] and v18[v13] <= 55 then
                                v5 = v18[v13] - 48
                                v6 = nil
                                v7 = nil
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13] - 48
                                    v13 = v13 + 1
                                    if not v18[v13] or not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13] - 48
                                    end
                                end
                                v8 = if not v6 then v5 else v7 and 64 * v5 + 8 * v6 + v7 or 8 * v5 + v6 or v5
                                v3[1] = {"range", v3[1], v8}
                                v13 = v13 + 1
                                continue
                            end
                            v4 = u14[v18[v13]] or v18[v13]
                            if type(v4) == "number" then
                                v3[1] = {"range", v3[1], v4}
                                v13 = v13 + 1
                                continue
                            end
                            return "invalid range in character class"
                        end
                        v5 = nil
                        v6 = nil
                        v13 = v13 + 1
                        if not v18[v13] or not (48 <= v18[v13]) then
                            if not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v5 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    v13 = v13 + 1
                                    if not v18[v13] or not (48 <= v18[v13]) then
                                        if not (65 <= v18[v13]) then
                                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                v13 = v13 - 1
                                            else
                                                v7 = v18[v13]
                                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            end
                                        elseif v18[v13] <= 70 then
                                            v7 = v18[v13]
                                            v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v7 = v18[v13]
                                            v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 57 then
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v7 = v18[v13]
                                            v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                end
                            elseif v18[v13] <= 70 then
                                v7 = v18[v13]
                                v5 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v7 = v18[v13]
                                            v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v7 = v18[v13]
                                v5 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v7 = v18[v13]
                                            v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            end
                        elseif v18[v13] <= 57 then
                            v7 = v18[v13]
                            v5 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif not (65 <= v18[v13]) then
                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v7 = v18[v13]
                                v5 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v7 = v18[v13]
                                            v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            end
                        elseif v18[v13] <= 70 then
                            v7 = v18[v13]
                            v5 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            v13 = v13 - 1
                        else
                            v7 = v18[v13]
                            v5 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v7 = v18[v13]
                                        v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v7 = v18[v13]
                                    v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v7 = v18[v13]
                                v6 = v7 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        end
                        v4 = if not v5 then 0 else v6 and 16 * v5 + v6 or v5 or 0
                        v3[1] = {"range", v3[1], v4}
                        v13 = v13 + 1
                        continue
                    end
                end
                if v18[v13] == 91 then
                    if v18[v13 + 1] ~= 46 and v18[v13 + 1] ~= 58 and v18[v13 + 1] ~= 61 then
                        table.insert(v3, 1, 91)
                        v13 = v13 + 1
                        continue
                    end
                    v4 = v13 + 2
                    repeat
                        v4 = table.find(v18, 93, v4)
                    until not v4 or v18[v4 - 1] ~= 92
                    if not v4 then
                        return "unterminated character class"
                    end
                    v5 = v18[v4 - 1]
                    if v5 == v18[v13 + 1] and v4 - 1 ~= v13 + 1 then
                        if v18[v4 - 1] ~= 46 and v18[v4 - 1] ~= 61 then
                            if v18[v4 - 1] == 58 then
                                v5 = v18[v13 + 3] == 94
                                s_5 = v18.s
                                v8 = v13 + (if not v5 then 2 else 3)
                                v9 = v4 - 1
                                v9 = utf8.offset(s_5, v9)
                                v6 = string.sub(s_5, utf8.offset(s_5, v8), v9 and v9 - 1)
                                if not u13[v6] then
                                    return "unknown POSIX class name"
                                end
                                table.insert(v3, 1, {"class", v6, v5})
                                v13 = v4
                            end
                            v13 = v13 + 1
                            continue
                        end
                        return "POSIX collating elements aren't supported"
                    end
                    table.insert(v3, 1, 91)
                    v13 = v13 + 1
                elseif v18[v13] ~= 92 then
                    if not v19.ignoreCase or not (97 <= v18[v13]) or not (v18[v13] <= 122) then
                        table.insert(v3, 1, v18[v13])
                    else
                        table.insert(v3, 1, v18[v13] - 32)
                    end
                    v13 = v13 + 1
                else
                    v13 = v13 + 1
                    if v18[v13] ~= 120 then
                        if 48 <= v18[v13] and v18[v13] <= 55 then
                            v4 = v18[v13] - 48
                            v5 = nil
                            v6 = nil
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                v13 = v13 - 1
                            else
                                v5 = v18[v13] - 48
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13] - 48
                                end
                            end
                            table.insert(v3, 1, if not v5 then v4 else v6 and 64 * v4 + 8 * v5 + v6 or 8 * v4 + v5 or v4)
                            v13 = v13 + 1
                            continue
                        end
                        if v18[v13] == 69 then
                            v13 = v13 + 1
                        elseif v18[v13] ~= 81 then
                            if v18[v13] == 78 then
                                if v18[v13 + 1] == 123
                                    and v18[v13 + 2] == 85
                                    and v18[v13 + 3] == 43
                                    and v19.unicode then
                                    v13 = v13 + 4
                                    v4 = v13
                                    while v18[v13] do
                                        if 48 <= v18[v13] and v18[v13] <= 57 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if 65 <= v18[v13] and v18[v13] <= 70 then
                                            v13 = v13 + 1
                                            continue
                                        end
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            break
                                        end
                                        v13 = v13 + 1
                                    end
                                    if v18[v13] == 125 and v13 ~= v4 then
                                        s_7 = v18.s
                                        v8 = utf8.offset(s_7, v13)
                                        table.insert(v3, 1, (tonumber((string.sub(s_7, utf8.offset(s_7, v4), v8 and v8 - 1)))))
                                        v13 = v13 + 1
                                        continue
                                    end
                                    return "malformed Unicode code point"
                                end
                                return "invalid escape sequence"
                            end
                            if v18[v13] ~= 80 and v18[v13] ~= 112 then
                                if v18[v13] ~= 111 then
                                    v4 = u14[v18[v13]]
                                    table.insert(v3, 1, not (type(v4) ~= "string") and {"class", v4, false} or v4 or v18[v13])
                                    v13 = v13 + 1
                                    continue
                                end
                                v13 = v13 + 1
                                if v18[v13] ~= 123 then
                                    return "malformed octal code"
                                end
                                v13 = v13 + 1
                                v4 = v13
                                while v18[v13] do
                                    if not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                        break
                                    end
                                    v13 = v13 + 1
                                end
                                if v18[v13] == 125 and v13 ~= v4 then
                                    s_8 = v18.s
                                    v8 = utf8.offset(s_8, v13)
                                    v5 = tonumber(string.sub(s_8, utf8.offset(s_8, v4), v8 and v8 - 1), 8)
                                    if v5 > 65535 then
                                        return "character offset too large"
                                    end
                                    table.insert(v3, 1, v5)
                                    v13 = v13 + 1
                                    continue
                                end
                                return "malformed octal code"
                            end
                            return "options.unicodeData cannot be turned off when using \\p"
                        else
                            v4 = v13 + 1
                            repeat
                                v13 = table.find(v18, 92, v13 + 1)
                            until not v13 or v18[v13 + 1] == 69
                            table.move(v18, v4, v13 and v13 - 1 or #v18, #v15 + 1, v15)
                            if not v13 then
                                break
                            end
                            v13 = v13 + 1
                            v13 = v13 + 1
                        end
                    else
                        v4 = nil
                        v5 = nil
                        v13 = v13 + 1
                        if v18[v13] == 123 then
                            v13 = v13 + 1
                            v6 = v13
                            while v18[v13] do
                                if 48 <= v18[v13] and v18[v13] <= 57 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 65 <= v18[v13] and v18[v13] <= 70 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    break
                                end
                                v13 = v13 + 1
                            end
                            if v18[v13] == 125 and v13 ~= v6 then
                                if 4 < v13 - v6 then
                                    return "character offset too large"
                                end
                                s_6 = v18.s
                                v10 = utf8.offset(s_6, v13)
                                table.insert(v3, 1, (tonumber(string.sub(s_6, utf8.offset(s_6, v6), v10 and v10 - 1), 16)))
                                v13 = v13 + 1
                                continue
                            end
                            return "malformed hexadecimal character"
                        end
                        if not v18[v13] or not (48 <= v18[v13]) then
                            if not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v4 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    v13 = v13 + 1
                                    if not v18[v13] or not (48 <= v18[v13]) then
                                        if not (65 <= v18[v13]) then
                                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                v13 = v13 - 1
                                            else
                                                v6 = v18[v13]
                                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            end
                                        elseif v18[v13] <= 70 then
                                            v6 = v18[v13]
                                            v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v6 = v18[v13]
                                            v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 57 then
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v6 = v18[v13]
                                            v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                end
                            elseif v18[v13] <= 70 then
                                v6 = v18[v13]
                                v4 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v6 = v18[v13]
                                            v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v6 = v18[v13]
                                v4 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v6 = v18[v13]
                                            v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            end
                        elseif v18[v13] <= 57 then
                            v6 = v18[v13]
                            v4 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif not (65 <= v18[v13]) then
                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v6 = v18[v13]
                                v4 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] or not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v6 = v18[v13]
                                            v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            end
                        elseif v18[v13] <= 70 then
                            v6 = v18[v13]
                            v4 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            v13 = v13 - 1
                        else
                            v6 = v18[v13]
                            v4 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v6 = v18[v13]
                                        v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v6 = v18[v13]
                                    v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v6 = v18[v13]
                                v5 = v6 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        end
                        table.insert(v3, 1, if not v4 then 0 else v5 and 16 * v4 + v5 or v4 or 0)
                        v13 = v13 + 1
                    end
                end
            end
            if v18[v13 - 1] == v1 and v13 - 1 ~= v2 then
                if v1 == 58 then
                    return "POSIX named classes are only support within a character set"
                end
                return "POSIX collating elements aren't supported"
            end
            if v3[2] or v12 then
                table.insert(v15, {"charset", v12, v3})
            else
                table.insert(v15, v3[1])
            end
            v13 = v13 + 1
        elseif v11 ~= 92 then
            if v11 ~= 42 and v11 ~= 43 and v11 ~= 63 and v11 ~= 123 then
                if v11 == 124 then
                    table.insert(v15, u168)
                    v12 = #v15
                    while true do
                        v12 = v12 - 1
                        v1 = v15[v12]
                        v2 = type(v15[v12]) == "table"
                        if not v2 then
                            if not v2 or v1[1] ~= 40 then
                                if v1 then
                                    continue
                                end
                            elseif v1[4] == 124 then
                                v14 = v1[5]
                            end
                        elseif v1[1] == 41 then
                            v12 = v15[v12][3]
                            if v1 then
                                continue
                            end
                        elseif not v2 or v1[1] ~= 40 then
                            if v1 then
                                continue
                            end
                        elseif v1[4] == 124 then
                            v14 = v1[5]
                        end
                        v13 = v13 + 1
                        break
                    end
                elseif v11 == 36 or v11 == 94 then
                    table.insert(v15, not (v11 ~= 94) and u166 or u162)
                elseif not v19.ignoreCase or not (v11 >= 97) then
                    if not v19.extended then
                        table.insert(v15, v11)
                    elseif not (v11 >= 9) then
                        if v11 == 32 then
                            if v11 == 35 then
                                repeat
                                    v13 = v13 + 1
                                until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                            end
                        elseif v11 ~= 35 then
                            table.insert(v15, v11)
                        elseif v11 == 35 then
                            repeat
                                v13 = v13 + 1
                            until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                        end
                    elseif v11 <= 13 or v11 == 32 then
                        if v11 == 35 then
                            repeat
                                v13 = v13 + 1
                            until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                        end
                    elseif v11 ~= 35 then
                        table.insert(v15, v11)
                    elseif v11 == 35 then
                        repeat
                            v13 = v13 + 1
                        until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                    end
                elseif v11 <= 122 then
                    table.insert(v15, v11 - 32)
                elseif not v19.extended then
                    table.insert(v15, v11)
                elseif not (v11 >= 9) then
                    if v11 == 32 then
                        if v11 == 35 then
                            repeat
                                v13 = v13 + 1
                            until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                        end
                    elseif v11 ~= 35 then
                        table.insert(v15, v11)
                    elseif v11 == 35 then
                        repeat
                            v13 = v13 + 1
                        until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                    end
                elseif v11 <= 13 or v11 == 32 then
                    if v11 == 35 then
                        repeat
                            v13 = v13 + 1
                        until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                    end
                elseif v11 ~= 35 then
                    table.insert(v15, v11)
                elseif v11 == 35 then
                    repeat
                        v13 = v13 + 1
                    until not v18[v13] or v18[v13] == 10 or v18[v13] == 13
                end
                v13 = v13 + 1
                continue
            end
            v12 = nil
            v1 = nil
            if v11 ~= 123 then
                v12 = if v11 ~= 43 then 0 else 1
                v1 = if v11 ~= 63 then (1 / 0) else 1
            else
                v2 = v13 + 1
                v3 = nil
                while v18[v13 + 1] do
                    if 48 <= v18[v13 + 1] and v18[v13 + 1] <= 57 then
                        v13 = v13 + 1
                        if v18[v13] == 44 then
                            v3 = v13
                        end
                        continue
                    end
                    if v18[v13 + 1] ~= 44 or v3 or v13 + 1 == v2 then
                        break
                    end
                    v13 = v13 + 1
                    if v18[v13] == 44 then
                        v3 = v13
                    end
                end
                if v18[v13 + 1] ~= 125 then
                    table.move(v18, v2 - 1, v13, #v15 + 1, v15)
                else
                    v13 = v13 + 1
                    if v3 then
                        s_15 = v18.s
                        v7 = utf8.offset(s_15, v3)
                        v12 = tonumber((string.sub(s_15, utf8.offset(s_15, v2), v7 and v7 - 1)))
                        if v3 + 1 ~= v13 then
                            s_16 = v18.s
                            v7 = v3 + 1
                            v8 = utf8.offset(s_16, v13)
                            v4 = tonumber((string.sub(s_16, utf8.offset(s_16, v7), v8 and v8 - 1)))
                        else
                            v4 = (1 / 0)
                        end
                        if v4 < v12 then
                            return "numbers out of order in {} quantifier"
                        end
                    else
                        s_14 = v18.s
                        v7 = utf8.offset(s_14, v13)
                        v1 = (tonumber((string.sub(s_14, utf8.offset(s_14, v2), v7 and v7 - 1))))
                    end
                end
            end
            if v12 then
                v2 = if not v19.ungreedy then "greedy" else "lazy"
                if v18[v13 + 1] == 43 or v18[v13 + 1] == 63 then
                    v13 = v13 + 1
                    v2 = if v18[v13] ~= 43 then if not v19.ungreedy then "lazy" else "greedy" else "possessive"
                end
                v3 = #v15
                v4 = v15[v3]
                if v4 then
                    if type(v4) == "table" then
                        if v4[1] ~= "quantifier"
                            and v4[1] ~= 40
                            and not u63[v4[1]]
                            and v4 ~= u168
                            and type(v4) ~= "string" then
                            if v1 == 0 then
                                table.remove(v15)
                            elseif v12 ~= 1 or v1 ~= 1 then
                                if type(v4) == "table" and v4[1] == 41 then
                                    v3 = v4[3]
                                end
                                v15[v3] = {"quantifier", v12, v1, v2, v15[v3]}
                            end
                            v13 = v13 + 1
                            continue
                        end
                        return "quantifier doesn't follow a repeatable pattern"
                    end
                    if v4 ~= u168 and type(v4) ~= "string" then
                        if v1 == 0 then
                            table.remove(v15)
                        elseif v12 ~= 1 or v1 ~= 1 then
                            if type(v4) == "table" and v4[1] == 41 then
                                v3 = v4[3]
                            end
                            v15[v3] = {"quantifier", v12, v1, v2, v15[v3]}
                        end
                        v13 = v13 + 1
                        continue
                    end
                end
                return "quantifier doesn't follow a repeatable pattern"
            end
            v13 = v13 + 1
        else
            v13 = v13 + 1
            v12 = v18[v13]
            if not v12 then
                return "pattern may not end with a trailing backslash"
            end
            if v12 >= 48 and v12 <= 57 then
                v1 = v13
                while v18[v13 + 1] do
                    if not (48 <= v18[v13 + 1]) or not (v18[v13 + 1] <= 57) then
                        break
                    end
                    v13 = v13 + 1
                end
                s_9 = v18.s
                v5 = v13 + 1
                v5 = utf8.offset(s_9, v5)
                v2 = tonumber((string.sub(s_9, utf8.offset(s_9, v1), v5 and v5 - 1)))
                if not (v14 < v2) or v13 == v1 then
                    table.insert(v15, {"backref", v2})
                else
                    v13 = v1
                    v3 = nil
                    v4 = nil
                    v5 = nil
                    if v18[v13] <= 55 then
                        v3 = v18[v13] - 48
                        v13 = v13 + 1
                        if not v18[v13] or not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                            v13 = v13 - 1
                        else
                            v4 = v18[v13] - 48
                            v13 = v13 + 1
                            if not v18[v13] or not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                v13 = v13 - 1
                            else
                                v5 = v18[v13] - 48
                            end
                        end
                    end
                    table.insert(
                        v15,
                        if not v3 then v18[v1] else if not v4 then v3 or v18[v1] else v5 and 64 * v3 + 8 * v4 + v5 or 8 * v3 + v4 or v3 or v18[v1]
                    )
                end
                v13 = v13 + 1
                continue
            end
            if v12 == 69 then
                v13 = v13 + 1
            elseif v12 == 81 then
                v1 = v13 + 1
                repeat
                    v13 = table.find(v18, 92, v13 + 1)
                until not v13 or v18[v13 + 1] == 69
                table.move(v18, v1, v13 and v13 - 1 or #v18, #v15 + 1, v15)
                if not v13 then
                    break
                end
                v13 = v13 + 1
                v13 = v13 + 1
            elseif v12 ~= 78 then
                if v12 ~= 80 and v12 ~= 112 then
                    if v12 ~= 103 then
                        if v12 == 111 then
                            v13 = v13 + 1
                            if v18[v13 + 1] ~= 123 then
                                return "malformed octal code"
                            end
                            v13 = v13 + 1
                            v1 = v13
                            while v18[v13] do
                                if not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                    break
                                end
                                v13 = v13 + 1
                            end
                            if v18[v13] == 125 and v13 ~= v1 then
                                s_12 = v18.s
                                v5 = utf8.offset(s_12, v13)
                                v2 = tonumber(string.sub(s_12, utf8.offset(s_12, v1), v5 and v5 - 1), 8)
                                if v2 > 65535 then
                                    return "character offset too large"
                                end
                                table.insert(v15, v2)
                                v13 = v13 + 1
                                continue
                            end
                            return "malformed octal code"
                        end
                        if v12 == 120 then
                            v1 = nil
                            v2 = nil
                            v13 = v13 + 1
                            if v18[v13] == 123 then
                                v13 = v13 + 1
                                v3 = v13
                                while v18[v13] do
                                    if 48 <= v18[v13] and v18[v13] <= 57 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if 65 <= v18[v13] and v18[v13] <= 70 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        break
                                    end
                                    v13 = v13 + 1
                                end
                                if v18[v13] == 125 and v13 ~= v3 then
                                    if 4 < v13 - v3 then
                                        return "character offset too large"
                                    end
                                    s_13 = v18.s
                                    v9 = utf8.offset(s_13, v13)
                                    table.insert(v15, (tonumber(string.sub(s_13, utf8.offset(s_13, v3), v9 and v9 - 1), 16)))
                                    v13 = v13 + 1
                                    continue
                                end
                                return "malformed hexadecimal code"
                            end
                            if not v18[v13] then
                                v13 = v13 - 1
                            elseif not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        v13 = v13 + 1
                                        if not v18[v13] then
                                            v13 = v13 - 1
                                        elseif not (48 <= v18[v13]) then
                                            if not (65 <= v18[v13]) then
                                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                    v13 = v13 - 1
                                                else
                                                    v3 = v18[v13]
                                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                                end
                                            elseif v18[v13] <= 70 then
                                                v3 = v18[v13]
                                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                v13 = v13 - 1
                                            else
                                                v3 = v18[v13]
                                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            end
                                        elseif v18[v13] <= 57 then
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        elseif not (65 <= v18[v13]) then
                                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                v13 = v13 - 1
                                            else
                                                v3 = v18[v13]
                                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            end
                                        elseif v18[v13] <= 70 then
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    v13 = v13 + 1
                                    if not v18[v13] then
                                        v13 = v13 - 1
                                    elseif not (48 <= v18[v13]) then
                                        if not (65 <= v18[v13]) then
                                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                v13 = v13 - 1
                                            else
                                                v3 = v18[v13]
                                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            end
                                        elseif v18[v13] <= 70 then
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 57 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    v13 = v13 + 1
                                    if not v18[v13] then
                                        v13 = v13 - 1
                                    elseif not (48 <= v18[v13]) then
                                        if not (65 <= v18[v13]) then
                                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                v13 = v13 - 1
                                            else
                                                v3 = v18[v13]
                                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            end
                                        elseif v18[v13] <= 70 then
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 57 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                end
                            elseif v18[v13] <= 57 then
                                v3 = v18[v13]
                                v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] then
                                    v13 = v13 - 1
                                elseif not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    v13 = v13 + 1
                                    if not v18[v13] then
                                        v13 = v13 - 1
                                    elseif not (48 <= v18[v13]) then
                                        if not (65 <= v18[v13]) then
                                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                                v13 = v13 - 1
                                            else
                                                v3 = v18[v13]
                                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                            end
                                        elseif v18[v13] <= 70 then
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 57 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                end
                            elseif v18[v13] <= 70 then
                                v3 = v18[v13]
                                v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] then
                                    v13 = v13 - 1
                                elseif not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] then
                                    v13 = v13 - 1
                                elseif not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            end
                            table.insert(v15, if not v1 then 0 else v2 and 16 * v1 + v2 or v1 or 0)
                            v13 = v13 + 1
                            continue
                        end
                        table.insert(v15, u63[v12] or u14[v12] or v12)
                        v13 = v13 + 1
                        continue
                    end
                    if v18[v13 + 1] == 123 then
                        v1 = false
                        v13 = v13 + 1
                        if v18[v13] == 123 then
                            v13 = v13 + 1
                            v2 = v13
                            while v18[v13] do
                                if 48 <= v18[v13] and v18[v13] <= 57 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 65 <= v18[v13] and v18[v13] <= 70 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    break
                                end
                                v13 = v13 + 1
                            end
                            if v18[v13] ~= 125 then
                                return "malformed reference code"
                            end
                            s_11 = v18.s
                            v6 = v13 + (if not v1 then 1 else 0)
                            v6 = utf8.offset(s_11, v6)
                            table.insert(v15, {
                                "backref",
                                (tonumber((string.sub(s_11, utf8.offset(s_11, v2), v6 and v6 - 1)))),
                            })
                            if not v1 then
                                v13 = v13 - 1
                            end
                            v13 = v13 + 1
                            continue
                        end
                        if not (v18[v13] < 48) and not (57 < v18[v13]) then
                            v2 = v13
                            while v18[v13] do
                                if 48 <= v18[v13] and v18[v13] <= 57 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if 65 <= v18[v13] and v18[v13] <= 70 then
                                    v13 = v13 + 1
                                    continue
                                end
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    break
                                end
                                v13 = v13 + 1
                            end
                            if v1 and v18[v13] ~= 125 then
                                return "malformed reference code"
                            end
                            s_11 = v18.s
                            v6 = v13 + (if not v1 then 1 else 0)
                            v6 = utf8.offset(s_11, v6)
                            table.insert(v15, {
                                "backref",
                                (tonumber((string.sub(s_11, utf8.offset(s_11, v2), v6 and v6 - 1)))),
                            })
                            if not v1 then
                                v13 = v13 - 1
                            end
                            v13 = v13 + 1
                            continue
                        end
                        return "malformed reference code"
                    end
                    v1 = v18[v13 + 1]
                    if v1 >= 48 then
                        v1 = v18[v13 + 1]
                        if v1 <= 57 then
                            v1 = false
                            v13 = v13 + 1
                            if v18[v13] == 123 then
                                v13 = v13 + 1
                                v2 = v13
                                while v18[v13] do
                                    if 48 <= v18[v13] and v18[v13] <= 57 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if 65 <= v18[v13] and v18[v13] <= 70 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        break
                                    end
                                    v13 = v13 + 1
                                end
                                if v18[v13] ~= 125 then
                                    return "malformed reference code"
                                end
                                s_11 = v18.s
                                v6 = v13 + (if not v1 then 1 else 0)
                                v6 = utf8.offset(s_11, v6)
                                table.insert(v15, {
                                    "backref",
                                    (tonumber((string.sub(s_11, utf8.offset(s_11, v2), v6 and v6 - 1)))),
                                })
                                if not v1 then
                                    v13 = v13 - 1
                                end
                                v13 = v13 + 1
                                continue
                            end
                            if not (v18[v13] < 48) and not (57 < v18[v13]) then
                                v2 = v13
                                while v18[v13] do
                                    if 48 <= v18[v13] and v18[v13] <= 57 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if 65 <= v18[v13] and v18[v13] <= 70 then
                                        v13 = v13 + 1
                                        continue
                                    end
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        break
                                    end
                                    v13 = v13 + 1
                                end
                                if v1 and v18[v13] ~= 125 then
                                    return "malformed reference code"
                                end
                                s_11 = v18.s
                                v6 = v13 + (if not v1 then 1 else 0)
                                v6 = utf8.offset(s_11, v6)
                                table.insert(v15, {
                                    "backref",
                                    (tonumber((string.sub(s_11, utf8.offset(s_11, v2), v6 and v6 - 1)))),
                                })
                                if not v1 then
                                    v13 = v13 - 1
                                end
                                v13 = v13 + 1
                                continue
                            end
                            return "malformed reference code"
                        end
                    end
                    if v12 == 111 then
                        v13 = v13 + 1
                        if v18[v13 + 1] ~= 123 then
                            return "malformed octal code"
                        end
                        v13 = v13 + 1
                        v1 = v13
                        while v18[v13] do
                            if not (48 <= v18[v13]) or not (v18[v13] <= 55) then
                                break
                            end
                            v13 = v13 + 1
                        end
                        if v18[v13] == 125 and v13 ~= v1 then
                            s_12 = v18.s
                            v5 = utf8.offset(s_12, v13)
                            v2 = tonumber(string.sub(s_12, utf8.offset(s_12, v1), v5 and v5 - 1), 8)
                            if v2 > 65535 then
                                return "character offset too large"
                            end
                            table.insert(v15, v2)
                            v13 = v13 + 1
                            continue
                        end
                        return "malformed octal code"
                    end
                    if v12 ~= 120 then
                        table.insert(v15, u63[v12] or u14[v12] or v12)
                        v13 = v13 + 1
                        continue
                    end
                    v1 = nil
                    v2 = nil
                    v13 = v13 + 1
                    if v18[v13] == 123 then
                        v13 = v13 + 1
                        v3 = v13
                        while v18[v13] do
                            if 48 <= v18[v13] and v18[v13] <= 57 then
                                v13 = v13 + 1
                                continue
                            end
                            if 65 <= v18[v13] and v18[v13] <= 70 then
                                v13 = v13 + 1
                                continue
                            end
                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                break
                            end
                            v13 = v13 + 1
                        end
                        if v18[v13] == 125 and v13 ~= v3 then
                            if 4 < v13 - v3 then
                                return "character offset too large"
                            end
                            s_13 = v18.s
                            v9 = utf8.offset(s_13, v13)
                            table.insert(v15, (tonumber(string.sub(s_13, utf8.offset(s_13, v3), v9 and v9 - 1), 16)))
                            v13 = v13 + 1
                            continue
                        end
                        return "malformed hexadecimal code"
                    end
                    if not v18[v13] then
                        v13 = v13 - 1
                    elseif not (48 <= v18[v13]) then
                        if not (65 <= v18[v13]) then
                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                v13 = v13 + 1
                                if not v18[v13] then
                                    v13 = v13 - 1
                                elseif not (48 <= v18[v13]) then
                                    if not (65 <= v18[v13]) then
                                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                            v13 = v13 - 1
                                        else
                                            v3 = v18[v13]
                                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                        end
                                    elseif v18[v13] <= 70 then
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 57 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            end
                        elseif v18[v13] <= 70 then
                            v3 = v18[v13]
                            v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] then
                                v13 = v13 - 1
                            elseif not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            v13 = v13 - 1
                        else
                            v3 = v18[v13]
                            v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] then
                                v13 = v13 - 1
                            elseif not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        end
                    elseif v18[v13] <= 57 then
                        v3 = v18[v13]
                        v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        v13 = v13 + 1
                        if not v18[v13] then
                            v13 = v13 - 1
                        elseif not (48 <= v18[v13]) then
                            if not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif v18[v13] <= 57 then
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        elseif not (65 <= v18[v13]) then
                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif v18[v13] <= 70 then
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            v13 = v13 - 1
                        else
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        end
                    elseif not (65 <= v18[v13]) then
                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            v13 = v13 - 1
                        else
                            v3 = v18[v13]
                            v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            v13 = v13 + 1
                            if not v18[v13] then
                                v13 = v13 - 1
                            elseif not (48 <= v18[v13]) then
                                if not (65 <= v18[v13]) then
                                    if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                        v13 = v13 - 1
                                    else
                                        v3 = v18[v13]
                                        v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                    end
                                elseif v18[v13] <= 70 then
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 57 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        end
                    elseif v18[v13] <= 70 then
                        v3 = v18[v13]
                        v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        v13 = v13 + 1
                        if not v18[v13] then
                            v13 = v13 - 1
                        elseif not (48 <= v18[v13]) then
                            if not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif v18[v13] <= 57 then
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        elseif not (65 <= v18[v13]) then
                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif v18[v13] <= 70 then
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            v13 = v13 - 1
                        else
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        end
                    elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                        v13 = v13 - 1
                    else
                        v3 = v18[v13]
                        v1 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        v13 = v13 + 1
                        if not v18[v13] then
                            v13 = v13 - 1
                        elseif not (48 <= v18[v13]) then
                            if not (65 <= v18[v13]) then
                                if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                    v13 = v13 - 1
                                else
                                    v3 = v18[v13]
                                    v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                                end
                            elseif v18[v13] <= 70 then
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif v18[v13] <= 57 then
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        elseif not (65 <= v18[v13]) then
                            if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                                v13 = v13 - 1
                            else
                                v3 = v18[v13]
                                v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                            end
                        elseif v18[v13] <= 70 then
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        elseif not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            v13 = v13 - 1
                        else
                            v3 = v18[v13]
                            v2 = v3 - (if not (65 <= v18[v13]) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else if not (v18[v13] <= 90) then if not (97 <= v18[v13]) then 48 else if not (v18[v13] <= 122) then 48 else 87 else 55)
                        end
                    end
                    table.insert(v15, if not v1 then 0 else v2 and 16 * v1 + v2 or v1 or 0)
                    v13 = v13 + 1
                    continue
                end
                return "options.unicodeData cannot be turned off when using \\p"
            else
                if v18[v13 + 1] == 123 and v18[v13 + 2] == 85 and v18[v13 + 3] == 43 and v19.unicode then
                    v13 = v13 + 4
                    v1 = v13
                    while v18[v13] do
                        if 48 <= v18[v13] and v18[v13] <= 57 then
                            v13 = v13 + 1
                            continue
                        end
                        if 65 <= v18[v13] and v18[v13] <= 70 then
                            v13 = v13 + 1
                            continue
                        end
                        if not (97 <= v18[v13]) or not (v18[v13] <= 102) then
                            break
                        end
                        v13 = v13 + 1
                    end
                    if v18[v13] == 125 and v13 ~= v1 then
                        s_10 = v18.s
                        v5 = utf8.offset(s_10, v13)
                        table.insert(v15, (tonumber((string.sub(s_10, utf8.offset(s_10, v1), v5 and v5 - 1)))))
                        v13 = v13 + 1
                        continue
                    end
                    return "malformed Unicode code point"
                end
                table.insert(v15, u14[78])
                v13 = v13 + 1
            end
        end
    end
    v11 = 0
    for i2, i5 in ipairs(v15) do
        if type(i5) == "table" then
            if i5[1] == 40 then
                if i5[1] == "quantifier" then
                    i5 = i5[5]
                end
                if i5[3] then
                    if i5[2] then
                        v11 = math.max(v11, i5[2])
                    end
                    continue
                end
                return "unterminated parenthetical"
            end
            if i5[1] == "quantifier" and type(i5[5]) == "table" and i5[5][1] == 40 then
                if i5[1] == "quantifier" then
                    i5 = i5[5]
                end
                if not i5[3] then
                    return "unterminated parenthetical"
                end
                if i5[2] then
                    v11 = math.max(v11, i5[2])
                end
                continue
            end
            if type(i5) == "table" then
                if i5[1] ~= "backref" and i5[1] ~= "recurmatch" then
                    continue
                end
                if not v16[i5[2]] then
                    if type(i5[2]) == "number" and not (v14 < i5[2]) then
                        if i5[1] ~= "recurmatch" then
                            if type(i5[2]) == "string" then
                                i5[2] = v16[i5[2]]
                            end
                        elseif i5[2] ~= 0 then
                            for i3, i6 in ipairs(v15) do
                                if type(i6) == "table" and i6[1] == 40 and i6[2] == i5[2] then
                                    i5[3] = i3
                                    break
                                end
                            end
                        elseif type(i5[2]) == "string" then
                            i5[2] = v16[i5[2]]
                        end
                        continue
                    end
                    return "reference to a non-existent or invalid subpattern"
                end
                if i5[1] ~= "recurmatch" then
                    if type(i5[2]) == "string" then
                        i5[2] = v16[i5[2]]
                    end
                elseif i5[2] ~= 0 then
                    for i4, i7 in ipairs(v15) do
                        if type(i7) == "table" and i7[1] == 40 and i7[2] == i5[2] then
                            i5[3] = i4
                            break
                        end
                    end
                elseif type(i5[2]) == "string" then
                    i5[2] = v16[i5[2]]
                end
            end
            continue
        end
        if type(i5) == "table" then
            if i5[1] ~= "backref" and i5[1] ~= "recurmatch" then
                continue
            end
            if not v16[i5[2]] then
                if type(i5[2]) == "number" and not (v14 < i5[2]) then
                    if i5[1] ~= "recurmatch" then
                        if type(i5[2]) == "string" then
                            i5[2] = v16[i5[2]]
                        end
                    elseif i5[2] ~= 0 then
                        for i8, i82 in ipairs(v15) do
                            if type(i82) == "table" and i82[1] == 40 and i82[2] == i5[2] then
                                i5[3] = i8
                                break
                            end
                        end
                    elseif type(i5[2]) == "string" then
                        i5[2] = v16[i5[2]]
                    end
                    continue
                end
                return "reference to a non-existent or invalid subpattern"
            end
            if i5[1] ~= "recurmatch" then
                if type(i5[2]) == "string" then
                    i5[2] = v16[i5[2]]
                end
            elseif i5[2] ~= 0 then
                for i9, i92 in ipairs(v15) do
                    if type(i92) == "table" and i92[1] == 40 and i92[2] == i5[2] then
                        i5[3] = i9
                        break
                    end
                end
            elseif type(i5[2]) == "string" then
                i5[2] = v16[i5[2]]
            end
        end
    end
    v15.group_n = v11
    return v15, v16, v17
end

if not tonumber(256) then
    error(string.format("expected number for options.cacheSize, got %s", "number"), 2)
end
local u230 = tonumber(256)
local u248 = nil
local u252 = nil
if u230 then
    if u230 < 0 or u230 ~= u230 then
        error("cache size cannot be a negative number or a NaN", 2)
    elseif u230 == (1 / 0) then
        u248 = {nil}
        u252 = {nil}
    elseif not (u230 >= 4294967296) then
        u248 = table.create(256)
        u252 = table.create(256)
    else
        error("cache size too large", 2)
    end
end
if u230 then
    function u5.pruge() -- Line: 1902 -- upvalues: u252 (ref), u248 (ref)
        table.clear(u252)
        table.clear(u248)
    end
end

local function new_re(a1, a2, a3, a4) -- Line: 1908
    -- upvalues: u230 (val), u248 (ref), u252 (ref), tokenize_ptn (val), u4 (val), u6 (ref), re_tostr (val), u8 (ref)
    local v1, v2, v3, v4, v5, v6
    local v7 = u230 and string.format("%s|%s", a1.s, a3)
    local v8 = u230 and u248[table.find(u252, v7)]
    if not v8 then
        v6, v1, v2 = tokenize_ptn(a1, a2)
        v3 = v6
        if type(v3) == "string" then
            error(v3, 2)
        end
        if u230 and v3[1] then
            table.insert(u252, 1, v7)
            table.insert(u248, 1, {v3, v1, v2})
            if u230 ~= (1 / 0) then
                table.remove(u252, u230 + 1)
                table.remove(u248, u230 + 1)
            end
        end
    else
        v6, v1, v2 = table.unpack(v8, 1, 3)
        v3 = v6
        v4 = v1
        v5 = v2
    end
    v6 = newproxy(true)
    u4[v6] = {
        name = "RegEx",
        flags = a2,
        flag_repr = a3,
        pattern_repr = a4,
        token = v3,
        group_id = v4,
        verb_flags = v5,
    }
    v1 = getmetatable(v6)
    local v9 = u6
    v1.__index = setmetatable(a2, v9)
    v1.__tostring = re_tostr
    v1.__metatable = u8
    return v6
end

local function escape_fslash(a1) -- Line: 1939
    return (if #a1 % 2 ~= 0 then "" else "\\") .. a1 .. "."
end

local function sort_flag_chr(a1, a2) -- Line: 1943
    return (a1:lower()) < a2:lower()
end

function u5.new(...) -- Line: 1947
    -- upvalues: u12 (val), sort_flag_chr (val), new_re (val), to_str_arr (val), escape_fslash (val)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2)
    end
    local v1, v2 = ...
    if type(v1) == "number" then
        v1 = v1 .. ""
    elseif type(v1) ~= "string" then
        error(string.format("invalid argument #1 (string expected, got %s)", (typeof(v1))), 2)
    end
    if type(v2) ~= "string" and type(v2) ~= "number" and v2 ~= nil then
        error(string.format("invalid argument #2 (string expected, got %s)", (typeof(v2))), 2)
    end
    local v3 = {
        anchored = false,
        caseless = false,
        multiline = false,
        dotall = false,
        unicode = false,
        ungreedy = false,
        extended = false,
    }
    local v4 = {}
    for i in string.gmatch(v2 or "", utf8.charpattern) do
        if v3[u12[i]] ~= false then
            error("invalid regular expression flag " .. i, 3)
        end
        v3[u12[i]] = true
        table.insert(v4, i)
    end
    table.sort(v4, sort_flag_chr)
    v4 = table.concat(v4)
    return (new_re(to_str_arr(v1), v3, v4, string.format("/%s/", v1:gsub("(\\*)/", escape_fslash))))
end

function u5.fromstring(...) -- Line: 1977 -- upvalues: to_str_arr (val), u12 (val), sort_flag_chr (val), new_re (val)
    local v1, v2
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2)
    end
    local v3 = ...
    if type(v3) == "number" then
        v3 = v3 .. ""
    elseif type(v3) ~= "string" then
        error(string.format("invalid argument #1 (string expected, got %s)", typeof(v3), 2))
    end
    local v4 = to_str_arr(v3)
    local v5 = v4[1]
    if not v5 then
        error("empty regex", 2)
    elseif v5 == 92 then
        error("delimiter must not be alphanumeric or a backslash", 2)
    elseif not (v5 >= 48) then
        if not (v5 >= 65) then
            if v5 >= 97 and v5 <= 122 then
                error("delimiter must not be alphanumeric or a backslash", 2)
            end
        elseif v5 <= 90 or v5 >= 97 and v5 <= 122 then
            error("delimiter must not be alphanumeric or a backslash", 2)
        end
    elseif v5 <= 57 then
        error("delimiter must not be alphanumeric or a backslash", 2)
    elseif not (v5 >= 65) then
        if v5 >= 97 and v5 <= 122 then
            error("delimiter must not be alphanumeric or a backslash", 2)
        end
    elseif v5 <= 90 or v5 >= 97 and v5 <= 122 then
        error("delimiter must not be alphanumeric or a backslash", 2)
    end
    local v6 = 1
    repeat
        v6 = table.find(v4, v5, v6 + 1)
        if not v6 then
            error(string.format("no ending delimiter ('%s') found", utf8.char(v5)), 2)
        end
        v1 = 1
        while v4[v6 - v1] == 92 do
            v1 = v1 + 1
        end
    until v1 % 2 == 1
    v1 = {
        anchored = false,
        caseless = false,
        multiline = false,
        dotall = false,
        unicode = false,
        ungreedy = false,
        extended = false,
    }
    local v7 = {}
    while v6 < v4.n do
        v2 = utf8.char(table.remove(v4))
        v4.n = v4.n - 1
        if v1[u12[v2]] ~= false then
            error("invalid regular expression flag " .. v2, 3)
        end
        v1[u12[v2]] = true
        table.insert(v7, v2)
    end
    table.sort(v7, sort_flag_chr)
    v7 = table.concat(v7)
    table.remove(v4, 1)
    table.remove(v4)
    v4.n = v4.n - 2
    v4.s = string.sub(v4.s, 2, 1 + v4.n)
    return (new_re(v4, v1, v7, (string.sub(v3, 1, 2 + v4.n))))
end

local u304 = {
    ["\000"] = "\\x00",
    ["\n"] = "\\n",
    ["\t"] = "\\t",
    ["\r"] = "\\r",
    ["\012"] = "\\f",
}

function u5.escape(...) -- Line: 2033 -- upvalues: u304 (val)
    if select("#", ...) == 0 then
        error("missing argument #1 (string expected)", 2)
    end
    local v1, v2, v3 = ...
    if type(v1) == "number" then
        v1 = v1 .. ""
    elseif type(v1) ~= "string" then
        error(string.format("invalid argument #1 to 'escape' (string expected, got %s)", (typeof(v1))), 2)
    end
    if v3 == nil then
        v3 = ""
    elseif type(v3) == "number" then
        v3 = v3 .. ""
    elseif type(v3) ~= "string" then
        error(string.format("invalid argument #3 to 'escape' (string expected, got %s)", (typeof(v3))), 2)
    end
    if 1 < (utf8.len(v3)) or v3:match("^[%a\\]$") then
        error("delimiter have not be alphanumeric", 2)
    end
    local v4 = string.gsub(v1, "[\000\012\n\r\t]", u304)
    local format = string.format
    return (v4:gsub(format("[\\%s#()%%%%*+.?[%%]^{|%s]", if not v2 then "" else "%s", (if not v3:find("^[%%%]]$") then "" else "%") .. v3), "\\%1"))
end

function u5.type(...) -- Line: 2056 -- upvalues: u4 (val)
    if select("#", ...) == 0 then
        error("missing argument #1", 2)
    end
    return u4[...] and u4[...].name
end

for k, v in pairs(u6) do
    u5[k] = v
end
u8 = u5.fromstring("/The\\s*metatable\\s*is\\s*(?:locked|inaccessible)(?#Nice try :])/i")
local v1 = u8
getmetatable(v1).__metatable = u8

local function readonly_table() -- Line: 2072
    error("Attempt to modify a readonly table", 2)
end

u7 = {__index = u7, __metatable = u8, __newindex = readonly_table}
local v2 = u7
u5.Match = setmetatable({}, v2)
return (setmetatable({}, {__index = u5, __metatable = u8, __newindex = readonly_table}))