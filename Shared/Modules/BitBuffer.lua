-- Script path: ReplicatedStorage.Shared.Modules.BitBuffer
-- Decompile time: 69.14 ms

local v1, v2, v3
local u151 = {}
local u176 = {}
for i = 1, 64 do
    u151[i - 1] = (string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", i, i))
    v2 = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", i, i)
    u176[v2] = i - 1
end
local u142 = {
    ["0"] = "0000",
    ["1"] = "0001",
    ["2"] = "0010",
    ["3"] = "0011",
    ["4"] = "0100",
    ["5"] = "0101",
    ["6"] = "0110",
    ["7"] = "0111",
    ["8"] = "1000",
    ["9"] = "1001",
    a = "1010",
    b = "1011",
    c = "1100",
    d = "1101",
    e = "1110",
    f = "1111",
}
local u184 = {}
u184[0] = (Vector3.new(1, 0, 0))
u184[1] = (Vector3.new(0, 1, 0))
u184[2] = (Vector3.new(0, 0, 1))
u184[3] = (Vector3.new(-1, 0, 0))
u184[4] = (Vector3.new(0, -1, 0))
u184[5] = (Vector3.new(0, 0, -1))
local u167 = {[true] = 1, [false] = 0}
local u56 = {}
for j = 0, 255 do
    v3 = j
    for k = 1, 8 do
        v1 = -(bit32.band(v3, 1))
        v3 = bit32.bxor(bit32.rshift(v3, 1), (bit32.band(3988292384, v1)))
    end
    u56[j] = v3
end
local u105 = {}
for n = 0, 64 do
    u105[n] = 2 ^ n
end
local u119 = {}
for m = 0, 255 do
    u119[m] = (string.format("%02x", m))
end
return function(a1) -- Line: 56
    -- upvalues: u119 (val), u142 (val), u151 (val), u56 (val), u105 (val), u167 (val), u176 (val), u184 (val)
    if a1 ~= nil then
        assert(type(a1) == "string", "argument to BitBuffer constructor must be either nil or a string")
    end
    local u10 = 0
    local u24 = {}
    local u12 = 0
    local u19 = 0
    local u20 = 0
    local u15 = 0
    local u16 = 1
    if a1 then
        u19 = #a1
        u20 = u19 * 8
        u24 = table.create(#a1)
        local v1 = u19
        for i = 1, v1 do
            u24[i] = (string.byte(a1, i, i))
        end
    end

    local function writeBits(...) -- Line: 368
        -- upvalues: u20 (ref), u10 (ref), u19 (ref), u12 (ref), u105 (upval), u24 (ref)
        local v1
        local v2 = select("#", ...)
        if v2 == 0 then
            return
        end
        u20 = u20 + v2
        for i, v in ipairs((table.pack(...))) do
            v1 = true
            if v ~= 1 then
                v1 = v == 0
            end
            assert(v1, "arguments to BitBuffer.writeBits should be either 1 or 0")
            if u10 == 0 then
                u19 = u19 + 1
            end
            v1 = u12
            u12 = v1 + (not (v ~= 1) and u105[7 - u10] or 0)
            u10 = u10 + 1
            if u10 == 8 then
                u10 = 0
                u24[u19] = u12
                u12 = 0
            end
        end
        if u10 ~= 0 then
            u24[u19] = u12
        end
    end

    local function writeByte(a1) -- Line: 398 -- upvalues: u10 (ref), u19 (ref), u24 (ref), u12 (ref), u20 (ref)
        assert(type(a1) == "number", "argument #1 to BitBuffer.writeByte should be a number")
        local v1 = false
        if a1 >= 0 then
            v1 = a1 <= 255
        end
        assert(v1, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
        assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeByte should be an integer")
        if u10 ~= 0 then
            local v2 = bit32.rshift(a1, u10)
            u24[u19] = u12 + v2
            u19 = u19 + 1
            u12 = bit32.band(bit32.lshift(a1, 8 - u10), 255)
            u24[u19] = u12
        else
            u19 = u19 + 1
            u24[u19] = a1
        end
        u20 = u20 + 8
    end

    local function writeUnsigned(a1, a2) -- Line: 421
        -- upvalues: u105 (upval), writeByte (val), u167 (upval), writeBits (val)
        local v1, v2
        assert(type(a1) == "number", "argument #1 to BitBuffer.writeUnsigned should be a number")
        local v3 = false
        if a1 >= 1 then
            v3 = a1 <= 64
        end
        assert(v3, "argument #1 to BitBuffer.writeUnsigned should be in the range [1, 64]")
        assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeUnsigned should be an integer")
        assert(type(a2) == "number", "argument #2 to BitBuffer.writeUnsigned should be a number")
        v3 = false
        if a2 >= 0 then
            v3 = a2 <= u105[a1] - 1
        end
        assert(v3, "argument #2 to BitBuffer.writeUnsigned is out of range")
        assert(a2 % 1 == 0, "argument #2 to BitBuffer.writeUnsigned should be an integer")
        local v4 = math.floor(a1 / 8)
        v3 = a1 % 8
        local v5 = table.create(v3)
        if a1 <= 32 then
            local v6
            v2 = a1
            for k = 1, v4 do
                v2 = v2 - 8
                writeByte((bit32.extract(a2, v2, 8)))
            end
            for n = v3 - 1, 0, -1 do
                v6 = v3 - n
                v5[v6] = u167[bit32.btest(a2, u105[n])]
            end
            writeBits(table.unpack(v5))
            return
        end
        v2 = a2 % 4294967296
        local v7 = math.floor(a2 / 4294967296)
        local v8 = a1 - 32
        local v9 = v4 - 4
        for i = 1, v9 do
            v8 = v8 - 8
            writeByte((bit32.extract(v7, v8, 8)))
        end
        for j = v3 - 1, 0, -1 do
            v1 = v3 - j
            v5[v1] = u167[bit32.btest(v7, u105[j])]
        end
        writeBits(table.unpack(v5))
        writeByte((bit32.extract(v2, 24, 8)))
        writeByte((bit32.extract(v2, 16, 8)))
        writeByte((bit32.extract(v2, 8, 8)))
        writeByte((bit32.extract(v2, 0, 8)))
    end

    local function writeTerminatedString(a1) -- Line: 669
        -- upvalues: writeByte (val), u10 (ref), u19 (ref), u24 (ref), u12 (ref), u20 (ref)
        assert(type(a1) == "string", "argument #1 to BitBuffer.writeTerminatedString should be a string")
        local v1 = #a1
        for i = 1, v1 do
            writeByte(string.byte(a1, i, i))
        end
        assert(true, "argument #1 to BitBuffer.writeByte should be a number")
        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
        assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
        if u10 ~= 0 then
            v1 = bit32.rshift(0, u10)
            u24[u19] = u12 + v1
            u19 = u19 + 1
            u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
            u24[u19] = u12
        else
            u19 = u19 + 1
            u24[u19] = 0
        end
        u20 = u20 + 8
    end

    local function writeUInt32(a1) -- Line: 742 -- upvalues: writeByte (val)
        assert(type(a1) == "number", "argument #1 to BitBuffer.writeUInt32 should be a number")
        local v1 = false
        if a1 >= 0 then
            v1 = a1 <= 4294967295
        end
        assert(v1, "argument #1 to BitBuffer.writeUInt32 should be in the range [0, 4294967295]")
        assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeUInt32 should be an integer")
        writeByte((bit32.rshift(a1, 24)))
        writeByte((bit32.band(bit32.rshift(a1, 16), 255)))
        writeByte((bit32.band(bit32.rshift(a1, 8), 255)))
        writeByte((bit32.band(a1, 255)))
    end

    local function writeInt32(a1) -- Line: 787 -- upvalues: writeByte (val)
        assert(type(a1) == "number", "argument #1 to BitBuffer.writeInt32 should be a number")
        local v1 = false
        if a1 >= -2147483648 then
            v1 = a1 <= 2147483647
        end
        assert(v1, "argument #1 to BitBuffer.writeInt32 should be in the range [-2147483648, 2147483647]")
        assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeInt32 should be an integer")
        local v2 = if not (a1 < 0) then a1 else 2147483648 + a1 + 2147483648
        writeByte((bit32.rshift(v2, 24)))
        writeByte((bit32.band(bit32.rshift(v2, 16), 255)))
        writeByte((bit32.band(bit32.rshift(v2, 8), 255)))
        writeByte((bit32.band(v2, 255)))
    end

    local function writeFloat32(a1) -- Line: 852
        -- upvalues: u10 (ref), u19 (ref), u24 (ref), u12 (ref), u20 (ref), writeByte (val)
        local v1
        assert(type(a1) == "number", "argument #1 to BitBuffer.writeFloat32 should be a number")
        local v2 = a1 < 0
        local v3 = math.abs(a1)
        local v4, v5 = math.frexp(v3)
        if v3 == (1 / 0) then
            if not v2 then
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(127, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(127, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 127
                end
            else
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(255, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 255
                end
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(128, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(128, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 128
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(0, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 0
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(0, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 0
            end
            u20 = u20 + 8
            return
        end
        if v3 ~= v3 then
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(127, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(127, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 127
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            return
        end
        if v3 ~= 0 then
            if v5 + 127 <= 1 then
                v4 = math.floor(v4 * 8388608 + 0.5)
                if not v2 then
                    assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                    assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                    assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                    if u10 ~= 0 then
                        v1 = bit32.rshift(0, u10)
                        u24[u19] = u12 + v1
                        u19 = u19 + 1
                        u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                        u24[u19] = u12
                    else
                        u19 = u19 + 1
                        u24[u19] = 0
                    end
                else
                    assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                    assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                    assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                    if u10 ~= 0 then
                        v1 = bit32.rshift(128, u10)
                        u24[u19] = u12 + v1
                        u19 = u19 + 1
                        u12 = bit32.band(bit32.lshift(128, 8 - u10), 255)
                        u24[u19] = u12
                    else
                        u19 = u19 + 1
                        u24[u19] = 128
                    end
                end
                u20 = u20 + 8
                writeByte((bit32.rshift(v4, 16)))
                writeByte((bit32.band(bit32.rshift(v4, 8), 255)))
                writeByte((bit32.band(v4, 255)))
                return
            end
            v4 = math.floor((v4 - 0.5) * 16777216 + 0.5)
            if not v2 then
                writeByte((bit32.rshift(v5 + 126, 1)))
            else
                writeByte(bit32.rshift(v5 + 126, 1) + 128)
            end
            writeByte((bit32.band(bit32.lshift(v5 + 126, 7), 255)) + bit32.rshift(v4, 16))
            writeByte((bit32.band(bit32.rshift(v4, 8), 255)))
            writeByte((bit32.band(v4, 255)))
            return
        end
        assert(true, "argument #1 to BitBuffer.writeByte should be a number")
        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
        assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
        if u10 ~= 0 then
            v1 = bit32.rshift(0, u10)
            u24[u19] = u12 + v1
            u19 = u19 + 1
            u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
            u24[u19] = u12
        else
            u19 = u19 + 1
            u24[u19] = 0
        end
        u20 = u20 + 8
        assert(true, "argument #1 to BitBuffer.writeByte should be a number")
        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
        assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
        if u10 ~= 0 then
            v1 = bit32.rshift(0, u10)
            u24[u19] = u12 + v1
            u19 = u19 + 1
            u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
            u24[u19] = u12
        else
            u19 = u19 + 1
            u24[u19] = 0
        end
        u20 = u20 + 8
        assert(true, "argument #1 to BitBuffer.writeByte should be a number")
        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
        assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
        if u10 ~= 0 then
            v1 = bit32.rshift(0, u10)
            u24[u19] = u12 + v1
            u19 = u19 + 1
            u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
            u24[u19] = u12
        else
            u19 = u19 + 1
            u24[u19] = 0
        end
        u20 = u20 + 8
        assert(true, "argument #1 to BitBuffer.writeByte should be a number")
        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
        assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
        if u10 ~= 0 then
            v1 = bit32.rshift(0, u10)
            u24[u19] = u12 + v1
            u19 = u19 + 1
            u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
            u24[u19] = u12
        else
            u19 = u19 + 1
            u24[u19] = 0
        end
        u20 = u20 + 8
    end

    local function readBits(a1) -- Line: 1202
        -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref), u105 (upval), u167 (upval)
        local v1, v2
        assert(type(a1) == "number", "argument #1 to BitBuffer.readBits should be a number")
        assert(a1 > 0, "argument #1 to BitBuffer.readBits should be greater than zero")
        assert(a1 % 1 == 0, "argument #1 to BitBuffer.readBits should be an integer")
        assert(u15 + a1 <= u20, "BitBuffer.readBits cannot read past the end of the stream")
        local v3 = table.create(a1)
        local v4 = u24[u16]
        local v5 = u15 % 8
        for i = 1, a1 do
            v2 = u105[7 - v5]
            v3[i] = u167[bit32.btest(v4, v2)]
            v5 = v5 + 1
            if v5 == 8 then
                u16 = u16 + 1
                v4 = u24[u16]
            end
        end
        u15 = u15 + v1
        return v3
    end

    local function readUnsigned(a1) -- Line: 1248
        -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref), readBits (val)
        local v1, v2, v3
        assert(type(a1) == "number", "argument #1 to BitBuffer.readUnsigned should be a number")
        local v4 = false
        if a1 >= 1 then
            v4 = a1 <= 64
        end
        assert(v4, "argument #1 to BitBuffer.readUnsigned should be in the range [1, 64]")
        assert(a1 % 1 == 0, "argument #1 to BitBuffer.readUnsigned should be an integer")
        assert(u15 + a1 <= u20, "BitBuffer.readUnsigned cannot read past the end of the stream")
        local v5 = math.floor(a1 / 8)
        v4 = a1 % 8
        local v6 = 0
        for i = 1, v5 do
            v6 = v6 * 256
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v2 = u15 % 8
            v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            v6 = v6 + v1
        end
        if v4 ~= 0 then
            local v7
            for i2, v in ipairs((readBits(v7 % 8))) do
                v6 = v6 * 2 + v
            end
        end
        return v6
    end

    local function readTerminatedString() -- Line: 1403 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
        local v1, v2, v3, v4
        local v5 = {}
        local v6 = 0
        while true do
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v3 = u15 % 8
            v4 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v2 = (bit32.band(bit32.lshift(v4, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v2 = v4
            end
            if not v2 then
                error("BitBuffer.readTerminatedString cannot read past the end of the stream", 2)
                continue
            end
            if v2 == 0 then
                break
            end
            v6 = v6 + 1
            v5[v6] = v2
        end
        v2 = table.create((math.ceil(v6 / 4096)))
        v3 = 1
        for i = 1, v6, 4096 do
            v1 = math.min(v6, i + 4095)
            v2[v3] = (string.char((table.unpack(v5, i, v1))))
            v3 = v3 + 1
        end
        return table.concat(v2)
    end

    local function readInt32() -- Line: 1548 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
        local v1
        assert(u15 + 32 <= u20, "BitBuffer.readInt32 cannot read past the end of the stream")
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        local v2 = u15 % 8
        local v3 = u24[u16]
        u15 = u15 + 8
        if v2 ~= 0 then
            u16 = u16 + 1
            v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
        else
            u16 = u16 + 1
            v1 = v3
        end
        local v4 = bit32.lshift(v1, 24)
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        v3 = u15 % 8
        local v5 = u24[u16]
        u15 = u15 + 8
        if v3 ~= 0 then
            u16 = u16 + 1
            v2 = (bit32.band(bit32.lshift(v5, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
        else
            u16 = u16 + 1
            v2 = v5
        end
        local v6 = v4 + bit32.lshift(v2, 16)
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        v2 = u15 % 8
        v3 = u24[u16]
        u15 = u15 + 8
        if v2 ~= 0 then
            u16 = u16 + 1
            v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
        else
            u16 = u16 + 1
            v1 = v3
        end
        local v7 = v6 + bit32.lshift(v1, 8)
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        v4 = u15 % 8
        v1 = u24[u16]
        u15 = u15 + 8
        if v4 ~= 0 then
            u16 = u16 + 1
            v6 = (bit32.band(bit32.lshift(v1, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
        else
            u16 = u16 + 1
            v6 = v1
        end
        local v8 = v7 + v6
        v7 = bit32.btest(v8, 2147483648)
        v8 = bit32.band(v8, 2147483647)
        if v7 then
            return v8 - 2147483648
        end
        return v8
    end

    local function readFloat32() -- Line: 1599 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
        local v1, v2, v3
        assert(u15 + 32 <= u20, "BitBuffer.readFloat32 cannot read past the end of the stream")
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        local v4 = u15 % 8
        local v5 = u24[u16]
        u15 = u15 + 8
        if v4 ~= 0 then
            u16 = u16 + 1
            v1 = (bit32.band(bit32.lshift(v5, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
        else
            u16 = u16 + 1
            v1 = v5
        end
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        v5 = u15 % 8
        local v6 = u24[u16]
        u15 = u15 + 8
        if v5 ~= 0 then
            u16 = u16 + 1
            v4 = (bit32.band(bit32.lshift(v6, v5), 255)) + bit32.rshift(u24[u16], 8 - v5)
        else
            u16 = u16 + 1
            v4 = v6
        end
        v5 = bit32.btest(v1, 128)
        v6 = (bit32.band(bit32.lshift(v1, 1), 255)) + bit32.rshift(v4, 7)
        local v7 = bit32.lshift(bit32.band(v4, 127), 16)
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        local v8 = u15 % 8
        local v9 = u24[u16]
        u15 = u15 + 8
        if v8 ~= 0 then
            u16 = u16 + 1
            v3 = (bit32.band(bit32.lshift(v9, v8), 255)) + bit32.rshift(u24[u16], 8 - v8)
        else
            u16 = u16 + 1
            v3 = v9
        end
        local v10 = v7 + bit32.lshift(v3, 8)
        assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
        v3 = u15 % 8
        v8 = u24[u16]
        u15 = u15 + 8
        if v3 ~= 0 then
            u16 = u16 + 1
            v2 = (bit32.band(bit32.lshift(v8, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
        else
            u16 = u16 + 1
            v2 = v8
        end
        local v11 = v10 + bit32.lshift(v2, 0)
        if v6 == 255 then
            if v11 ~= 0 then
                return (0 / 0)
            end
            if v5 then
                return (-1 / 0)
            end
            return (1 / 0)
        end
        if v6 ~= 0 then
            v11 = v11 / 8388608 + 1
            return v5 and -math.ldexp(v11, v6 - 127) or math.ldexp(v11, v6 - 127)
        end
        if v11 == 0 then
            return 0
        end
        return v5 and -math.ldexp(v11 / 8388608, -126) or math.ldexp(v11 / 8388608, -126)
    end

    return {
        dumpBinary = function() -- Line: 90 -- upvalues: u19 (ref), u24 (ref), u119 (upval), u142 (upval), u10 (ref)
            local gsub, v1
            local v2 = table.create(u19)
            for i, v in ipairs(u24) do
                gsub = string.gsub
                v1 = u119[v]
                v2[i] = (gsub(v1, "%x", u142))
            end
            if u10 ~= 0 then
                local v3 = u19
                v2[v3] = (string.sub(v2[u19], 1, u10))
            end
            return table.concat(v2, " ")
        end,
        dumpString = function() -- Line: 106 -- upvalues: u19 (ref), u24 (ref)
            local v1, v2
            local v3 = table.create((math.ceil(u19 / 4096)))
            local v4 = 1
            local v5 = u19
            for i = 1, v5, 4096 do
                v1 = u24
                v2 = math.min(u19, i + 4095)
                v3[v4] = (string.char((table.unpack(v1, i, v2))))
                v4 = v4 + 1
            end
            return table.concat(v3, "")
        end,
        dumpHex = function() -- Line: 122 -- upvalues: u19 (ref), u24 (ref), u119 (upval)
            local v1 = table.create(u19)
            for i, v in ipairs(u24) do
                v1[i] = u119[v]
            end
            return table.concat(v1, "")
        end,
        dumpBase64 = function() -- Line: 132 -- upvalues: u19 (ref), u24 (ref), u151 (upval)
            local v1, v2, v3, v4, v5, v6, v7
            local v8 = table.create((math.ceil(u19 * 1.333)))
            local v9 = 1
            local v10 = u19
            for i = 1, v10, 3 do
                v3 = u24[i]
                v4 = u24[i + 1]
                v5 = u24[i + 2]
                v6 = bit32.bor(bit32.lshift(v3, 16), bit32.lshift(v4 or 0, 8), v5 or 0)
                v8[v9] = u151[bit32.rshift(bit32.band(v6, 16515072), 18)]
                v7 = v9 + 1
                v8[v7] = u151[bit32.rshift(bit32.band(v6, 258048), 12)]
                v7 = v9 + 2
                v1 = v4 and u151[bit32.rshift(bit32.band(v6, 4032), 6)] or 61
                v8[v7] = v1
                v7 = v9 + 3
                v8[v7] = v5 and u151[bit32.band(v6, 63)] or 61
                v9 = v9 + 4
            end
            v9 = v9 - 1
            v10 = table.create((math.ceil(v9 / 4096)))
            local v11 = 1
            local v12 = u19
            for j = 1, v12, 4096 do
                v2 = math.min(v9, j + 4095)
                v10[v11] = (string.char((table.unpack(v8, j, v2))))
                v11 = v11 + 1
            end
            return table.concat(v10, "")
        end,
        exportChunk = function(a1) -- Line: 167 -- upvalues: u19 (ref), u24 (ref)
            assert(type(a1) == "number", "argument #1 to BitBuffer.exportChunk should be a number")
            assert(a1 > 0, "argument #1 to BitBuffer.exportChunk should be above zero")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.exportChunk should be an integer")
            return coroutine.wrap(function() -- Line: 178 -- upvalues: a1 (val), u19 (upval), u24 (upval)
                local v1, v2, v3
                local v4 = a1 - 1
                for i = 1, u19, a1 do
                    v2 = u24
                    v3 = math.min(u19, i + v4)
                    v1 = string.char((table.unpack(v2, i, v3)))
                    coroutine.yield(i, v1)
                end
            end)
        end,
        exportBase64Chunk = function(a1) -- Line: 189 -- upvalues: u19 (ref), u24 (ref), u151 (upval)
            local v1, v2, v3, v4, v5, v6
            local u143 = a1 or 76
            assert(type(u143) == "number", "argument #1 to BitBuffer.exportBase64Chunk should be a number")
            assert(u143 > 0, "argument #1 to BitBuffer.exportBase64Chunk should be above zero")
            assert(u143 % 1 == 0, "argument #1 to BitBuffer.exportBase64Chunk should be an integer")
            local u112 = table.create((math.ceil(u19 * 0.333)))
            local v7 = 1
            local v8 = u19
            for i = 1, v8, 3 do
                v3 = u24[i]
                v4 = u24[i + 1]
                v5 = u24[i + 2]
                v6 = bit32.bor(bit32.lshift(v3, 16), bit32.lshift(v4 or 0, 8), v5 or 0)
                u112[v7] = u151[bit32.rshift(bit32.band(v6, 16515072), 18)]
                v1 = v7 + 1
                u112[v1] = u151[bit32.rshift(bit32.band(v6, 258048), 12)]
                v1 = v7 + 2
                v2 = v4 and u151[bit32.rshift(bit32.band(v6, 4032), 6)] or 61
                u112[v1] = v2
                v1 = v7 + 3
                u112[v1] = v5 and u151[bit32.band(v6, 63)] or 61
                v7 = v7 + 4
            end
            local u135 = v7 - 1
            return (coroutine.wrap(function() -- Line: 218 -- upvalues: u143 (ref), u135 (ref), u112 (val)
                local v1, v2
                local v3 = u143 - 1
                local v4 = u143
                for i = 1, u135, v4 do
                    v1 = u112
                    v2 = math.min(u135, i + v3)
                    coroutine.yield((string.char((table.unpack(v1, i, v2)))))
                end
            end))
        end,
        exportHexChunk = function(a1) -- Line: 227 -- upvalues: u19 (ref), u119 (upval), u24 (ref)
            assert(type(a1) == "number", "argument #1 to BitBuffer.exportHexChunk should be a number")
            assert(a1 > 0, "argument #1 to BitBuffer.exportHexChunk should be above zero")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.exportHexChunk should be an integer")
            local u29 = math.floor(a1 / 2)
            if a1 % 2 == 0 then
                return coroutine.wrap(function() -- Line: 238 -- upvalues: u19 (upval), u29 (val), u119 (upval), u24 (upval)
                    local v1
                    local v2 = {}
                    for i = 1, u19, u29 do
                        v1 = u29 - 1
                        for j = 0, v1 do
                            v2[j] = u119[u24[i + j]]
                        end
                        coroutine.yield(table.concat(v2, "", 0))
                    end
                end)
            end
            return coroutine.wrap(function() -- Line: 248 -- upvalues: u19 (upval), u29 (val), u119 (upval), u24 (upval)
                local v1, v2
                local v3 = {[0] = ""}
                local v4 = ""
                local v5 = 1
                while v5 <= u19 do
                    if v4 ~= "" then
                        v3[0] = v4
                        v1 = u29 - 1
                        for i = 0, v1 do
                            v3[i + 1] = u119[u24[v5 + i]]
                        end
                        v3[u29 + 1] = ""
                    else
                        v3[0] = ""
                        v1 = u29 - 1
                        for j = 0, v1 do
                            v3[j + 1] = u119[u24[v5 + j]]
                        end
                        v1 = u119[u24[v5 + u29]]
                        if v1 then
                            v2 = u29 + 1
                            v3[v2] = (string.sub(v1, 1, 1))
                            v4 = string.sub(v1, 2, 2)
                        end
                        v5 = v5 + 1
                    end
                    coroutine.yield(table.concat(v3, "", 0))
                    v5 = v5 + u29
                end
            end)
        end,
        crc32 = function() -- Line: 281 -- upvalues: u24 (ref), u56 (upval)
            local v1
            local v2 = 4294967295
            for i, v in ipairs(u24) do
                v1 = u56[bit32.band(bit32.bxor(v2, v), 255)]
                v2 = bit32.bxor(bit32.rshift(v2, 8), v1)
            end
            return bit32.bnot(v2) % 4294967295
        end,
        getLength = function() -- Line: 292 -- upvalues: u20 (ref)
            return u20
        end,
        getByteLength = function() -- Line: 296 -- upvalues: u19 (ref)
            return u19
        end,
        getPointer = function() -- Line: 300 -- upvalues: u15 (ref)
            return u15
        end,
        setPointer = function(a1) -- Line: 305 -- upvalues: u20 (ref), u15 (ref), u16 (ref)
            assert(type(a1) == "number", "argument #1 to BitBuffer.setPointer should be a number")
            assert(a1 >= 0, "argument #1 to BitBuffer.setPointer should be zero or higher")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.setPointer should be an integer")
            assert(a1 <= u20, "argument #1 to BitBuffer.setPointerByte should within range of the buffer")
            u15 = a1
            u16 = math.floor(a1 / 8) + 1
        end,
        setPointerFromEnd = function(a1) -- Line: 318 -- upvalues: u20 (ref), u15 (ref), u16 (ref)
            assert(type(a1) == "number", "argument #1 to BitBuffer.setPointerFromEnd should be a number")
            assert(a1 >= 0, "argument #1 to BitBuffer.setPointerFromEnd should be zero or higher")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.setPointerFromEnd should be an integer")
            assert(a1 <= u20, "argument #1 to BitBuffer.setPointerFromEnd should within range of the buffer")
            u15 = u20 - a1
            u16 = math.floor(u15 / 8 + 1)
        end,
        getPointerByte = function() -- Line: 331 -- upvalues: u16 (ref)
            return u16
        end,
        setPointerByte = function(a1) -- Line: 335 -- upvalues: u19 (ref), u15 (ref), u16 (ref)
            assert(type(a1) == "number", "argument #1 to BitBuffer.setPointerByte should be a number")
            assert(a1 > 0, "argument #1 to BitBuffer.setPointerByte should be positive")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.setPointerByte should be an integer")
            assert(a1 <= u19, "argument #1 to BitBuffer.setPointerByte should be within range of the buffer")
            u15 = a1 * 8
            u16 = a1
        end,
        setPointerByteFromEnd = function(a1) -- Line: 348 -- upvalues: u19 (ref), u16 (ref), u15 (ref)
            assert(type(a1) == "number", "argument #1 to BitBuffer.setPointerByteFromEnd should be a number")
            assert(a1 >= 0, "argument #1 to BitBuffer.setPointerByteFromEnd should be zero or higher")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.setPointerByteFromEnd should be an integer")
            assert(a1 <= u19, "argument #1 to BitBuffer.setPointerByteFromEnd should be within range of the buffer")
            u16 = u19 - a1
            u15 = u16 * 8
        end,
        isFinished = function() -- Line: 364 -- upvalues: u15 (ref), u20 (ref)
            return u15 == u20
        end,
        writeBits = writeBits,
        writeByte = writeByte,
        writeUnsigned = writeUnsigned,
        writeSigned = function(a1, a2) -- Line: 481 -- upvalues: u105 (upval), writeBits (val), writeUnsigned (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeSigned should be a number")
            local v1 = false
            if a1 >= 2 then
                v1 = a1 <= 64
            end
            assert(v1, "argument #1 to BitBuffer.writeSigned should be in the range [2, 64]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeSigned should be an integer")
            assert(type(a2) == "number", "argument #2 to BitBuffer.writeSigned should be a number")
            v1 = false
            if -u105[a1 - 1] <= a2 then
                v1 = a2 <= u105[a1 - 1] - 1
            end
            assert(v1, "argument #2 to BitBuffer.writeSigned is out of range")
            assert(a2 % 1 == 0, "argument #2 to BitBuffer.writeSigned should be an integer")
            if a2 >= 0 then
                writeBits(0)
                writeUnsigned(a1 - 1, a2)
                return
            end
            writeBits(1)
            writeUnsigned(a1 - 1, u105[a1 - 1] + a2)
        end,
        writeFloat = function(a1, a2, a3) -- Line: 509 -- upvalues: u105 (upval), writeBits (val), u167 (upval), writeUnsigned (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeFloat should be a number")
            local v1 = false
            if a1 >= 1 then
                v1 = a1 <= 64
            end
            assert(v1, "argument #1 to BitBuffer.writeFloat should be in the range [1, 64]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeFloat should be an integer")
            assert(type(a2) == "number", "argument #2 to BitBuffer.writeFloat should be a number")
            v1 = false
            if a2 >= 1 then
                v1 = a2 <= 64
            end
            assert(v1, "argument #2 to BitBuffer.writeFloat should be in the range [1, 64]")
            assert(a2 % 1 == 0, "argument #2 to BitBuffer.writeFloat should be an integer")
            assert(type(a3) == "number", "argument #3 to BitBuffer.writeFloat should be a number")
            local v2 = u105[a1 - 1] - 1
            v1 = a3 < 0
            local v3 = math.abs(a3)
            local v4, v5 = math.frexp(v3)
            if v3 == (1 / 0) then
                writeBits(u167[v1])
                writeUnsigned(a1, u105[a1] - 1)
                writeUnsigned(a2, 0)
                return
            end
            if v3 ~= v3 then
                writeBits(u167[v1])
                writeUnsigned(a1, u105[a1] - 1)
                writeUnsigned(a2, 10)
                return
            end
            if v3 == 0 then
                writeUnsigned(a1 + a2 + 1, 0)
                return
            end
            if v5 + v2 <= 1 then
                v4 = math.floor(v4 * u105[a2] + 0.5)
                writeBits(u167[v1])
                writeUnsigned(a1, 0)
                writeUnsigned(a2, v4)
                return
            end
            v4 = math.floor((v4 - 0.5) * 2 * u105[a2] + 0.5)
            writeBits(u167[v1])
            writeUnsigned(a1, v5 + v2 - 1)
            writeUnsigned(a2, v4)
        end,
        writeBase64 = function(a1) -- Line: 619 -- upvalues: u176 (upval), writeByte (val)
            local v1, v2, v3, v4, v5
            assert(type(a1) == "string", "argument #1 to BitBuffer.writeBase64 should be a string")
            assert(not string.find(a1, "[^%w%+/=]"), "argument #1 to BitBuffer.writeBase64 should only contain valid base64 characters")
            local v6 = #a1
            for i = 1, v6, 4 do
                v4 = i + 3
                v1, v2, v3, v4 = string.byte(a1, i, v4)
                v1 = u176[v1]
                v2 = u176[v2]
                v3 = u176[v3]
                v4 = u176[v4]
                v5 = bit32.bor(bit32.lshift(v1, 18), bit32.lshift(v2, 12), bit32.lshift(v3 or 0, 6), v4 or 0)
                writeByte((bit32.rshift(v5, 16)))
                if not v3 then
                    break
                end
                writeByte((bit32.band(bit32.rshift(v5, 8), 255)))
                if not v4 then
                    break
                end
                writeByte((bit32.band(v5, 255)))
            end
        end,
        writeString = function(a1) -- Line: 653 -- upvalues: u105 (upval), writeByte (val), writeBits (val)
            assert(type(a1) == "string", "argument #1 to BitBuffer.writeString  should be a string")
            local v1 = #a1
            assert(true, "argument #1 to BitBuffer.writeUnsigned should be a number")
            assert(true, "argument #1 to BitBuffer.writeUnsigned should be in the range [1, 64]")
            assert(true, "argument #1 to BitBuffer.writeUnsigned should be an integer")
            assert(type(v1) == "number", "argument #2 to BitBuffer.writeUnsigned should be a number")
            local v2 = false
            if v1 >= 0 then
                v2 = v1 <= u105[24] - 1
            end
            assert(v2, "argument #2 to BitBuffer.writeUnsigned is out of range")
            assert(v1 % 1 == 0, "argument #2 to BitBuffer.writeUnsigned should be an integer")
            local v3 = table.create(0)
            v2 = 16
            writeByte((bit32.extract(v1, v2, 8)))
            v2 = v2 - 8
            writeByte((bit32.extract(v1, v2, 8)))
            v2 = v2 - 8
            writeByte((bit32.extract(v1, v2, 8)))
            writeBits(table.unpack(v3))
            v1 = #a1
            for i = 1, v1 do
                writeByte(string.byte(a1, i, i))
            end
        end,
        writeTerminatedString = writeTerminatedString,
        writeSetLengthString = function(a1) -- Line: 684 -- upvalues: writeByte (val)
            assert(type(a1) == "string", "argument #1 to BitBuffer.writeSetLengthString should be a string")
            local v1 = #a1
            for i = 1, v1 do
                writeByte(string.byte(a1, i, i))
            end
        end,
        writeField = function(...) -- Line: 698 -- upvalues: writeUnsigned (val)
            local v1 = 0
            local v2 = table.pack(...)
            local n = v2.n
            for i = 1, n do
                v1 = v1 * 2
                if v2[i] then
                    v1 = v1 + 1
                end
            end
            writeUnsigned(v2.n, v1)
        end,
        writeUInt8 = function(a1) -- Line: 719 -- upvalues: writeByte (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeUInt8 should be a number")
            local v1 = false
            if a1 >= 0 then
                v1 = a1 <= 255
            end
            assert(v1, "argument #1 to BitBuffer.writeUInt8 should be in the range [0, 255]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeUInt8 should be an integer")
            writeByte(a1)
        end,
        writeUInt16 = function(a1) -- Line: 730 -- upvalues: writeByte (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeUInt16 should be a number")
            local v1 = false
            if a1 >= 0 then
                v1 = a1 <= 65535
            end
            assert(v1, "argument #1 to BitBuffer.writeInt16 should be in the range [0, 65535]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeUInt16 should be an integer")
            writeByte((bit32.rshift(a1, 8)))
            writeByte((bit32.band(a1, 255)))
        end,
        writeUInt32 = writeUInt32,
        writeInt8 = function(a1) -- Line: 756 -- upvalues: writeByte (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeInt8 should be a number")
            local v1 = false
            if a1 >= -128 then
                v1 = a1 <= 127
            end
            assert(v1, "argument #1 to BitBuffer.writeInt8 should be in the range [-128, 127]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeInt8 should be an integer")
            writeByte(if not (a1 < 0) then a1 else 128 + a1 + 128)
        end,
        writeInt16 = function(a1) -- Line: 771 -- upvalues: writeByte (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeInt16 should be a number")
            local v1 = false
            if a1 >= -32768 then
                v1 = a1 <= 32767
            end
            assert(v1, "argument #1 to BitBuffer.writeInt16 should be in the range [-32768, 32767]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.writeInt16 should be an integer")
            local v2 = if not (a1 < 0) then a1 else 32768 + a1 + 32768
            writeByte((bit32.rshift(v2, 8)))
            writeByte((bit32.band(v2, 255)))
        end,
        writeInt32 = writeInt32,
        writeFloat16 = function(a1) -- Line: 805 -- upvalues: u10 (ref), u19 (ref), u24 (ref), u12 (ref), u20 (ref), writeByte (val)
            local v1
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeFloat16 should be a number")
            local v2 = a1 < 0
            local v3 = math.abs(a1)
            local v4, v5 = math.frexp(v3)
            if v3 == (1 / 0) then
                if not v2 then
                    assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                    assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                    assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                    if u10 ~= 0 then
                        v1 = bit32.rshift(124, u10)
                        u24[u19] = u12 + v1
                        u19 = u19 + 1
                        u12 = bit32.band(bit32.lshift(124, 8 - u10), 255)
                        u24[u19] = u12
                    else
                        u19 = u19 + 1
                        u24[u19] = 124
                    end
                else
                    assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                    assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                    assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                    if u10 ~= 0 then
                        v1 = bit32.rshift(252, u10)
                        u24[u19] = u12 + v1
                        u19 = u19 + 1
                        u12 = bit32.band(bit32.lshift(252, 8 - u10), 255)
                        u24[u19] = u12
                    else
                        u19 = u19 + 1
                        u24[u19] = 252
                    end
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(0, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 0
                end
                u20 = u20 + 8
                return
            end
            if v3 ~= v3 then
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(127, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(127, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 127
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(255, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 255
                end
                u20 = u20 + 8
                return
            end
            if v3 ~= 0 then
                if v5 + 15 <= 1 then
                    v4 = math.floor(v4 * 1024 + 0.5)
                    if not v2 then
                        writeByte((bit32.rshift(v4, 8)))
                    else
                        writeByte(bit32.rshift(v4, 8) + 128)
                    end
                    writeByte((bit32.band(v4, 255)))
                    return
                end
                v4 = math.floor((v4 - 0.5) * 2048 + 0.5)
                if not v2 then
                    writeByte((bit32.lshift(v5 + 14, 2)) + bit32.rshift(v4, 8))
                else
                    writeByte(bit32.lshift(v5 + 14, 2) + 128 + bit32.rshift(v4, 8))
                end
                writeByte((bit32.band(v4, 255)))
                return
            end
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(0, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 0
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(0, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 0
            end
            u20 = u20 + 8
        end,
        writeFloat32 = writeFloat32,
        writeFloat64 = function(a1) -- Line: 909 -- upvalues: u10 (ref), u19 (ref), u24 (ref), u12 (ref), u20 (ref), writeByte (val)
            local v1
            assert(type(a1) == "number", "argument #1 to BitBuffer.writeFloat64 should be a number")
            local v2 = a1 < 0
            local v3 = math.abs(a1)
            local v4, v5 = math.frexp(v3)
            if v3 == (1 / 0) then
                if not v2 then
                    assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                    assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                    assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                    if u10 ~= 0 then
                        v1 = bit32.rshift(127, u10)
                        u24[u19] = u12 + v1
                        u19 = u19 + 1
                        u12 = bit32.band(bit32.lshift(127, 8 - u10), 255)
                        u24[u19] = u12
                    else
                        u19 = u19 + 1
                        u24[u19] = 127
                    end
                else
                    assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                    assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                    assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                    if u10 ~= 0 then
                        v1 = bit32.rshift(255, u10)
                        u24[u19] = u12 + v1
                        u19 = u19 + 1
                        u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                        u24[u19] = u12
                    else
                        u19 = u19 + 1
                        u24[u19] = 255
                    end
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(240, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(240, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 240
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(0, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 0
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(0, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 0
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(0, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 0
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(0, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 0
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(0, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 0
                end
                u20 = u20 + 8
                assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                if u10 ~= 0 then
                    v1 = bit32.rshift(0, u10)
                    u24[u19] = u12 + v1
                    u19 = u19 + 1
                    u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                    u24[u19] = u12
                else
                    u19 = u19 + 1
                    u24[u19] = 0
                end
                u20 = u20 + 8
                return
            end
            if v3 == v3 then
                local v6
                if v3 == 0 then
                    assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                    assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                    assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                    if u10 ~= 0 then
                        v1 = bit32.rshift(0, u10)
                        u24[u19] = u12 + v1
                        u19 = u19 + 1
                        u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                        u24[u19] = u12
                    else
                        u19 = u19 + 1
                        u24[u19] = 0
                    end
                    u20 = u20 + 8
                    return
                end
                if v5 + 1023 <= 1 then
                    v4 = math.floor(v4 * 4503599627370496 + 0.5)
                    if not v2 then
                        assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                        assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                        if u10 ~= 0 then
                            v1 = bit32.rshift(0, u10)
                            u24[u19] = u12 + v1
                            u19 = u19 + 1
                            u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                            u24[u19] = u12
                        else
                            u19 = u19 + 1
                            u24[u19] = 0
                        end
                    else
                        assert(true, "argument #1 to BitBuffer.writeByte should be a number")
                        assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
                        assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
                        if u10 ~= 0 then
                            v1 = bit32.rshift(128, u10)
                            u24[u19] = u12 + v1
                            u19 = u19 + 1
                            u12 = bit32.band(bit32.lshift(128, 8 - u10), 255)
                            u24[u19] = u12
                        else
                            u19 = u19 + 1
                            u24[u19] = 128
                        end
                    end
                    u20 = u20 + 8
                    v1 = v4 % 4294967296
                    v6 = math.floor(v4 / 4294967296)
                    writeByte((bit32.rshift(v6, 16)))
                    writeByte((bit32.band(bit32.rshift(v6, 8), 255)))
                    writeByte((bit32.band(v6, 255)))
                    writeByte((bit32.rshift(v1, 24)))
                    writeByte((bit32.band(bit32.rshift(v1, 16), 255)))
                    writeByte((bit32.band(bit32.rshift(v1, 8), 255)))
                    writeByte((bit32.band(v1, 255)))
                    return
                end
                v4 = math.floor((v4 - 0.5) * 9007199254740992 + 0.5)
                if not v2 then
                    writeByte((bit32.rshift(v5 + 1022, 4)))
                else
                    writeByte(bit32.rshift(v5 + 1022, 4) + 128)
                end
                v1 = v4 % 4294967296
                v6 = math.floor(v4 / 4294967296)
                writeByte((bit32.band(bit32.lshift(v5 + 1022, 4), 255)) + bit32.rshift(v6, 16))
                writeByte((bit32.band(bit32.rshift(v6, 8), 255)))
                writeByte((bit32.band(v6, 255)))
                writeByte((bit32.rshift(v1, 24)))
                writeByte((bit32.band(bit32.rshift(v1, 16), 255)))
                writeByte((bit32.band(bit32.rshift(v1, 8), 255)))
                writeByte((bit32.band(v1, 255)))
                return
            end
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(127, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(127, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 127
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                v1 = bit32.rshift(255, u10)
                u24[u19] = u12 + v1
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(255, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 255
            end
            u20 = u20 + 8
        end,
        writeBrickColor = function(a1) -- Line: 997 -- upvalues: writeByte (val)
            assert(typeof(a1) == "BrickColor", "argument #1 to BitBuffer.writeBrickColor should be a BrickColor")
            local Number = a1.Number
            assert(type(Number) == "number", "argument #1 to BitBuffer.writeUInt16 should be a number")
            local v1 = false
            if Number >= 0 then
                v1 = Number <= 65535
            end
            assert(v1, "argument #1 to BitBuffer.writeInt16 should be in the range [0, 65535]")
            assert(Number % 1 == 0, "argument #1 to BitBuffer.writeUInt16 should be an integer")
            writeByte((bit32.rshift(Number, 8)))
            writeByte((bit32.band(Number, 255)))
        end,
        writeColor3 = function(a1) -- Line: 1006 -- upvalues: writeByte (val)
            assert(typeof(a1) == "Color3", "argument #1 to BitBuffer.writeColor3 should be a Color3")
            writeByte((math.floor(a1.R * 255 + 0.5)))
            writeByte((math.floor(a1.G * 255 + 0.5)))
            writeByte((math.floor(a1.B * 255 + 0.5)))
        end,
        writeCFrame = function(a1) -- Line: 1014
            -- upvalues: u184 (upval), writeByte (val), writeFloat32 (val), u10 (ref), u19 (ref), u24 (ref), u12 (ref)
            -- upvalues: u20 (ref)
            local v1
            assert(typeof(a1) == "CFrame", "argument #1 to BitBuffer.writeCFrame should be a CFrame")
            local UpVector = a1.UpVector
            local RightVector = a1.RightVector
            local v2 = math.abs((RightVector:Dot((Vector3.new(1, 1, 1)))))
            local v3 = math.abs((UpVector:Dot((Vector3.new(1, 1, 1)))))
            if (math.abs(1 - v2)) < 1e-05 then
                v1 = true
                if not ((math.abs(1 - v3)) < 1e-05) then
                    v1 = v3 == 0
                end
            else
                v1 = false
                if v2 == 0 then
                    v1 = true
                    if not ((math.abs(1 - v3)) < 1e-05) then
                        v1 = v3 == 0
                    end
                end
            end
            if v1 then
                local v4
                local Position = a1.Position
                local v5 = nil
                local v6 = nil
                for i = 0, 5 do
                    v4 = u184[i]
                    if 1 - v4:Dot(RightVector) < 1e-05 then
                        v5 = i
                    end
                    if 1 - v4:Dot(UpVector) < 1e-05 then
                        v6 = i
                    end
                end
                writeByte(v5 * 6 + v6)
                writeFloat32(Position.X)
                writeFloat32(Position.Y)
                writeFloat32(Position.Z)
                return
            end
            assert(true, "argument #1 to BitBuffer.writeByte should be a number")
            assert(true, "argument #1 to BitBuffer.writeByte should be in the range [0, 255]")
            assert(true, "argument #1 to BitBuffer.writeByte should be an integer")
            if u10 ~= 0 then
                local v7 = bit32.rshift(0, u10)
                u24[u19] = u12 + v7
                u19 = u19 + 1
                u12 = bit32.band(bit32.lshift(0, 8 - u10), 255)
                u24[u19] = u12
            else
                u19 = u19 + 1
                u24[u19] = 0
            end
            u20 = u20 + 8
            local Components_2, Components_3, Components_4, Components_5, Components_6, Components_7, Components_8, Components_9, Components_10, Components_11, Components_12, Components = a1:GetComponents()
            writeFloat32(Components_2)
            writeFloat32(Components_3)
            writeFloat32(Components_4)
            writeFloat32(Components_5)
            writeFloat32(Components_6)
            writeFloat32(Components_7)
            writeFloat32(Components_8)
            writeFloat32(Components_9)
            writeFloat32(Components_10)
            writeFloat32(Components_11)
            writeFloat32(Components_12)
            writeFloat32(Components)
        end,
        writeVector3 = function(a1) -- Line: 1078 -- upvalues: writeFloat32 (val)
            assert(typeof(a1) == "Vector3", "argument #1 to BitBuffer.writeVector3 should be a Vector3")
            writeFloat32(a1.X)
            writeFloat32(a1.Y)
            writeFloat32(a1.Z)
        end,
        writeVector2 = function(a1) -- Line: 1086 -- upvalues: writeFloat32 (val)
            assert(typeof(a1) == "Vector2", "argument #1 to BitBuffer.writeVector2 should be a Vector2")
            writeFloat32(a1.X)
            writeFloat32(a1.Y)
        end,
        writeUDim2 = function(a1) -- Line: 1093 -- upvalues: writeFloat32 (val), writeInt32 (val)
            assert(typeof(a1) == "UDim2", "argument #1 to BitBuffer.writeUDim2 should be a UDim2")
            writeFloat32(a1.X.Scale)
            writeInt32(a1.X.Offset)
            writeFloat32(a1.Y.Scale)
            writeInt32(a1.Y.Offset)
        end,
        writeUDim = function(a1) -- Line: 1102 -- upvalues: writeFloat32 (val), writeInt32 (val)
            assert(typeof(a1) == "UDim", "argument #1 to BitBuffer.writeUDim should be a UDim")
            writeFloat32(a1.Scale)
            writeInt32(a1.Offset)
        end,
        writeRay = function(a1) -- Line: 1109 -- upvalues: writeFloat32 (val)
            assert(typeof(a1) == "Ray", "argument #1 to BitBuffer.writeRay should be a Ray")
            writeFloat32(a1.Origin.X)
            writeFloat32(a1.Origin.Y)
            writeFloat32(a1.Origin.Z)
            writeFloat32(a1.Direction.X)
            writeFloat32(a1.Direction.Y)
            writeFloat32(a1.Direction.Z)
        end,
        writeRect = function(a1) -- Line: 1121 -- upvalues: writeFloat32 (val)
            assert(typeof(a1) == "Rect", "argument #1 to BitBuffer.writeRect should be a Rect")
            writeFloat32(a1.Min.X)
            writeFloat32(a1.Min.Y)
            writeFloat32(a1.Max.X)
            writeFloat32(a1.Max.Y)
        end,
        writeRegion3 = function(a1) -- Line: 1131 -- upvalues: writeFloat32 (val)
            assert(typeof(a1) == "Region3", "argument #1 to BitBuffer.writeRegion3 should be a Region3")
            local v1 = a1.CFrame.Position - a1.Size / 2
            local v2 = a1.CFrame.Position + a1.Size / 2
            writeFloat32(v1.X)
            writeFloat32(v1.Y)
            writeFloat32(v1.Z)
            writeFloat32(v2.X)
            writeFloat32(v2.Y)
            writeFloat32(v2.Z)
        end,
        writeEnum = function(a1) -- Line: 1149 -- upvalues: writeTerminatedString (val), writeByte (val)
            assert(typeof(a1) == "EnumItem", "argument #1 to BitBuffer.writeEnum should be an EnumItem")
            writeTerminatedString((tostring(a1.EnumType)))
            local Value = a1.Value
            assert(type(Value) == "number", "argument #1 to BitBuffer.writeUInt16 should be a number")
            local v1 = false
            if Value >= 0 then
                v1 = Value <= 65535
            end
            assert(v1, "argument #1 to BitBuffer.writeInt16 should be in the range [0, 65535]")
            assert(Value % 1 == 0, "argument #1 to BitBuffer.writeUInt16 should be an integer")
            writeByte((bit32.rshift(Value, 8)))
            writeByte((bit32.band(Value, 255)))
        end,
        writeNumberRange = function(a1) -- Line: 1160 -- upvalues: writeFloat32 (val)
            assert(typeof(a1) == "NumberRange", "argument #1 to BitBuffer.writeNumberRange should be a NumberRange")
            writeFloat32(a1.Min)
            writeFloat32(a1.Max)
        end,
        writeNumberSequence = function(a1) -- Line: 1170 -- upvalues: writeUInt32 (val), writeFloat32 (val)
            assert(typeof(a1) == "NumberSequence", "argument #1 to BitBuffer.writeNumberSequence should be a NumberSequence")
            writeUInt32(#a1.Keypoints)
            for i, v in ipairs(a1.Keypoints) do
                writeFloat32(v.Time)
                writeFloat32(v.Value)
                writeFloat32(v.Envelope)
            end
        end,
        writeColorSequence = function(a1) -- Line: 1184 -- upvalues: writeUInt32 (val), writeFloat32 (val), writeByte (val)
            local Value
            assert(typeof(a1) == "ColorSequence", "argument #1 to BitBuffer.writeColorSequence should be a ColorSequence")
            writeUInt32(#a1.Keypoints)
            for i, v in ipairs(a1.Keypoints) do
                Value = v.Value
                writeFloat32(v.Time)
                writeByte((math.floor(Value.R * 255 + 0.5)))
                writeByte((math.floor(Value.G * 255 + 0.5)))
                writeByte((math.floor(Value.B * 255 + 0.5)))
            end
        end,
        readBits = readBits,
        readByte = function() -- Line: 1230 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v1 = u15 % 8
            local v2 = u24[u16]
            u15 = u15 + 8
            if v1 == 0 then
                u16 = u16 + 1
                return v2
            end
            u16 = u16 + 1
            return (bit32.band(bit32.lshift(v2, v1), 255)) + bit32.rshift(u24[u16], 8 - v1)
        end,
        readUnsigned = readUnsigned,
        readSigned = function(a1) -- Line: 1282
            -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref), u105 (upval), u167 (upval), readUnsigned (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.readSigned should be a number")
            local v1 = false
            if a1 >= 2 then
                v1 = a1 <= 64
            end
            assert(v1, "argument #1 to BitBuffer.readSigned should be in the range [2, 64]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.readSigned should be an integer")
            assert(u15 + 8 <= u20, "BitBuffer.readSigned cannot read past the end of the stream")
            assert(true, "argument #1 to BitBuffer.readBits should be a number")
            assert(true, "argument #1 to BitBuffer.readBits should be greater than zero")
            assert(true, "argument #1 to BitBuffer.readBits should be an integer")
            assert(u15 + 1 <= u20, "BitBuffer.readBits cannot read past the end of the stream")
            v1 = table.create(1)
            local v2 = u24[u16]
            local v3 = u15 % 8
            local v4 = u105[7 - v3]
            v1[1] = u167[bit32.btest(v2, v4)]
            if v3 + 1 == 8 then
                u16 = u16 + 1
                v2 = u24[u16]
            end
            u15 = u15 + 1
            local v5 = v1[1]
            v1 = readUnsigned(a1 - 1)
            if v5 == 0 then
                return v1
            end
            return v1 - u105[a1 - 1]
        end,
        readFloat = function(a1, a2) -- Line: 1307
            -- upvalues: u15 (ref), u20 (ref), u105 (upval), u24 (ref), u16 (ref), u167 (upval), readUnsigned (val)
            assert(type(a1) == "number", "argument #1 to BitBuffer.readFloat should be a number")
            local v1 = false
            if a1 >= 1 then
                v1 = a1 <= 64
            end
            assert(v1, "argument #1 to BitBuffer.readFloat should be in the range [1, 64]")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.readFloat should be an integer")
            assert(type(a2) == "number", "argument #2 to BitBuffer.readFloat should be a number")
            v1 = false
            if a2 >= 1 then
                v1 = a2 <= 64
            end
            assert(v1, "argument #2 to BitBuffer.readFloat should be in the range [1, 64]")
            assert(a2 % 1 == 0, "argument #2 to BitBuffer.readFloat should be an integer")
            assert(u15 + a1 + a2 + 1 <= u20, "BitBuffer.readFloat cannot read past the end of the stream")
            local v2 = u105[a1 - 1] - 1
            assert(true, "argument #1 to BitBuffer.readBits should be a number")
            assert(true, "argument #1 to BitBuffer.readBits should be greater than zero")
            assert(true, "argument #1 to BitBuffer.readBits should be an integer")
            assert(u15 + 1 <= u20, "BitBuffer.readBits cannot read past the end of the stream")
            local v3 = table.create(1)
            local v4 = u24[u16]
            local v5 = u15 % 8
            local v6 = u105[7 - v5]
            v3[1] = u167[bit32.btest(v4, v6)]
            if v5 + 1 == 8 then
                u16 = u16 + 1
                v4 = u24[u16]
            end
            u15 = u15 + 1
            v1 = v3[1]
            v3 = readUnsigned(a1)
            v4 = readUnsigned(a2)
            if v3 == u105[a1] - 1 then
                if v4 ~= 0 then
                    return (0 / 0)
                end
                if v1 == 0 then
                    return (1 / 0)
                end
                return (-1 / 0)
            end
            if v3 ~= 0 then
                v4 = v4 / u105[a2] + 1
                return not (v1 ~= 1) and -math.ldexp(v4, v3 - v2) or math.ldexp(v4, v3 - v2)
            end
            if v4 == 0 then
                return 0
            end
            v4 = v4 / u105[a2]
            return not (v1 ~= 1) and -math.ldexp(v4, -v2 + 1) or math.ldexp(v4, -v2 + 1)
        end,
        readString = function() -- Line: 1372 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1, v2, v3, v4, v5
            assert(u15 + 24 <= u20, "BitBuffer.readString cannot read past the end of the stream")
            assert(true, "argument #1 to BitBuffer.readUnsigned should be a number")
            assert(true, "argument #1 to BitBuffer.readUnsigned should be in the range [1, 64]")
            assert(true, "argument #1 to BitBuffer.readUnsigned should be an integer")
            assert(u15 + 24 <= u20, "BitBuffer.readUnsigned cannot read past the end of the stream")
            local v6 = 0
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v7 = u15 % 8
            local v8 = u24[u16]
            u15 = u15 + 8
            if v7 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v8, v7), 255)) + bit32.rshift(u24[u16], 8 - v7)
            else
                u16 = u16 + 1
                v1 = v8
            end
            v6 = (v6 + v1) * 256
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v7 = u15 % 8
            v8 = u24[u16]
            u15 = u15 + 8
            if v7 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v8, v7), 255)) + bit32.rshift(u24[u16], 8 - v7)
            else
                u16 = u16 + 1
                v1 = v8
            end
            v6 = (v6 + v1) * 256
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v7 = u15 % 8
            v8 = u24[u16]
            u15 = u15 + 8
            if v7 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v8, v7), 255)) + bit32.rshift(u24[u16], 8 - v7)
            else
                u16 = u16 + 1
                v1 = v8
            end
            v6 = v6 + v1
            assert(u15 + v6 * 8 <= u20, "BitBuffer.readString cannot read past the end of the stream")
            v1 = table.create(v6)
            for i = 1, v6 do
                assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
                v4 = u15 % 8
                v5 = u24[u16]
                u15 = u15 + 8
                if v4 ~= 0 then
                    u16 = u16 + 1
                    v3 = (bit32.band(bit32.lshift(v5, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
                else
                    u16 = u16 + 1
                    v3 = v5
                end
                v1[i] = v3
            end
            v7 = table.create((math.ceil(v6 / 4096)))
            v8 = 1
            for j = 1, v6, 4096 do
                v2 = math.min(v6, j + 4095)
                v7[v8] = (string.char((table.unpack(v1, j, v2))))
                v8 = v8 + 1
            end
            return table.concat(v7)
        end,
        readTerminatedString = readTerminatedString,
        readSetLengthString = function(a1) -- Line: 1430 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1, v2, v3, v4, v5
            assert(type(a1) == "number", "argument #1 to BitBuffer.readSetLengthString should be a number")
            assert(a1 >= 0, "argument #1 to BitBuffer.readSetLengthString should be zero or higher.")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.readSetLengthString should be an integer")
            assert(u15 + a1 * 8 <= u20, "BitBuffer.readSetLengthString cannot read past the end of the stream")
            local v6 = table.create(a1)
            for i = 1, a1 do
                assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
                v4 = u15 % 8
                v5 = u24[u16]
                u15 = u15 + 8
                if v4 ~= 0 then
                    u16 = u16 + 1
                    v3 = (bit32.band(bit32.lshift(v5, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
                else
                    u16 = u16 + 1
                    v3 = v5
                end
                v6[i] = v3
            end
            local v7 = table.create((math.ceil(v1 / 4096)))
            local v8 = 1
            for j = 1, v1, 4096 do
                v2 = math.min(v1, j + 4095)
                v7[v8] = (string.char((table.unpack(v6, j, v2))))
                v8 = v8 + 1
            end
            return table.concat(v7)
        end,
        readField = function(a1) -- Line: 1463 -- upvalues: u15 (ref), u20 (ref), readUnsigned (val)
            local v1
            assert(type(a1) == "number", "argument #1 to BitBuffer.readField should be a number")
            assert(a1 > 0, "argument #1 to BitBuffer.readField should be above 0")
            assert(a1 % 1 == 0, "argument #1 to BitBuffer.readField should be an integer")
            assert(u15 + a1 <= u20, "BitBuffer.readField cannot read past the end of the stream")
            local v2 = readUnsigned(a1)
            local v3 = table.create(a1)
            for i = a1, 1, -1 do
                v1 = v2 % 2 == 1
                v3[i] = v1
                v2 = math.floor(v2 / 2)
            end
            return v3
        end,
        readUInt8 = function() -- Line: 1487 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            assert(u15 + 8 <= u20, "BitBuffer.readUInt8 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v1 = u15 % 8
            local v2 = u24[u16]
            u15 = u15 + 8
            if v1 == 0 then
                u16 = u16 + 1
                return v2
            end
            u16 = u16 + 1
            return (bit32.band(bit32.lshift(v2, v1), 255)) + bit32.rshift(u24[u16], 8 - v1)
        end,
        readUInt16 = function() -- Line: 1496 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1
            assert(u15 + 16 <= u20, "BitBuffer.readUInt16 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v4 = bit32.lshift(v1, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v2 = u15 % 8
            v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            return v4 + v1
        end,
        readUInt32 = function() -- Line: 1505 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1
            assert(u15 + 32 <= u20, "BitBuffer.readUInt32 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v4 = bit32.lshift(v1, 24)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v3 = u15 % 8
            local v5 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v2 = (bit32.band(bit32.lshift(v5, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v2 = v5
            end
            local v6 = v4 + bit32.lshift(v2, 16)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v2 = u15 % 8
            v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v7 = v6 + bit32.lshift(v1, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v4 = u15 % 8
            v1 = u24[u16]
            u15 = u15 + 8
            if v4 ~= 0 then
                u16 = u16 + 1
                v6 = (bit32.band(bit32.lshift(v1, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
            else
                u16 = u16 + 1
                v6 = v1
            end
            return v7 + v6
        end,
        readInt8 = function() -- Line: 1517 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1
            assert(u15 + 8 <= u20, "BitBuffer.readInt8 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            v2 = bit32.btest(v1, 128)
            v1 = bit32.band(v1, 127)
            if v2 then
                return v1 - 128
            end
            return v1
        end,
        readInt16 = function() -- Line: 1531 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1
            assert(u15 + 16 <= u20, "BitBuffer.readInt16 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v4 = bit32.lshift(v1, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v2 = u15 % 8
            v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v5 = v4 + v1
            v4 = bit32.btest(v5, 32768)
            v5 = bit32.band(v5, 32767)
            if v4 then
                return v5 - 32768
            end
            return v5
        end,
        readInt32 = readInt32,
        readFloat16 = function() -- Line: 1568 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1, v2
            assert(u15 + 16 <= u20, "BitBuffer.readFloat16 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v3 = u15 % 8
            local v4 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v4, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v1 = v4
            end
            v3 = bit32.btest(v1, 128)
            v4 = bit32.rshift(bit32.band(v1, 127), 2)
            local v5 = bit32.lshift(bit32.band(v1, 3), 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v6 = u15 % 8
            local v7 = u24[u16]
            u15 = u15 + 8
            if v6 ~= 0 then
                u16 = u16 + 1
                v2 = (bit32.band(bit32.lshift(v7, v6), 255)) + bit32.rshift(u24[u16], 8 - v6)
            else
                u16 = u16 + 1
                v2 = v7
            end
            local v8 = v5 + v2
            if v4 == 31 then
                if v8 ~= 0 then
                    return (0 / 0)
                end
                if v3 then
                    return (-1 / 0)
                end
                return (1 / 0)
            end
            if v4 ~= 0 then
                v8 = v8 / 1024 + 1
                return v3 and -math.ldexp(v8, v4 - 15) or math.ldexp(v8, v4 - 15)
            end
            if v8 == 0 then
                return 0
            end
            return v3 and -math.ldexp(v8 / 1024, -14) or math.ldexp(v8 / 1024, -14)
        end,
        readFloat32 = readFloat32,
        readFloat64 = function() -- Line: 1635 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1, v2
            assert(u15 + 64 <= u20, "BitBuffer.readFloat64 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v3 = u15 % 8
            local v4 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v4, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v1 = v4
            end
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v4 = u15 % 8
            local v5 = u24[u16]
            u15 = u15 + 8
            if v4 ~= 0 then
                u16 = u16 + 1
                v3 = (bit32.band(bit32.lshift(v5, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
            else
                u16 = u16 + 1
                v3 = v5
            end
            v4 = bit32.btest(v1, 128)
            v5 = (bit32.lshift(bit32.band(v1, 127), 4)) + bit32.rshift(v3, 4)
            local v6 = bit32.lshift(bit32.band(v3, 15), 16)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v7 = u15 % 8
            local v8 = u24[u16]
            u15 = u15 + 8
            if v7 ~= 0 then
                u16 = u16 + 1
                v2 = (bit32.band(bit32.lshift(v8, v7), 255)) + bit32.rshift(u24[u16], 8 - v7)
            else
                u16 = u16 + 1
                v2 = v8
            end
            local v9 = v6 + bit32.lshift(v2, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v10 = u15 % 8
            v2 = u24[u16]
            u15 = u15 + 8
            if v10 ~= 0 then
                u16 = u16 + 1
                v6 = (bit32.band(bit32.lshift(v2, v10), 255)) + bit32.rshift(u24[u16], 8 - v10)
            else
                u16 = u16 + 1
                v6 = v2
            end
            local v11 = v9 + v6
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v8 = u15 % 8
            local v12 = u24[u16]
            u15 = u15 + 8
            if v8 ~= 0 then
                u16 = u16 + 1
                v7 = (bit32.band(bit32.lshift(v12, v8), 255)) + bit32.rshift(u24[u16], 8 - v8)
            else
                u16 = u16 + 1
                v7 = v12
            end
            v2 = bit32.lshift(v7, 24)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v12 = u15 % 8
            local v13 = u24[u16]
            u15 = u15 + 8
            if v12 ~= 0 then
                u16 = u16 + 1
                v8 = (bit32.band(bit32.lshift(v13, v12), 255)) + bit32.rshift(u24[u16], 8 - v12)
            else
                u16 = u16 + 1
                v8 = v13
            end
            v10 = v2 + bit32.lshift(v8, 16)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v8 = u15 % 8
            v12 = u24[u16]
            u15 = u15 + 8
            if v8 ~= 0 then
                u16 = u16 + 1
                v7 = (bit32.band(bit32.lshift(v12, v8), 255)) + bit32.rshift(u24[u16], 8 - v8)
            else
                u16 = u16 + 1
                v7 = v12
            end
            v6 = v10 + bit32.lshift(v7, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v2 = u15 % 8
            v7 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v10 = (bit32.band(bit32.lshift(v7, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v10 = v7
            end
            v9 = v6 + v10
            v6 = v11 * 4294967296 + v9
            if v5 == 2047 then
                if v6 ~= 0 then
                    return (0 / 0)
                end
                if v4 then
                    return (-1 / 0)
                end
                return (1 / 0)
            end
            if v5 ~= 0 then
                v6 = v6 / 4503599627370496 + 1
                return v4 and -math.ldexp(v6, v5 - 1023) or math.ldexp(v6, v5 - 1023)
            end
            if v6 == 0 then
                return 0
            end
            return v4 and -math.ldexp(v6 / 4503599627370496, -1022) or math.ldexp(v6 / 4503599627370496, -1022)
        end,
        readBrickColor = function() -- Line: 1682 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1
            assert(u15 + 16 <= u20, "BitBuffer.readBrickColor cannot read past the end of the stream")
            local new = BrickColor.new
            assert(u15 + 16 <= u20, "BitBuffer.readUInt16 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v4 = bit32.lshift(v1, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v2 = u15 % 8
            v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            return new(v4 + v1)
        end,
        readColor3 = function() -- Line: 1691 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref)
            local v1
            assert(u15 + 24 <= u20, "BitBuffer.readColor3 cannot read past the end of the stream")
            local fromRGB = Color3.fromRGB
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v3 = u15 % 8
            local v4 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v2 = (bit32.band(bit32.lshift(v4, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v2 = v4
            end
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v4 = u15 % 8
            local v5 = u24[u16]
            u15 = u15 + 8
            if v4 ~= 0 then
                u16 = u16 + 1
                v3 = (bit32.band(bit32.lshift(v5, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
            else
                u16 = u16 + 1
                v3 = v5
            end
            return fromRGB(v1, v2, v3)
        end,
        readCFrame = function() -- Line: 1700 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref), readFloat32 (val), u184 (upval)
            local v1
            assert(u15 + 8 <= u20, "BitBuffer.readCFrame cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            if v1 == 0 then
                assert(u15 + 384 <= u20, "BitBuffer.readCFrame cannot read past the end of the stream")
                return CFrame.new(
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    readFloat32(),
                    (readFloat32())
                )
            end
            assert(u15 + 96 <= u20, "BitBuffer.readCFrame cannot read past the end of the stream")
            v2 = u184[math.floor(v1 / 6)]
            v3 = u184[v1 % 6]
            local v4 = v2:Cross(v3)
            return CFrame.new(readFloat32(), readFloat32(), readFloat32(), v2.X, v3.X, v4.X, v2.Y, v3.Y, v4.Y, v2.Z, v3.Z, v4.Z)
        end,
        readVector3 = function() -- Line: 1742 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val)
            assert(u15 + 96 <= u20, "BitBuffer.readVector3 cannot read past the end of the stream")
            return (Vector3.new(readFloat32(), readFloat32(), (readFloat32())))
        end,
        readVector2 = function() -- Line: 1751 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val)
            assert(u15 + 64 <= u20, "BitBuffer.readVector2 cannot read past the end of the stream")
            return Vector2.new(readFloat32(), (readFloat32()))
        end,
        readUDim2 = function() -- Line: 1760 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val), readInt32 (val)
            assert(u15 + 128 <= u20, "BitBuffer.readUDim2 cannot read past the end of the stream")
            return UDim2.new(readFloat32(), readInt32(), readFloat32(), (readInt32()))
        end,
        readUDim = function() -- Line: 1769 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val), readInt32 (val)
            assert(u15 + 64 <= u20, "BitBuffer.readUDim cannot read past the end of the stream")
            return UDim.new(readFloat32(), (readInt32()))
        end,
        readRay = function() -- Line: 1778 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val)
            assert(u15 + 192 <= u20, "BitBuffer.readRay cannot read past the end of the stream")
            return Ray.new(
                Vector3.new(readFloat32(), readFloat32(), (readFloat32())),
                (Vector3.new(readFloat32(), readFloat32(), (readFloat32())))
            )
        end,
        readRect = function() -- Line: 1790 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val)
            assert(u15 + 128 <= u20, "BitBuffer.readRect cannot read past the end of the stream")
            return Rect.new(readFloat32(), readFloat32(), readFloat32(), (readFloat32()))
        end,
        readRegion3 = function() -- Line: 1799 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val)
            assert(u15 + 192 <= u20, "BitBuffer.readRegion3 cannot read past the end of the stream")
            return Region3.new(
                Vector3.new(readFloat32(), readFloat32(), (readFloat32())),
                (Vector3.new(readFloat32(), readFloat32(), (readFloat32())))
            )
        end,
        readEnum = function() -- Line: 1811 -- upvalues: u15 (ref), u20 (ref), readTerminatedString (val), u24 (ref), u16 (ref)
            local v1
            assert(u15 + 8 <= u20, "BitBuffer.readEnum cannot read past the end of the stream")
            local v2 = readTerminatedString()
            assert(u15 + 16 <= u20, "BitBuffer.readEnum cannot read past the end of the stream")
            assert(u15 + 16 <= u20, "BitBuffer.readUInt16 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v3 = u15 % 8
            local v4 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v4, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v1 = v4
            end
            local v5 = bit32.lshift(v1, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v3 = u15 % 8
            v4 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v4, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v1 = v4
            end
            local v6 = v5 + v1
            for i, v in ipairs(Enum[v2]:GetEnumItems()) do
                if v.Value == v6 then
                    return v
                end
            end
            error("BitBuffer.readEnum could not get value: `" .. (tostring(v6)) .. "` is not a valid member of `" .. v2 .. "`", 2)
        end,
        readNumberRange = function() -- Line: 1841 -- upvalues: u15 (ref), u20 (ref), readFloat32 (val)
            assert(u15 + 64 <= u20, "BitBuffer.readNumberRange cannot read past the end of the stream")
            return NumberRange.new(readFloat32(), (readFloat32()))
        end,
        readNumberSequence = function() -- Line: 1850 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref), readFloat32 (val)
            local v1
            assert(u15 + 32 <= u20, "BitBuffer.readNumberSequence cannot read past the end of the stream")
            assert(u15 + 32 <= u20, "BitBuffer.readUInt32 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v2 = u15 % 8
            local v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v4 = bit32.lshift(v1, 24)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v3 = u15 % 8
            local v5 = u24[u16]
            u15 = u15 + 8
            if v3 ~= 0 then
                u16 = u16 + 1
                v2 = (bit32.band(bit32.lshift(v5, v3), 255)) + bit32.rshift(u24[u16], 8 - v3)
            else
                u16 = u16 + 1
                v2 = v5
            end
            local v6 = v4 + bit32.lshift(v2, 16)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v2 = u15 % 8
            v3 = u24[u16]
            u15 = u15 + 8
            if v2 ~= 0 then
                u16 = u16 + 1
                v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
            else
                u16 = u16 + 1
                v1 = v3
            end
            local v7 = v6 + bit32.lshift(v1, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v4 = u15 % 8
            v1 = u24[u16]
            u15 = u15 + 8
            if v4 ~= 0 then
                u16 = u16 + 1
                v6 = (bit32.band(bit32.lshift(v1, v4), 255)) + bit32.rshift(u24[u16], 8 - v4)
            else
                u16 = u16 + 1
                v6 = v1
            end
            local v8 = v7 + v6
            assert(u15 + v8 * 96, "BitBuffer.readColorSequence cannot read past the end of the stream")
            v7 = table.create(v8)
            for i = 1, v8 do
                v2 = readFloat32()
                v3 = readFloat32()
                v5 = readFloat32()
                if v3 < 0 then
                    v5 = nil
                end
                v7[i] = (NumberSequenceKeypoint.new(v2, v3, v5))
            end
            return NumberSequence.new(v7)
        end,
        readColorSequence = function() -- Line: 1883 -- upvalues: u15 (ref), u20 (ref), u24 (ref), u16 (ref), readFloat32 (val)
            local fromRGB, new, v1, v2, v3, v4, v5, v6
            assert(u15 + 32 <= u20, "BitBuffer.readColorSequence cannot read past the end of the stream")
            assert(u15 + 32 <= u20, "BitBuffer.readUInt32 cannot read past the end of the stream")
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            local v7 = u15 % 8
            local v8 = u24[u16]
            u15 = u15 + 8
            if v7 ~= 0 then
                u16 = u16 + 1
                v4 = (bit32.band(bit32.lshift(v8, v7), 255)) + bit32.rshift(u24[u16], 8 - v7)
            else
                u16 = u16 + 1
                v4 = v8
            end
            local v9 = bit32.lshift(v4, 24)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v8 = u15 % 8
            local v10 = u24[u16]
            u15 = u15 + 8
            if v8 ~= 0 then
                u16 = u16 + 1
                v7 = (bit32.band(bit32.lshift(v10, v8), 255)) + bit32.rshift(u24[u16], 8 - v8)
            else
                u16 = u16 + 1
                v7 = v10
            end
            local v11 = v9 + bit32.lshift(v7, 16)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v7 = u15 % 8
            v8 = u24[u16]
            u15 = u15 + 8
            if v7 ~= 0 then
                u16 = u16 + 1
                v4 = (bit32.band(bit32.lshift(v8, v7), 255)) + bit32.rshift(u24[u16], 8 - v7)
            else
                u16 = u16 + 1
                v4 = v8
            end
            local v12 = v11 + bit32.lshift(v4, 8)
            assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
            v9 = u15 % 8
            v4 = u24[u16]
            u15 = u15 + 8
            if v9 ~= 0 then
                u16 = u16 + 1
                v11 = (bit32.band(bit32.lshift(v4, v9), 255)) + bit32.rshift(u24[u16], 8 - v9)
            else
                u16 = u16 + 1
                v11 = v4
            end
            local v13 = v12 + v11
            assert(u15 + v13 * 56, "BitBuffer.readColorSequence cannot read past the end of the stream")
            v12 = table.create(v13)
            for i = 1, v13 do
                new = ColorSequenceKeypoint.new
                v8 = readFloat32()
                fromRGB = Color3.fromRGB
                assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
                v6 = u15 % 8
                v1 = u24[u16]
                u15 = u15 + 8
                if v6 ~= 0 then
                    u16 = u16 + 1
                    v5 = (bit32.band(bit32.lshift(v1, v6), 255)) + bit32.rshift(u24[u16], 8 - v6)
                else
                    u16 = u16 + 1
                    v5 = v1
                end
                assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
                v1 = u15 % 8
                v2 = u24[u16]
                u15 = u15 + 8
                if v1 ~= 0 then
                    u16 = u16 + 1
                    v6 = (bit32.band(bit32.lshift(v2, v1), 255)) + bit32.rshift(u24[u16], 8 - v1)
                else
                    u16 = u16 + 1
                    v6 = v2
                end
                assert(u15 + 8 <= u20, "BitBuffer.readByte cannot read past the end of the stream")
                v2 = u15 % 8
                v3 = u24[u16]
                u15 = u15 + 8
                if v2 ~= 0 then
                    u16 = u16 + 1
                    v1 = (bit32.band(bit32.lshift(v3, v2), 255)) + bit32.rshift(u24[u16], 8 - v2)
                else
                    u16 = u16 + 1
                    v1 = v3
                end
                v12[i] = (new(v8, fromRGB(v5, v6, v1)))
            end
            return ColorSequence.new(v12)
        end,
    }
end