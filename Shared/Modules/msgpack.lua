-- Script path: ReplicatedStorage.Shared.Modules.msgpack
-- Decompile time: 35.51 ms

local computeLength, encode, parse
local u0 = {}
local band = bit32.band
local bor = bit32.bor
local create = buffer.create
local len = buffer.len
local copy = buffer.copy
local readstring = buffer.readstring
local writestring = buffer.writestring
local readu8 = buffer.readu8
local readi8 = buffer.readi8
local writeu8 = buffer.writeu8
local writei8 = buffer.writei8
local lshift = bit32.lshift
local extract = bit32.extract
local floor = math.floor
local modf = math.modf
local sign = math.sign
local byte = string.byte
local create_2 = table.create

local function reverse(a1, a2, a3) -- Line: 26
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1
    local v2 = a3 // 2
    for i = 1, v2 do
        v1 = readu8(a1, a2 + i - 1)
        copy(a1, a2 + i - 1, a1, a2 + a3 - i, 1)
        writeu8(a1, a2 + a3 - i, v1)
    end
end

local function writeu16(a1, a2, a3) -- Line: 34
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    buffer.writeu16(a1, a2, a3)
    local v1 = readu8(a1, a2 + 1 - 1)
    copy(a1, a2 + 1 - 1, a1, a2 + 2 - 1, 1)
    writeu8(a1, a2 + 2 - 1, v1)
end

local function writei16(a1, a2, a3) -- Line: 39
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    buffer.writei16(a1, a2, a3)
    local v1 = readu8(a1, a2 + 1 - 1)
    copy(a1, a2 + 1 - 1, a1, a2 + 2 - 1, 1)
    writeu8(a1, a2 + 2 - 1, v1)
end

local function writeu32(a1, a2, a3) -- Line: 44
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1
    buffer.writeu32(a1, a2, a3)
    for i = 1, 2 do
        v1 = readu8(a1, a2 + i - 1)
        copy(a1, a2 + i - 1, a1, a2 + 4 - i, 1)
        writeu8(a1, a2 + 4 - i, v1)
    end
end

local function writei32(a1, a2, a3) -- Line: 49
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1
    buffer.writei32(a1, a2, a3)
    for i = 1, 2 do
        v1 = readu8(a1, a2 + i - 1)
        copy(a1, a2 + i - 1, a1, a2 + 4 - i, 1)
        writeu8(a1, a2 + 4 - i, v1)
    end
end

local function writef64(a1, a2, a3) -- Line: 54 -- upvalues: reverse (val) -- types: a1: buffer, a2: number, a3: number
    buffer.writef64(a1, a2, a3)
    reverse(a1, a2, 8)
end

local function readu16(a1, a2) -- Line: 59
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1 = readu8(a1, a2 + 1 - 1)
    copy(a1, a2 + 1 - 1, a1, a2 + 2 - 1, 1)
    writeu8(a1, a2 + 2 - 1, v1)
    return (buffer.readu16(a1, a2))
end

local function readi16(a1, a2) -- Line: 64
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1 = readu8(a1, a2 + 1 - 1)
    copy(a1, a2 + 1 - 1, a1, a2 + 2 - 1, 1)
    writeu8(a1, a2 + 2 - 1, v1)
    return (buffer.readi16(a1, a2))
end

local function readu32(a1, a2) -- Line: 69
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1
    for i = 1, 2 do
        v1 = readu8(a1, a2 + i - 1)
        copy(a1, a2 + i - 1, a1, a2 + 4 - i, 1)
        writeu8(a1, a2 + 4 - i, v1)
    end
    return (buffer.readu32(a1, a2))
end

local function readi32(a1, a2) -- Line: 74
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1
    for i = 1, 2 do
        v1 = readu8(a1, a2 + i - 1)
        copy(a1, a2 + i - 1, a1, a2 + 4 - i, 1)
        writeu8(a1, a2 + 4 - i, v1)
    end
    return (buffer.readi32(a1, a2))
end

local function readf32(a1, a2) -- Line: 79
    -- upvalues: readu8 (val), copy (val), writeu8 (val)
    local v1
    for i = 1, 2 do
        v1 = readu8(a1, a2 + i - 1)
        copy(a1, a2 + i - 1, a1, a2 + 4 - i, 1)
        writeu8(a1, a2 + 4 - i, v1)
    end
    return (buffer.readf32(a1, a2))
end

local function readf64(a1, a2) -- Line: 84 -- upvalues: reverse (val) -- types: a1: buffer, a2: number
    reverse(a1, a2, 8)
    return (buffer.readf64(a1, a2))
end

function parse(a1, a2) -- Line: 89
    -- upvalues: readu8 (val), create (val), copy (val), writeu8 (val), u0 (val), reverse (val), readi8 (val)
    -- upvalues: readstring (val), create_2 (val), parse (val), band (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local v10 = readu8(a1, a2)
    if v10 == 192 then
        return nil, a2 + 1
    end
    if v10 == 194 then
        return false, a2 + 1
    end
    if v10 == 195 then
        return true, a2 + 1
    end
    if v10 == 196 then
        v4 = readu8(a1, a2 + 1)
        v5 = create(v4)
        copy(v5, 0, a1, a2 + 2, v4)
        return v5, a2 + 2 + v4
    end
    if v10 == 197 then
        v5 = a2 + 1
        v6 = readu8(a1, v5 + 1 - 1)
        copy(a1, v5 + 1 - 1, a1, v5 + 2 - 1, 1)
        writeu8(a1, v5 + 2 - 1, v6)
        v4 = buffer.readu16(a1, v5)
        v5 = create(v4)
        copy(v5, 0, a1, a2 + 3, v4)
        return v5, a2 + 3 + v4
    end
    if v10 == 198 then
        v5 = a2 + 1
        for i17 = 1, 2 do
            v8 = readu8(a1, v5 + i17 - 1)
            copy(a1, v5 + i17 - 1, a1, v5 + 4 - i17, 1)
            writeu8(a1, v5 + 4 - i17, v8)
        end
        v4 = buffer.readu32(a1, v5)
        v5 = create(v4)
        copy(v5, 0, a1, a2 + 5, v4)
        return v5, a2 + 5 + v4
    end
    if v10 == 199 then
        v4 = readu8(a1, a2 + 1)
        v5 = create(v4)
        copy(v5, 0, a1, a2 + 3, v4)
        return (u0.Extension.new(readu8(a1, a2 + 2), v5)), a2 + 2 + v4
    end
    if v10 == 200 then
        v5 = a2 + 1
        v6 = readu8(a1, v5 + 1 - 1)
        copy(a1, v5 + 1 - 1, a1, v5 + 2 - 1, 1)
        writeu8(a1, v5 + 2 - 1, v6)
        v4 = buffer.readu16(a1, v5)
        v5 = create(v4)
        copy(v5, 0, a1, a2 + 4, v4)
        return (u0.Extension.new(readu8(a1, a2 + 3), v5)), a2 + 3 + v4
    end
    if v10 == 201 then
        v5 = a2 + 1
        for i16 = 1, 2 do
            v8 = readu8(a1, v5 + i16 - 1)
            copy(a1, v5 + i16 - 1, a1, v5 + 4 - i16, 1)
            writeu8(a1, v5 + 4 - i16, v8)
        end
        v4 = buffer.readu32(a1, v5)
        v5 = create(v4)
        copy(v5, 0, a1, a2 + 6, v4)
        return (u0.Extension.new(readu8(a1, a2 + 5), v5)), a2 + 5 + v4
    end
    if v10 == 202 then
        v5 = a2 + 1
        for i15 = 1, 2 do
            v8 = readu8(a1, v5 + i15 - 1)
            copy(a1, v5 + i15 - 1, a1, v5 + 4 - i15, 1)
            writeu8(a1, v5 + 4 - i15, v8)
        end
        return buffer.readf32(a1, v5), a2 + 5
    end
    if v10 == 203 then
        v5 = a2 + 1
        reverse(a1, v5, 8)
        return buffer.readf64(a1, v5), a2 + 9
    end
    if v10 == 204 then
        return (readu8(a1, a2 + 1)), a2 + 2
    end
    if v10 == 205 then
        v5 = a2 + 1
        v6 = readu8(a1, v5 + 1 - 1)
        copy(a1, v5 + 1 - 1, a1, v5 + 2 - 1, 1)
        writeu8(a1, v5 + 2 - 1, v6)
        return buffer.readu16(a1, v5), a2 + 3
    end
    if v10 == 206 then
        v5 = a2 + 1
        for i14 = 1, 2 do
            v8 = readu8(a1, v5 + i14 - 1)
            copy(a1, v5 + i14 - 1, a1, v5 + 4 - i14, 1)
            writeu8(a1, v5 + 4 - i14, v8)
        end
        return buffer.readu32(a1, v5), a2 + 5
    end
    if v10 == 207 then
        local new_4 = u0.UInt64.new
        v6 = a2 + 1
        for i12 = 1, 2 do
            v9 = readu8(a1, v6 + i12 - 1)
            copy(a1, v6 + i12 - 1, a1, v6 + 4 - i12, 1)
            writeu8(a1, v6 + 4 - i12, v9)
        end
        v5 = buffer.readu32(a1, v6)
        v7 = a2 + 5
        for i13 = 1, 2 do
            v1 = readu8(a1, v7 + i13 - 1)
            copy(a1, v7 + i13 - 1, a1, v7 + 4 - i13, 1)
            writeu8(a1, v7 + 4 - i13, v1)
        end
        return (new_4(v5, (buffer.readu32(a1, v7)))), a2 + 9
    end
    if v10 == 208 then
        return (readi8(a1, a2 + 1)), a2 + 2
    end
    if v10 == 209 then
        v5 = a2 + 1
        v6 = readu8(a1, v5 + 1 - 1)
        copy(a1, v5 + 1 - 1, a1, v5 + 2 - 1, 1)
        writeu8(a1, v5 + 2 - 1, v6)
        return buffer.readi16(a1, v5), a2 + 3
    end
    if v10 == 210 then
        v5 = a2 + 1
        for i11 = 1, 2 do
            v8 = readu8(a1, v5 + i11 - 1)
            copy(a1, v5 + i11 - 1, a1, v5 + 4 - i11, 1)
            writeu8(a1, v5 + 4 - i11, v8)
        end
        return buffer.readi32(a1, v5), a2 + 5
    end
    if v10 == 211 then
        local new_5 = u0.Int64.new
        v6 = a2 + 1
        for i9 = 1, 2 do
            v9 = readu8(a1, v6 + i9 - 1)
            copy(a1, v6 + i9 - 1, a1, v6 + 4 - i9, 1)
            writeu8(a1, v6 + 4 - i9, v9)
        end
        v5 = buffer.readu32(a1, v6)
        v7 = a2 + 5
        for i10 = 1, 2 do
            v1 = readu8(a1, v7 + i10 - 1)
            copy(a1, v7 + i10 - 1, a1, v7 + 4 - i10, 1)
            writeu8(a1, v7 + 4 - i10, v1)
        end
        return (new_5(v5, (buffer.readu32(a1, v7)))), a2 + 9
    end
    if v10 == 212 then
        v4 = create(1)
        copy(v4, 0, a1, a2 + 2, 1)
        return (u0.Extension.new(readu8(a1, a2 + 1), v4)), a2 + 3
    end
    if v10 == 213 then
        v4 = create(2)
        copy(v4, 0, a1, a2 + 2, 2)
        return (u0.Extension.new(readu8(a1, a2 + 1), v4)), a2 + 4
    end
    if v10 == 214 then
        v4 = create(4)
        copy(v4, 0, a1, a2 + 2, 4)
        return (u0.Extension.new(readu8(a1, a2 + 1), v4)), a2 + 6
    end
    if v10 == 215 then
        v4 = create(8)
        copy(v4, 0, a1, a2 + 2, 8)
        return (u0.Extension.new(readu8(a1, a2 + 1), v4)), a2 + 10
    end
    if v10 == 216 then
        v4 = create(16)
        copy(v4, 0, a1, a2 + 2, 16)
        return (u0.Extension.new(readu8(a1, a2 + 1), v4)), a2 + 18
    end
    if v10 == 217 then
        v4 = readu8(a1, a2 + 1)
        return (readstring(a1, a2 + 2, v4)), a2 + 2 + v4
    end
    if v10 == 218 then
        v5 = a2 + 1
        v6 = readu8(a1, v5 + 1 - 1)
        copy(a1, v5 + 1 - 1, a1, v5 + 2 - 1, 1)
        writeu8(a1, v5 + 2 - 1, v6)
        v4 = buffer.readu16(a1, v5)
        return (readstring(a1, a2 + 3, v4)), a2 + 3 + v4
    end
    if v10 == 219 then
        v5 = a2 + 1
        for i8 = 1, 2 do
            v8 = readu8(a1, v5 + i8 - 1)
            copy(a1, v5 + i8 - 1, a1, v5 + 4 - i8, 1)
            writeu8(a1, v5 + 4 - i8, v8)
        end
        v4 = buffer.readu32(a1, v5)
        return (readstring(a1, a2 + 5, v4)), a2 + 5 + v4
    end
    if v10 == 220 then
        v5 = a2 + 1
        v6 = readu8(a1, v5 + 1 - 1)
        copy(a1, v5 + 1 - 1, a1, v5 + 2 - 1, 1)
        writeu8(a1, v5 + 2 - 1, v6)
        v4 = buffer.readu16(a1, v5)
        v5 = create_2(v4)
        v6 = a2 + 3
        for i7 = 1, v4 do
            v1, v2 = parse(a1, v6)
            v5[i7] = v1
            v6 = v2
        end
        return v5, v6
    end
    if v10 == 221 then
        v5 = a2 + 1
        for i5 = 1, 2 do
            v8 = readu8(a1, v5 + i5 - 1)
            copy(a1, v5 + i5 - 1, a1, v5 + 4 - i5, 1)
            writeu8(a1, v5 + 4 - i5, v8)
        end
        v4 = buffer.readu32(a1, v5)
        v5 = create_2(v4)
        v6 = a2 + 5
        for i6 = 1, v4 do
            v1, v2 = parse(a1, v6)
            v5[i6] = v1
            v6 = v2
        end
        return v5, v6
    end
    if v10 == 222 then
        v5 = a2 + 1
        v6 = readu8(a1, v5 + 1 - 1)
        copy(a1, v5 + 1 - 1, a1, v5 + 2 - 1, 1)
        writeu8(a1, v5 + 2 - 1, v6)
        v4 = buffer.readu16(a1, v5)
        v5 = {}
        v6 = a2 + 3
        for m = 1, v4 do
            v1, v2 = parse(a1, v6)
            v2, v3 = parse(a1, v2)
            v5[v1] = v2
            v6 = v3
        end
        return v5, v6
    end
    if v10 == 223 then
        v5 = a2 + 1
        for k = 1, 2 do
            v8 = readu8(a1, v5 + k - 1)
            copy(a1, v5 + k - 1, a1, v5 + 4 - k, 1)
            writeu8(a1, v5 + 4 - k, v8)
        end
        v4 = buffer.readu32(a1, v5)
        v5 = {}
        v6 = a2 + 5
        for n = 1, v4 do
            v1, v2 = parse(a1, v6)
            v2, v3 = parse(a1, v2)
            v5[v1] = v2
            v6 = v3
        end
        return v5, v6
    end
    if v10 >= 224 then
        return v10 - 256, a2 + 1
    end
    if v10 <= 127 then
        return v10, a2 + 1
    end
    if v10 - 128 <= 15 then
        v4 = band(v10, 15)
        v5 = {}
        v6 = a2 + 1
        for j = 1, v4 do
            v1, v2 = parse(a1, v6)
            v2, v3 = parse(a1, v2)
            v5[v1] = v2
            v6 = v3
        end
        return v5, v6
    end
    if not (v10 - 144 <= 15) then
        if v10 - 160 <= 31 then
            v4 = v10 - 160
            return (readstring(a1, a2 + 1, v4)), a2 + 1 + v4
        end
        error("Not all decoder cases are handled, report as bug to msgpack-luau maintainer")
        return
    end
    v4 = band(v10, 15)
    v5 = create_2(v4)
    v6 = a2 + 1
    for i = 1, v4 do
        v1, v2 = parse(a1, v6)
        v5[i] = v1
        v6 = v2
    end
    return v5, v6
end

function computeLength(a1, a2) -- Line: 257
    -- upvalues: len (val), modf (val), sign (val), u0 (val), computeLength (val)
    local v1, v2, v3, v4, v5
    local v6 = type(a1)
    if a1 == nil or v6 == "boolean" then
        return 1
    end
    if v6 == "string" then
        v1 = #a1
        if v1 <= 31 then
            return v1 + 1
        end
        if v1 <= 255 then
            return v1 + 2
        end
        if v1 <= 65535 then
            return v1 + 3
        end
        if v1 <= 4294967295 then
            return v1 + 5
        end
        error("Could not encode - too long string")
        error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a1))))
        return
    end
    if v6 == "buffer" then
        v1 = len(a1)
        if v1 <= 255 then
            return 2 + v1
        end
        if v1 <= 65535 then
            return 3 + v1
        end
        if v1 <= 4294967295 then
            return 5 + v1
        end
        error("Could not encode - too long binary buffer")
        error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a1))))
        return
    end
    if v6 == "number" then
        if a1 == 0 then
            return 1
        end
        if a1 ~= a1 or a1 == (1 / 0) or a1 == (-1 / 0) then
            return 5
        end
        v1, v2 = modf(a1)
        v3 = sign(a1)
        if v2 == 0 and not (v1 > 4294967295) and not (v1 < -2147483648) then
            if v3 > 0 then
                if v1 <= 127 then
                    return 1
                end
                if v1 <= 255 then
                    return 2
                end
                if v1 <= 65535 then
                    return 3
                end
                if v1 <= 4294967295 then
                    return 5
                end
                error(string.format("Could not encode - unhandled number \"%s\"", (typeof(a1))))
                error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a1))))
                return
            end
            if v1 >= -32 then
                return 1
            end
            if v1 >= -128 then
                return 2
            end
            if v1 >= -32768 then
                return 3
            end
            if v1 >= -2147483648 then
                return 5
            end
            error(string.format("Could not encode - unhandled number \"%s\"", (typeof(a1))))
            error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a1))))
            return
        end
        return 9
    end
    if v6 ~= "table" then
        error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a1))))
        return
    end
    local _msgpackType = a1._msgpackType
    if not _msgpackType then
        if not a2[a1] then
            a2[a1] = true
        else
            error("Can not serialize cyclic table")
        end
        v2 = #a1
        v3 = 0
        for k3, k4 in pairs(a1) do
            v3 = v3 + 1
        end
        v4 = nil
        if v3 <= 15 then
            v4 = 1
        elseif v3 <= 65535 then
            v4 = 3
        elseif v3 <= 4294967295 then
            v4 = 5
        elseif v2 ~= v3 then
            error("Could not encode - too long map")
        else
            error("Could not encode - too long array")
        end
        if v2 == v3 then
            v5 = 0
            for i3, m in ipairs(a1) do
                v5 = v5 + computeLength(m, a2)
            end
            return v4 + v5
        end
        v5 = 0
        for k5, n in pairs(a1) do
            v5 = v5 + computeLength(k5, a2)
            v5 = v5 + computeLength(n, a2)
        end
        return v4 + v5
    end
    if _msgpackType ~= u0.Int64 and _msgpackType ~= u0.UInt64 then
        if _msgpackType == u0.Extension then
            v2 = len(a1.data)
            if v2 == 1 then
                return 3
            end
            if v2 == 2 then
                return 4
            end
            if v2 == 4 then
                return 6
            end
            if v2 == 8 then
                return 10
            end
            if v2 == 16 then
                return 18
            end
            if v2 <= 255 then
                return 3 + v2
            end
            if v2 <= 65535 then
                return 4 + v2
            end
            if v2 <= 4294967295 then
                return 6 + v2
            end
            error("Could not encode - too long extension data")
        end
        if not a2[a1] then
            a2[a1] = true
        else
            error("Can not serialize cyclic table")
        end
        v2 = #a1
        v3 = 0
        for k, v in pairs(a1) do
            v3 = v3 + 1
        end
        v4 = nil
        if v3 <= 15 then
            v4 = 1
        elseif v3 <= 65535 then
            v4 = 3
        elseif v3 <= 4294967295 then
            v4 = 5
        elseif v2 ~= v3 then
            error("Could not encode - too long map")
        else
            error("Could not encode - too long array")
        end
        if v2 == v3 then
            v5 = 0
            for i2, j in ipairs(a1) do
                v5 = v5 + computeLength(j, a2)
            end
            return v4 + v5
        end
        v5 = 0
        for k2, i in pairs(a1) do
            v5 = v5 + computeLength(k2, a2)
            v5 = v5 + computeLength(i, a2)
        end
        return v4 + v5
    end
    return 9
end

local u33 = {
    212,
    213,
    [4] = 214,
    [8] = 215,
    [16] = 216,
}

function encode(a1, a2, a3) -- Line: 420
    -- upvalues: writestring (val), bor (val), writeu8 (val), readu8 (val), copy (val), len (val), modf (val)
    -- upvalues: sign (val), reverse (val), extract (val), writei8 (val), u0 (val), u33 (val), encode (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = type(a3)
    if a3 == nil then
        writestring(a1, a2, "À")
        return a2 + 1
    end
    if a3 == false then
        writestring(a1, a2, "Â")
        return a2 + 1
    end
    if a3 == true then
        writestring(a1, a2, "Ã")
        return a2 + 1
    end
    if v11 == "string" then
        v5 = #a3
        if v5 <= 31 then
            writeu8(a1, a2, (bor(160, v5)))
            writestring(a1, a2 + 1, a3)
            return a2 + 1 + v5
        end
        if v5 <= 255 then
            writeu8(a1, a2, 217)
            writeu8(a1, a2 + 1, v5)
            writestring(a1, a2 + 2, a3)
            return a2 + 2 + v5
        end
        if v5 <= 65535 then
            writeu8(a1, a2, 218)
            v6 = a2 + 1
            buffer.writeu16(a1, v6, v5)
            v7 = readu8(a1, v6 + 1 - 1)
            copy(a1, v6 + 1 - 1, a1, v6 + 2 - 1, 1)
            writeu8(a1, v6 + 2 - 1, v7)
            writestring(a1, a2 + 3, a3)
            return a2 + 3 + v5
        end
        if not (v5 <= 4294967295) then
            error("Could not encode - too long string")
            error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a3))))
            return
        end
        writeu8(a1, a2, 219)
        v6 = a2 + 1
        buffer.writeu32(a1, v6, v5)
        for i15 = 1, 2 do
            v10 = readu8(a1, v6 + i15 - 1)
            copy(a1, v6 + i15 - 1, a1, v6 + 4 - i15, 1)
            writeu8(a1, v6 + 4 - i15, v10)
        end
        writestring(a1, a2 + 5, a3)
        return a2 + 5 + v5
    end
    if v11 == "buffer" then
        v5 = len(a3)
        if v5 <= 255 then
            writeu8(a1, a2, 196)
            writeu8(a1, a2 + 1, v5)
            copy(a1, a2 + 2, a3)
            return a2 + 2 + v5
        end
        if v5 <= 65535 then
            writeu8(a1, a2, 197)
            v6 = a2 + 1
            buffer.writeu16(a1, v6, v5)
            v7 = readu8(a1, v6 + 1 - 1)
            copy(a1, v6 + 1 - 1, a1, v6 + 2 - 1, 1)
            writeu8(a1, v6 + 2 - 1, v7)
            copy(a1, a2 + 3, a3)
            return a2 + 3 + v5
        end
        if not (v5 <= 4294967295) then
            error("Could not encode - too long binary buffer")
            error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a3))))
            return
        end
        writeu8(a1, a2, 198)
        v6 = a2 + 1
        buffer.writeu32(a1, v6, v5)
        for i14 = 1, 2 do
            v10 = readu8(a1, v6 + i14 - 1)
            copy(a1, v6 + i14 - 1, a1, v6 + 4 - i14, 1)
            writeu8(a1, v6 + 4 - i14, v10)
        end
        copy(a1, a2 + 5, a3)
        return a2 + 5 + v5
    end
    if v11 == "number" then
        if a3 == 0 then
            writeu8(a1, a2, 0)
            return a2 + 1
        end
        if a3 ~= a3 then
            writestring(a1, a2, "Ê\127€\000\001")
            return a2 + 5
        end
        if a3 == (1 / 0) then
            writestring(a1, a2, "Ê\127€\000\000")
            return a2 + 5
        end
        if a3 == (-1 / 0) then
            writestring(a1, a2, "Êÿ€\000\000")
            return a2 + 5
        end
        v5, v6 = modf(a3)
        v7 = sign(a3)
        if v6 == 0 and not (v5 > 4294967295) and not (v5 < -2147483648) then
            if v7 > 0 then
                if v5 <= 127 then
                    writeu8(a1, a2, v5)
                    return a2 + 1
                end
                if v5 <= 255 then
                    writeu8(a1, a2, 204)
                    writeu8(a1, a2 + 1, v5)
                    return a2 + 2
                end
                if v5 <= 65535 then
                    writeu8(a1, a2, 205)
                    v8 = a2 + 1
                    buffer.writeu16(a1, v8, v5)
                    v9 = readu8(a1, v8 + 1 - 1)
                    copy(a1, v8 + 1 - 1, a1, v8 + 2 - 1, 1)
                    writeu8(a1, v8 + 2 - 1, v9)
                    return a2 + 3
                end
                if not (v5 <= 4294967295) then
                    error(string.format("Could not encode - unhandled number \"%s\"", (typeof(a3))))
                    error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a3))))
                    return
                end
                writeu8(a1, a2, 206)
                v8 = a2 + 1
                buffer.writeu32(a1, v8, v5)
                for i13 = 1, 2 do
                    v2 = readu8(a1, v8 + i13 - 1)
                    copy(a1, v8 + i13 - 1, a1, v8 + 4 - i13, 1)
                    writeu8(a1, v8 + 4 - i13, v2)
                end
                return a2 + 5
            end
            if v5 >= -32 then
                writeu8(a1, a2, (bor(224, (extract(v5, 0, 5)))))
                return a2 + 1
            end
            if v5 >= -128 then
                writeu8(a1, a2, 208)
                writei8(a1, a2 + 1, v5)
                return a2 + 2
            end
            if v5 >= -32768 then
                writeu8(a1, a2, 209)
                v8 = a2 + 1
                buffer.writei16(a1, v8, v5)
                v9 = readu8(a1, v8 + 1 - 1)
                copy(a1, v8 + 1 - 1, a1, v8 + 2 - 1, 1)
                writeu8(a1, v8 + 2 - 1, v9)
                return a2 + 3
            end
            if not (v5 >= -2147483648) then
                error(string.format("Could not encode - unhandled number \"%s\"", (typeof(a3))))
                error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a3))))
                return
            end
            writeu8(a1, a2, 210)
            v8 = a2 + 1
            buffer.writei32(a1, v8, v5)
            for i12 = 1, 2 do
                v2 = readu8(a1, v8 + i12 - 1)
                copy(a1, v8 + i12 - 1, a1, v8 + 4 - i12, 1)
                writeu8(a1, v8 + 4 - i12, v2)
            end
            return a2 + 5
        end
        writeu8(a1, a2, 203)
        v8 = a2 + 1
        buffer.writef64(a1, v8, a3)
        reverse(a1, v8, 8)
        return a2 + 9
    end
    if v11 ~= "table" then
        error(string.format("Could not encode - unsupported datatype \"%s\"", (typeof(a3))))
        return
    end
    local _msgpackType = a3._msgpackType
    if not _msgpackType then
        v6 = #a3
        v7 = 0
        for k4, i7 in pairs(a3) do
            v7 = v7 + 1
        end
        if v6 == v7 then
            v8 = a2
            if v6 <= 15 then
                writeu8(a1, a2, (bor(144, v7)))
                v8 = v8 + 1
            elseif v6 <= 65535 then
                writeu8(a1, a2, 220)
                v9 = a2 + 1
                buffer.writeu16(a1, v9, v6)
                v10 = readu8(a1, v9 + 1 - 1)
                copy(a1, v9 + 1 - 1, a1, v9 + 2 - 1, 1)
                writeu8(a1, v9 + 2 - 1, v10)
                v8 = v8 + 3
            elseif not (v6 <= 4294967295) then
                error("Could not encode - too long array")
            else
                writeu8(a1, a2, 221)
                v9 = a2 + 1
                buffer.writeu32(a1, v9, v6)
                for i10 = 1, 2 do
                    v3 = readu8(a1, v9 + i10 - 1)
                    copy(a1, v9 + i10 - 1, a1, v9 + 4 - i10, 1)
                    writeu8(a1, v9 + 4 - i10, v3)
                end
                v8 = v8 + 5
            end
            for i3, i11 in ipairs(a3) do
                v8 = encode(a1, v8, i11)
            end
            return v8
        end
        v8 = a2
        if v7 <= 15 then
            writeu8(a1, a2, (bor(128, v7)))
            v8 = v8 + 1
        elseif v7 <= 65535 then
            writeu8(a1, a2, 222)
            v9 = a2 + 1
            buffer.writeu16(a1, v9, v7)
            v1 = readu8(a1, v9 + 1 - 1)
            copy(a1, v9 + 1 - 1, a1, v9 + 2 - 1, 1)
            writeu8(a1, v9 + 2 - 1, v1)
            v8 = v8 + 3
        elseif not (v7 <= 4294967295) then
            error("Could not encode - too long map")
        else
            writeu8(a1, a2, 223)
            v9 = a2 + 1
            buffer.writeu32(a1, v9, v7)
            for i8 = 1, 2 do
                v4 = readu8(a1, v9 + i8 - 1)
                copy(a1, v9 + i8 - 1, a1, v9 + 4 - i8, 1)
                writeu8(a1, v9 + 4 - i8, v4)
            end
            v8 = v8 + 5
        end
        for k5, i9 in pairs(a3) do
            v8 = encode(a1, v8, k5)
            v8 = encode(a1, v8, i9)
        end
        return v8
    end
    if _msgpackType ~= u0.Int64 and _msgpackType ~= u0.UInt64 then
        if _msgpackType == u0.Extension then
            v6 = len(a3.data)
            v7 = u33[v6]
            if v7 then
                writeu8(a1, a2, v7)
                writeu8(a1, a2 + 1, a3.type)
                copy(a1, a2 + 2, a3.data)
                return a2 + 2 + v6
            end
            if v6 <= 255 then
                writeu8(a1, a2, 199)
                writeu8(a1, a2 + 1, v6)
                writeu8(a1, a2 + 2, a3.type)
                copy(a1, a2 + 3, a3.data)
                return a2 + 3 + v6
            end
            if v6 <= 65535 then
                writeu8(a1, a2, 200)
                v8 = a2 + 1
                buffer.writeu16(a1, v8, v6)
                v9 = readu8(a1, v8 + 1 - 1)
                copy(a1, v8 + 1 - 1, a1, v8 + 2 - 1, 1)
                writeu8(a1, v8 + 2 - 1, v9)
                writeu8(a1, a2 + 3, a3.type)
                copy(a1, a2 + 4, a3.data)
                return a2 + 4 + v6
            end
            if v6 <= 4294967295 then
                writeu8(a1, a2, 201)
                v8 = a2 + 1
                buffer.writeu32(a1, v8, v6)
                for i = 1, 2 do
                    v2 = readu8(a1, v8 + i - 1)
                    copy(a1, v8 + i - 1, a1, v8 + 4 - i, 1)
                    writeu8(a1, v8 + 4 - i, v2)
                end
                writeu8(a1, a2 + 5, a3.type)
                copy(a1, a2 + 6, a3.data)
                return a2 + 6 + v6
            end
            error("Could not encode - too long extension data")
        end
        v6 = #a3
        v7 = 0
        for k, v in pairs(a3) do
            v7 = v7 + 1
        end
        if v6 == v7 then
            v8 = a2
            if v6 <= 15 then
                writeu8(a1, a2, (bor(144, v7)))
                v8 = v8 + 1
            elseif v6 <= 65535 then
                writeu8(a1, a2, 220)
                v9 = a2 + 1
                buffer.writeu16(a1, v9, v6)
                v10 = readu8(a1, v9 + 1 - 1)
                copy(a1, v9 + 1 - 1, a1, v9 + 2 - 1, 1)
                writeu8(a1, v9 + 2 - 1, v10)
                v8 = v8 + 3
            elseif not (v6 <= 4294967295) then
                error("Could not encode - too long array")
            else
                writeu8(a1, a2, 221)
                v9 = a2 + 1
                buffer.writeu32(a1, v9, v6)
                for n = 1, 2 do
                    v3 = readu8(a1, v9 + n - 1)
                    copy(a1, v9 + n - 1, a1, v9 + 4 - n, 1)
                    writeu8(a1, v9 + 4 - n, v3)
                end
                v8 = v8 + 5
            end
            for i2, m in ipairs(a3) do
                v8 = encode(a1, v8, m)
            end
            return v8
        end
        v8 = a2
        if v7 <= 15 then
            writeu8(a1, a2, (bor(128, v7)))
            v8 = v8 + 1
        elseif v7 <= 65535 then
            writeu8(a1, a2, 222)
            v9 = a2 + 1
            buffer.writeu16(a1, v9, v7)
            v1 = readu8(a1, v9 + 1 - 1)
            copy(a1, v9 + 1 - 1, a1, v9 + 2 - 1, 1)
            writeu8(a1, v9 + 2 - 1, v1)
            v8 = v8 + 3
        elseif not (v7 <= 4294967295) then
            error("Could not encode - too long map")
        else
            writeu8(a1, a2, 223)
            v9 = a2 + 1
            buffer.writeu32(a1, v9, v7)
            for j = 1, 2 do
                v4 = readu8(a1, v9 + j - 1)
                copy(a1, v9 + j - 1, a1, v9 + 4 - j, 1)
                writeu8(a1, v9 + 4 - j, v4)
            end
            v8 = v8 + 5
        end
        for k2, k3 in pairs(a3) do
            v8 = encode(a1, v8, k2)
            v8 = encode(a1, v8, k3)
        end
        return v8
    end
    writeu8(a1, a2, if _msgpackType ~= u0.UInt64 then 211 else 207)
    v7 = a2 + 1
    local mostSignificantPart = a3.mostSignificantPart
    buffer.writeu32(a1, v7, mostSignificantPart)
    for i5 = 1, 2 do
        v2 = readu8(a1, v7 + i5 - 1)
        copy(a1, v7 + i5 - 1, a1, v7 + 4 - i5, 1)
        writeu8(a1, v7 + 4 - i5, v2)
    end
    v7 = a2 + 5
    local leastSignificantPart = a3.leastSignificantPart
    buffer.writeu32(a1, v7, leastSignificantPart)
    for i6 = 1, 2 do
        v2 = readu8(a1, v7 + i6 - 1)
        copy(a1, v7 + i6 - 1, a1, v7 + 4 - i6, 1)
        writeu8(a1, v7 + 4 - i6, v2)
    end
    return a2 + 9
end

u0.Int64 = {}

function u0.Int64.new(a1, a2) -- Line: 645 -- upvalues: u0 (val) -- types: a1: number, a2: number
    return {_msgpackType = u0.Int64, mostSignificantPart = a1, leastSignificantPart = a2}
end

u0.UInt64 = {}

function u0.UInt64.new(a1, a2) -- Line: 655 -- upvalues: u0 (val) -- types: a1: number, a2: number
    return {_msgpackType = u0.UInt64, mostSignificantPart = a1, leastSignificantPart = a2}
end

u0.Extension = {}

function u0.Extension.new(a1, a2) -- Line: 665 -- upvalues: u0 (val) -- types: a1: number, a2: buffer
    return {_msgpackType = u0.Extension, type = a1, data = a2}
end

function u0.utf8Encode(a1) -- Line: 673
    -- upvalues: create (val), floor (val), byte (val), extract (val), writeu8 (val), lshift (val), bor (val)
    local v1, v2, v3, v4
    local v5 = math.ceil(#a1 * 1.1428571428571428)
    local v6 = create(v5)
    local v7 = 0
    local v8 = a1
    for i = 1, v5 do
        v3 = floor(v7 / 8) + 1
        v4 = v7 % 8
        v1 = byte(v8, v3)
        if v4 == 0 then
            writeu8(v6, i - 1, (extract(v1, 1, 7)))
        elseif v4 ~= 1 then
            v2 = byte(v8, v3 + 1)
            writeu8(v6, i - 1, (bor(lshift(extract(v1, 0, 8 - v4), v4 - 1), (extract(v2 or 0, 9 - v4, v4 - 1)))))
        else
            writeu8(v6, i - 1, (extract(v1, 0, 7)))
        end
        v7 = v7 + 7
    end
    return buffer.tostring(v6)
end

function u0.utf8Decode(a1) -- Line: 706
    -- upvalues: floor (val), create (val), byte (val), extract (val), lshift (val), bor (val), writeu8 (val)
    local v1, v2, v3
    local v4 = floor(#a1 * 7 / 8)
    local v5 = create(v4)
    local v6 = 0
    for i = 1, v4 do
        v1 = v6 % 7
        v2 = byte(a1, (floor(v6 / 7)) + 1)
        v3 = byte(a1, (floor(v6 / 7)) + 2)
        writeu8(v5, i - 1, (bor(lshift(extract(v2, 0, 7 - v1), v1 + 1), (extract(v3, 6 - v1, v1 + 1)))))
        v6 = v6 + 8
    end
    return buffer.tostring(v5)
end

function u0.decode(a1) -- Line: 731 -- upvalues: parse (val) -- types: a1: string
    if a1 == "" then
        error("Could not decode - input string is too short")
    end
    return (parse(buffer.fromstring(a1), 0))
end

function u0.encode(a1) -- Line: 739 -- upvalues: computeLength (val), create (val), encode (val)
    local v1 = create((computeLength(a1, {})))
    encode(v1, 0, a1)
    return buffer.tostring(v1)
end

return u0