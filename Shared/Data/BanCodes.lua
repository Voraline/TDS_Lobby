-- Script path: ReplicatedStorage.Shared.Data.BanCodes
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    [Enum.BanReason.Exploiting] = "You have been banned for exploiting (Code: 501).",
    [Enum.BanReason.Toxicity] = "You have been banned for toxicity (Code: 502).",
    [Enum.BanReason.Scamming] = "You have been banned for scamming (Code: 503).",
    [Enum.BanReason.Abusing] = "You have been banned for abusing a bug (Code: 504).",
    [Enum.BanReason.Other] = "You have been banned for other reasons (Code: 600).",
}