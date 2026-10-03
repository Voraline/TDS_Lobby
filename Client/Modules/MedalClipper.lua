-- Script path: ReplicatedStorage.Client.Modules.MedalClipper
-- Decompile time: 1.59 ms

local HttpService = game:GetService("HttpService")

local function base64Encode(a1) -- Line: 9 -- types: a1: string
    local v1, v2, v3, v4, v5, v6, v7
    local v8 = {}
    local v9 = #a1
    local v10 = 1
    while v10 <= v9 do
        v3 = a1:byte(v10) or 0
        v4 = a1:byte(v10 + 1) or 0
        v5 = a1:byte(v10 + 2)
        v5 = v3 * 65536 + v4 * 256 + (v5 or 0)
        v6 = math.floor(v5 / 262144) % 64 + 1
        v7 = math.floor(v5 / 4096) % 64 + 1
        v1 = math.floor(v5 / 64) % 64 + 1
        v2 = v5 % 64 + 1
        v8[#v8 + 1] = (("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v6, v6))
        v8[#v8 + 1] = (("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v7, v7))
        if v9 < v10 + 1 then
            v8[#v8 + 1] = "=="
            break
        end
        if v9 < v10 + 2 then
            v8[#v8 + 1] = (("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v1, v1)) .. "="
            break
        end
        v8[#v8 + 1] = (("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v1, v1)) .. ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"):sub(v2, v2)
        v10 = v10 + 3
    end
    return table.concat(v8)
end

return {
    TriggerClip = function(a1, a2, a3, a4) -- Line: 46
        -- upvalues: base64Encode (val), HttpService (val)
        local v1 = a4 or {}
        local v2 = {
            eventId = a2,
            eventName = a3,
            triggerActions = {"SaveClip"},
            clipOptions = {duration = v1.duration or 30, captureDelayMs = v1.captureDelayMs},
        }
        if v1.contextTags and next(v1.contextTags) then
            v2.contextTags = v1.contextTags
        end
        local v3 = {gameEvent = v2, universeId = game.GameId}
        print("[_MAPIEvent][v1/event/invoke]", base64Encode(HttpService:JSONEncode(v3)))
    end,
}