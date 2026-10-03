-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useGamepass
-- Decompile time: 2.16 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState
local u22 = {}
local u23 = {}

local function onGamepassPurchase(a1, a2) -- Line: 12
    -- upvalues: u23 (val), u22 (val), MarketplaceService (val), Players (val)
    local v1 = u23[a1] ~= nil
    local u9 = u23[a1]
    if not u9 then
        u9 = {}
    end
    table.insert(u9, a2)

    local function v2() -- Line: 17 -- upvalues: u23 (upval), a1 (val), a2 (val), u9 (val)
        if not u23[a1] then
            return
        end
        local v1 = table.find(u23[a1], a2)
        if v1 then
            table.remove(u9, v1)
        end
    end

    if v1 then
        return v2
    end
    u23[a1] = u9
    local u22_2 = nil

    local function resolve() -- Line: 36 -- upvalues: u22_2 (ref), u22 (upval), a1 (val), u23 (upval), u9 (val)
        if u22_2 then
            u22_2:Disconnect()
            u22_2 = nil
        end
        u22[a1] = true
        u23[a1] = nil
        for i, v in ipairs(u9) do
            v()
        end
    end

    u22_2 = MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(a1_2, a2, a3) -- Line: 51
        -- upvalues: Players (upval), a1 (val), u22_2 (ref), u22 (upval), u23 (upval), u9 (val)
        if a1_2 == Players.LocalPlayer and a2 == a1 and a3 then
            if u22_2 then
                u22_2:Disconnect()
                u22_2 = nil
            end
            u22[a1] = true
            u23[a1] = nil
            for i, v in ipairs(u9) do
                v()
            end
            return
        end
    end)
    task.spawn(function() -- Line: 60
        -- upvalues: MarketplaceService (upval), Players (upval), a1 (val), u22_2 (ref), u22 (upval), u23 (upval)
        -- upvalues: u9 (val)
        local success, result = pcall(function() -- Line: 61 -- upvalues: MarketplaceService (upval), Players (upval), a1 (upval)
            local v1 = a1
            return MarketplaceService:UserOwnsGamePassAsync(Players.LocalPlayer.UserId, v1)
        end)
        if success and result then
            if u22_2 then
                u22_2:Disconnect()
                u22_2 = nil
            end
            u22[a1] = true
            u23[a1] = nil
            for i, v in ipairs(u9) do
                v()
            end
        end
    end)
    return v2
end

return function(a1) -- Line: 73
    -- upvalues: useState (val), u22 (val), useEffect (val), onGamepassPurchase (val), MarketplaceService (val)
    -- upvalues: Players (val)
    assert(type(a1) == "number", "gamepassId must be a number")
    local v1, u15 = useState(u22[a1])
    local v2 = {a1}
    useEffect(function() -- Line: 78 -- upvalues: u22 (upval), a1 (val), u15 (val), onGamepassPurchase (upval)
        if not u22[a1] then
            return (onGamepassPurchase(a1, function() -- Line: 85 -- upvalues: u15 (upval)
                u15(true)
            end))
        end
        u15(u22[a1])
    end, v2)
    return v1 == true, function() -- Line: 91 -- upvalues: MarketplaceService (upval), Players (upval), a1 (val)
        MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, a1)
    end
end