-- Script path: ReplicatedStorage.Shared.Modules.PVPConstants.PVPRanks
-- Decompile time: 1.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(script.Parent.Parent.Enum)
require(ReplicatedStorage.Shared.Types.PVPConstantTypes)
local v1 = {}
v1[Enum.Rank.Unranked] = {Name = "Unranked", Icon = 97617499395750, RankRange = NumberRange.new((-1 / 0), -1)}
v1[Enum.Rank.PrivateI] = {Name = "Private I", Icon = 72595603160930, RankRange = NumberRange.new(0, 199)}
v1[Enum.Rank.PrivateII] = {Name = "Private II", Icon = 72595603160930, RankRange = NumberRange.new(200, 349)}
v1[Enum.Rank.PrivateIII] = {Name = "Private III", Icon = 72595603160930, RankRange = NumberRange.new(350, 499)}
v1[Enum.Rank.SergeantI] = {Name = "Sergeant I", Icon = 74050782647742, RankRange = NumberRange.new(500, 699)}
v1[Enum.Rank.SergeantII] = {Name = "Sergeant II", Icon = 74050782647742, RankRange = NumberRange.new(700, 899)}
v1[Enum.Rank.SergeantIII] = {Name = "Sergeant III", Icon = 74050782647742, RankRange = NumberRange.new(900, 1099)}
v1[Enum.Rank.LieutenantI] = {Name = "Lieutenant I", Icon = 79710891035311, RankRange = NumberRange.new(1100, 1399)}
v1[Enum.Rank.LieutenantII] = {Name = "Lieutenant II", Icon = 79710891035311, RankRange = NumberRange.new(1400, 1599)}
v1[Enum.Rank.LieutenantIII] = {Name = "Lieutenant III", Icon = 79710891035311, RankRange = NumberRange.new(1600, 1799)}
v1[Enum.Rank.MajorI] = {Name = "Major I", Icon = 136521762479365, RankRange = NumberRange.new(1800, 1999)}
v1[Enum.Rank.MajorII] = {Name = "Major II", Icon = 136521762479365, RankRange = NumberRange.new(2000, 2199)}
v1[Enum.Rank.MajorIII] = {Name = "Major III", Icon = 136521762479365, RankRange = NumberRange.new(2200, 2399)}
v1[Enum.Rank.GeneralI] = {Name = "General I", Icon = 103014364943903, RankRange = NumberRange.new(2400, 2699)}
v1[Enum.Rank.GeneralII] = {Name = "General II", Icon = 103014364943903, RankRange = NumberRange.new(2700, 2999)}
v1[Enum.Rank.GeneralIII] = {Name = "General III", Icon = 103014364943903, RankRange = NumberRange.new(3000, (1 / 0))}
return v1