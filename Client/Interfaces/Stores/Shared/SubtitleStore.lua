-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.SubtitleStore
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u17, u18 = (require(ReplicatedStorage.Packages.Charm)).signal({
    speaker = "",
    text = "",
    lifetime = 0,
    visible = false,
    speakerColor = Color3.fromRGB(255, 255, 255),
})
local v1 = {getState = u17}

local function setStateKey(a1, a2) -- Line: 29 -- upvalues: u17 (val), u18 (val) -- types: a1: string
    local v1 = u17()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u18(v2)
end

function v1.setSpeaker(a1) -- Line: 40 -- upvalues: u17 (val), u18 (val) -- types: a1: string
    local v1 = u17()
    if v1.speaker == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.speaker = a1
    u18(v2)
end

function v1.setText(a1) -- Line: 44 -- upvalues: u17 (val), u18 (val) -- types: a1: string
    local v1 = u17()
    if v1.text == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.text = a1
    u18(v2)
end

function v1.setSpeakerColor(a1) -- Line: 48 -- upvalues: u17 (val), u18 (val) -- types: a1: userdata
    local v1 = u17()
    if v1.speakerColor == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.speakerColor = a1
    u18(v2)
end

function v1.setLifetime(a1) -- Line: 52 -- upvalues: u17 (val), u18 (val) -- types: a1: number
    local v1 = u17()
    if v1.lifetime == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.lifetime = a1
    u18(v2)
end

function v1.setVisible(a1) -- Line: 56 -- upvalues: u17 (val), u18 (val) -- types: a1: boolean
    local v1 = u17()
    if v1.visible == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.visible = a1
    u18(v2)
end

function v1.setDelay(a1) -- Line: 60 -- upvalues: u17 (val), u18 (val) -- types: a1: number?
    local v1 = u17()
    if v1.delay == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.delay = a1
    u18(v2)
end

return v1