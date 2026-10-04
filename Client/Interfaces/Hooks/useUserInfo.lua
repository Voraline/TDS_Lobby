-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUserInfo
-- Decompile time: 1.38 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserService = game:GetService("UserService")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1) -- Line: 13 -- upvalues: React (val), Players (val), UserService (val) -- types: a1: number
    local v1, u5 = React.useState({Id = 1, Username = "Loading...", DisplayName = "Loading...", HasVerifiedBadge = true})
    local v2 = {a1}
    React.useEffect(function() -- Line: 21 -- upvalues: Players (upval), a1 (val), u5 (val), UserService (upval)
        local PlayerByUserId = Players:GetPlayerByUserId(a1)
        if PlayerByUserId then
            u5({
                Id = PlayerByUserId.UserId,
                Username = PlayerByUserId.Name,
                DisplayName = PlayerByUserId.DisplayName,
                HasVerifiedBadge = PlayerByUserId.HasVerifiedBadge,
            })
            return
        end
        local success, result = pcall(function() -- Line: 32 -- upvalues: UserService (upval), a1 (upval)
            return UserService:GetUserInfosByUserIdsAsync({a1})
        end)
        if success then
            u5(result[1])
        end
    end, v2)
    return v1
end