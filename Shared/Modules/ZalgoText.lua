-- Script path: ReplicatedStorage.Shared.Modules.ZalgoText
-- Decompile time: 1.37 ms

local u0 = {}
u0.RNG = Random.new()
u0.UP_CHARACTERS = {
    781,
    782,
    772,
    773,
    831,
    785,
    774,
    784,
    850,
    855,
    849,
    775,
    776,
    778,
    834,
    835,
    836,
    842,
    843,
    844,
    771,
    770,
    780,
    848,
    768,
    769,
    779,
    783,
    786,
    787,
    788,
    829,
    777,
    867,
    868,
    869,
    870,
    871,
    872,
    873,
    874,
    875,
    876,
    877,
    878,
    879,
    830,
    859,
    838,
    794,
}
u0.LOW_CHARACTERS = {
    790,
    791,
    792,
    793,
    796,
    797,
    798,
    799,
    800,
    804,
    805,
    806,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816,
    817,
    818,
    819,
    825,
    826,
    827,
    828,
    837,
    839,
    840,
    841,
    845,
    846,
    851,
    852,
    853,
    854,
    857,
    858,
    803,
}
u0.MID_CHARACTERS = {
    789,
    795,
    832,
    833,
    856,
    801,
    802,
    807,
    808,
    820,
    821,
    822,
    847,
    860,
    861,
    862,
    863,
    864,
    866,
    824,
    823,
    865,
    1161,
}

local function addToCharacter(a1, a2, a3) -- Line: 127 -- upvalues: u0 (val) -- types: a1: string, a2: number, a3: table
    if a2 < 1 then
        return a1
    end
    for i = 1, a2 do
        a1 = a1 .. utf8.char(a3[u0.RNG:NextInteger(1, #a3)])
    end
    return a1
end

function u0.Generate(a1, a2, a3, a4) -- Line: 139
    -- upvalues: addToCharacter (val), u0 (val)
    local v1
    local v2 = string.split(a1, "")
    for i, j in v2 do
        v1 = addToCharacter(addToCharacter(j, a2 or 0, u0.UP_CHARACTERS), a3 or 0, u0.MID_CHARACTERS)
        v2[i] = (addToCharacter(v1, a4 or 0, u0.LOW_CHARACTERS))
    end
    return table.concat(v2, "")
end

function u0.GenerateRandom(a1, a2) -- Line: 155 -- upvalues: u0 (val) -- types: a1: string, a2: number
    assert(a2, "Required 'max' zalgo character count")
    u0.RNG:NextInteger(1, a2)
    local v1 = u0.RNG:NextInteger(1, a2)
    return u0.Generate(a1, v1, 0, v1)
end

return u0