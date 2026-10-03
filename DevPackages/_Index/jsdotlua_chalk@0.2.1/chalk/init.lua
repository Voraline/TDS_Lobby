-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_chalk@0.2.1.chalk
-- Decompile time: 5.44 ms

local v1

local function stringReplaceAll(a1, a2, a3) -- Line: 2
    local v1 = string.find(a1, a2, 1, true)
    if v1 == nil then
        return a1
    end
    local v2 = #a2
    local v3 = 1
    local v4 = ""
    repeat
        v4 = v4 .. (string.sub(a1, v3, v1 - 1)) .. a2 .. a3
        v1 = string.find(a1, a2, v1 + v2, true)
    until v1 == nil
    return v4 .. string.sub(a1, v3)
end

local function stringEncaseCRLFWithFirstIndex(a1, a2, a3, a4) -- Line: 20
    local v1, v2, v3
    local v4 = 1
    local v5 = ""
    local v6, v7 = a4, a1
    repeat
        v3 = v6 - 1
        v1 = if not v2 then "\n" else "\r\n"
        v5 = v5 .. (string.sub(v7, v4, if not (string.sub(v7, v3, v6 - 1) == "\r") then v6 - 1 else v6 - 2)) .. v8 .. v1 .. v9
        v6 = string.find(v7, "\n", v6 + 1)
    until v6 == nil
    return v5 .. string.sub(v7, v4)
end

local v2 = {}
for k, v in pairs({
    modifier = {
        reset = {0, 0},
        bold = {1, 22},
        dim = {2, 22},
        italic = {3, 23},
        underline = {4, 24},
        overline = {53, 55},
        inverse = {7, 27},
        hidden = {8, 28},
        strikethrough = {9, 29},
    },
    color = {
        black = {30, 39},
        red = {31, 39},
        green = {32, 39},
        yellow = {33, 39},
        blue = {34, 39},
        magenta = {35, 39},
        cyan = {36, 39},
        white = {37, 39},
        blackBright = {90, 39},
        gray = {90, 39},
        grey = {90, 39},
        redBright = {91, 39},
        greenBright = {92, 39},
        yellowBright = {93, 39},
        blueBright = {94, 39},
        magentaBright = {95, 39},
        cyanBright = {96, 39},
        whiteBright = {97, 39},
    },
    bgColor = {
        bgBlack = {40, 49},
        bgRed = {41, 49},
        bgGreen = {42, 49},
        bgYellow = {43, 49},
        bgBlue = {44, 49},
        bgMagenta = {45, 49},
        bgCyan = {46, 49},
        bgWhite = {47, 49},
        bgBlackBright = {100, 49},
        bgGray = {100, 49},
        bgGrey = {100, 49},
        bgRedBright = {101, 49},
        bgGreenBright = {102, 49},
        bgYellowBright = {103, 49},
        bgBlueBright = {104, 49},
        bgMagentaBright = {105, 49},
        bgCyanBright = {106, 49},
        bgWhiteBright = {107, 49},
    },
}) do
    for k2, i in pairs(v) do
        v1 = {
            open = string.format("%c[%dm", 27, i[1]),
            close = string.format("%c[%dm", 27, i[2]),
        }
        v2[k2] = v1
    end
end
local createStyler = nil
local applyStyle = nil

local function compositeStyler(a1, a2) -- Line: 115 -- upvalues: createStyler (ref)
    return createStyler(a1.open .. a2.open, a2.close .. a1.close)
end

local u157 = {level = 2}
if _G.NOCOLOR then
    u157.level = 0
end
local v3 = {
    __call = function(a1, a2) -- Line: 125
        if a2 == nil then
            return ""
        end
        if type(a2) == "string" and #a2 == 0 then
            return ""
        end
        return (tostring(a2))
    end,
}
setmetatable(u157, v3)

function createStyler(a1, a2) -- Line: 133 -- upvalues: applyStyle (ref), compositeStyler (val)
    local v1 = {open = a1, close = a2}
    local v2 = {
        __call = function(a1, a2) -- Line: 140 -- upvalues: applyStyle (upval)
            return applyStyle(a1, a2)
        end,
        __concat = function(a1, a2) -- Line: 143 -- upvalues: compositeStyler (upval)
            return compositeStyler(a1, a2)
        end,
    }
    setmetatable(v1, v2)
    return v1
end

function applyStyle(a1, a2) -- Line: 151
    -- upvalues: u157 (val), stringReplaceAll (val), stringEncaseCRLFWithFirstIndex (val)
    if a2 == nil then
        return ""
    end
    if type(a2) == "string" and #a2 == 0 then
        return ""
    end
    if u157.level == 0 then
        return (tostring(a2))
    end
    local open = a1.open
    local close = a1.close
    local v1 = if not string.match(a2, "\027") then a2 else stringReplaceAll(a2, a1.close, a1.open)
    local v2 = string.find(v1, "\n")
    if v2 ~= nil then
        v1 = stringEncaseCRLFWithFirstIndex(v1, close, open, v2)
    end
    return a1.open .. (tostring(v1)) .. a1.close
end

local function noStyle() -- Line: 182 -- upvalues: createStyler (ref)
    return createStyler("", "")
end

local u180 = string.format("%c[%dm", 27, 39)
local u185 = string.format("%c[%dm", 27, 49)
local v4 = string.format("%c[%dm", 27, 0)
for k3, j in pairs(v2) do
    u157[k3] = (createStyler(j.open, j.close))
end
u157.reset = createStyler(v4, v4)

local function rgbToAnsi256(a1, a2, a3) -- Line: 196
    if a1 == a2 and a2 == a3 then
        if a1 < 8 then
            return 16
        end
        if a1 > 248 then
            return 231
        end
        return (math.round((a1 - 8) / 247 * 24 + 232))
    end
    return math.round(a1 / 255 * 5) * 36 + 16 + math.round(a2 / 255 * 5) * 6 + math.round(a3 / 255 * 5)
end

function u157.rgb(a1, a2, a3) -- Line: 215
    -- upvalues: noStyle (val), rgbToAnsi256 (val), createStyler (ref), u180 (val)
    if type(a1) == "number"
        and type(a2) == "number"
        and type(a3) == "number"
        and not (a1 > 255)
        and not (a1 < 0)
        and not (a2 > 255)
        and not (a2 < 0)
        and not (a3 > 255)
        and not (a3 < 0) then
        return createStyler(string.format("%c[%d;5;%dm", 27, 38, (rgbToAnsi256(a1, a2, a3))), u180)
    end
    return noStyle()
end

function u157.bgRgb(a1, a2, a3) -- Line: 233
    -- upvalues: noStyle (val), rgbToAnsi256 (val), createStyler (ref), u185 (val)
    if type(a1) == "number"
        and type(a2) == "number"
        and type(a3) == "number"
        and not (a1 > 255)
        and not (a1 < 0)
        and not (a2 > 255)
        and not (a2 < 0)
        and not (a3 > 255)
        and not (a3 < 0) then
        return createStyler(string.format("%c[%d;5;%dm", 27, 48, (rgbToAnsi256(a1, a2, a3))), u185)
    end
    return noStyle()
end

local function hexToRgb(a1) -- Line: 251 -- upvalues: rgbToAnsi256 (val)
    return (rgbToAnsi256(tonumber(string.sub(a1, 2, 3), 16), tonumber(string.sub(a1, 4, 5), 16), (tonumber(string.sub(a1, 6, 7), 16))))
end

function u157.hex(a1) -- Line: 259 -- upvalues: noStyle (val), rgbToAnsi256 (val), createStyler (ref), u180 (val)
    if type(a1) == "string" and string.find(a1, "#%X") == nil and #a1 == 7 then
        return createStyler(string.format(
            "%c[%d;5;%dm",
            27,
            38,
            (rgbToAnsi256(tonumber(string.sub(a1, 2, 3), 16), tonumber(string.sub(a1, 4, 5), 16), (tonumber(string.sub(a1, 6, 7), 16))))
        ), u180)
    end
    return noStyle()
end

function u157.bgHex(a1) -- Line: 267 -- upvalues: noStyle (val), rgbToAnsi256 (val), createStyler (ref), u185 (val)
    if type(a1) == "string" and string.find(a1, "#%X") == nil and #a1 == 7 then
        return createStyler(string.format(
            "%c[%d;5;%dm",
            27,
            48,
            (rgbToAnsi256(tonumber(string.sub(a1, 2, 3), 16), tonumber(string.sub(a1, 4, 5), 16), (tonumber(string.sub(a1, 6, 7), 16))))
        ), u185)
    end
    return noStyle()
end

function u157.ansi(a1) -- Line: 275 -- upvalues: noStyle (val), createStyler (ref), u180 (val)
    if type(a1) == "number" and not (a1 < 30) then
        if a1 > 37 and a1 < 90 then
            return noStyle()
        end
        if not (a1 > 97) then
            return createStyler(string.format("%c[%dm", 27, a1), u180)
        end
    end
    return noStyle()
end

function u157.bgAnsi(a1) -- Line: 283 -- upvalues: noStyle (val), createStyler (ref), u185 (val)
    if type(a1) == "number" and not (a1 < 40) then
        if a1 > 47 and a1 < 100 then
            return noStyle()
        end
        if not (a1 > 107) then
            return createStyler(string.format("%c[%dm", 27, a1), u185)
        end
    end
    return noStyle()
end

function u157.ansi256(a1) -- Line: 291 -- upvalues: noStyle (val), createStyler (ref), u180 (val)
    if type(a1) == "number" and not (a1 < 0) and not (a1 > 255) then
        return createStyler(string.format("%c[%d;5;%dm", 27, 38, a1), u180)
    end
    return noStyle()
end

function u157.bgAnsi256(a1) -- Line: 299 -- upvalues: noStyle (val), createStyler (ref), u185 (val)
    if type(a1) == "number" and not (a1 < 0) and not (a1 > 255) then
        return createStyler(string.format("%c[%d;5;%dm", 27, 48, a1), u185)
    end
    return noStyle()
end

return u157