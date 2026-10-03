-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Matchmaking.Views.Matchmaking
-- Decompile time: 0.49 ms

local Controllers = script.Parent.Parent.Parent.Controllers
local KickPlayers = require(script.Parent.KickPlayers)
local MatchmakingController = require(Controllers.MatchmakingController)
local ModeSelection = require(script.Parent.ModeSelection)
local ViewController = require(Controllers.ViewController)
return function(a1) -- Line: 9
    -- upvalues: ViewController (val), MatchmakingController (val), KickPlayers (val), ModeSelection (val)
    ViewController:init()
    MatchmakingController:init()
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.fromScale(1, 1)
    KickPlayers({}).Parent = Frame
    local v1 = ModeSelection
    local v2 = {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5)}
    v1(v2).Parent = Frame
    return Frame
end