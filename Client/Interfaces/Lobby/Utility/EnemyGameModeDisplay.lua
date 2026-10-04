-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.EnemyGameModeDisplay
-- Decompile time: 3.45 ms

local u0 = {}
local u1 = {}
u1.Easy = Color3.fromRGB(0, 204, 7)
u1.Casual = Color3.fromRGB(255, 0, 153)
u1.Intermediate = Color3.fromRGB(17, 255, 108)
u1.Molten = Color3.fromRGB(255, 128, 0)
u1.Fallen = Color3.fromRGB(204, 0, 255)
u1.Frost = Color3.fromRGB(60, 152, 250)
u1.Trial = Color3.fromRGB(255, 255, 255)
u1.Hardcore = Color3.fromRGB(183, 0, 255)
u1.Voidcore = Color3.fromRGB(183, 0, 255)
u1.PVP = Color3.fromRGB(255, 84, 84)
u1.Badlands = Color3.fromRGB(255, 191, 90)
u1["Pizza Party"] = Color3.fromRGB(255, 95, 95)
u1["Polluted Wasteland"] = Color3.fromRGB(84, 255, 140)
u1["The Classic"] = Color3.fromRGB(50, 145, 255)
u1["Egg Hunt 2024"] = Color3.fromRGB(255, 212, 91)
u1["Halloween 2023"] = Color3.fromRGB(255, 118, 38)
u1.Winter = Color3.fromRGB(130, 225, 255)
u1["Halloween 2024"] = Color3.fromRGB(199, 84, 255)
u1["Duck Event"] = Color3.fromRGB(255, 207, 40)
u1["Frost Invasion"] = Color3.fromRGB(75, 210, 255)
u1["Hunt 2025"] = Color3.fromRGB(103, 255, 174)
u1["Pls Donate"] = Color3.fromRGB(255, 251, 31)
u1["Halloween 2025"] = Color3.fromRGB(255, 76, 161)
u1["Null Zone"] = Color3.fromRGB(190, 64, 255)
u1["Christmas 2025"] = Color3.fromRGB(75, 235, 155)
u1["Backyard Legends"] = Color3.fromRGB(92, 182, 255)
local u132 = {
    Easy = 1,
    Casual = 2,
    Intermediate = 3,
    Molten = 4,
    Fallen = 5,
    Frost = 6,
    Trial = 7,
    Hardcore = 20,
    Voidcore = 21,
    PVP = 30,
    Badlands = 40,
    ["Pizza Party"] = 41,
    ["Polluted Wasteland"] = 42,
    ["The Classic"] = 50,
    ["Egg Hunt 2024"] = 51,
    ["Halloween 2023"] = 52,
    Winter = 53,
    ["Halloween 2024"] = 54,
    ["Duck Event"] = 55,
    ["Frost Invasion"] = 56,
    ["Hunt 2025"] = 57,
    ["Pls Donate"] = 58,
    ["Halloween 2025"] = 59,
    ["Null Zone"] = 60,
    ["Christmas 2025"] = 61,
    ["Backyard Legends"] = 62,
}

function u0.sortModeNames(a1, a2) -- Line: 61 -- upvalues: u132 (val) -- types: a1: string, a2: string
    local v1 = u132[a1] or (1 / 0)
    local v2 = u132[a2] or (1 / 0)
    if v1 == v2 then
        return a1 < a2
    end
    return v1 < v2
end

function u0.getRichText(a1) -- Line: 72 -- upvalues: u1 (val) -- types: a1: string
    local v1 = u1[a1] or Color3.fromRGB(255, 255, 255)
    return (("<font color=\"rgb(%*,%*,%*)\">%*</font>"):format(math.round(v1.R * 255), math.round(v1.G * 255), math.round(v1.B * 255), a1))
end

function u0.formatAppearsInText(a1, a2, a3, a4) -- Line: 79
    -- upvalues: u0 (val)
    local v1
    local v2 = "Appears in: "
    local v3 = a4 or "all modes"
    if #a1 == a3 then
        v1 = {v3}
        v2 = "Appears in "
    elseif not (#a2 < #a1) then
        v1 = a1
    else
        v1 = a2
        v2 = ("Appears in %* except: "):format(v3)
    end
    local v4 = {}
    local v5 = nil
    local v6 = nil
    for i, j in v1, v5, v6 do
        table.insert(v4, if j ~= v3 then u0.getRichText(j) else j)
    end
    local v7 = table.concat(v4, ", ")
    if v7 == "" then
        v2 = ""
        v7 = "<font color=\"rgb(255,0,100)\">Exclusive Enemy</font>"
    end
    return (("%*%*"):format(v2, v7))
end

return u0