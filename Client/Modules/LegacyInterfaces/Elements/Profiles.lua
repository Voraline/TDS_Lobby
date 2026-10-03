-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Profiles
-- Decompile time: 5.57 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("UserInputService")
local PlayerListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local Shared = (require(game.ReplicatedStorage.Client.Modules.PlayerGui)).Shared
local Profiles = Network.Channel("Profiles")
local Mouse = Players.LocalPlayer:GetMouse()
local u73 = {}
local u74 = false
local Profile = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Templates"):WaitForChild("Cards"):WaitForChild("Profile")
local u92 = Maid.new()
local u107 = Create("Highlight", {
    Name = "PlayerSelect",
    OutlineTransparency = 0,
    FillTransparency = 1,
    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
    FillColor = Color3.new(1, 1, 1),
    OutlineColor = Color3.new(1, 1, 1),
    Parent = Shared,
})

local function _createInterface() -- Line: 46 -- upvalues: Profile (val)
    local v1 = Profile:Clone()
    local Main = v1:WaitForChild("Main")
    return v1, {
        Main = Main,
        Stats = Main:WaitForChild("Stats"),
        Troops = Main:WaitForChild("Troops"),
        Rank = Main:WaitForChild("RankIcon"),
        Player = Main:WaitForChild("PlayerIcon"),
        Level = Main:WaitForChild("Level"),
        Title = Main:WaitForChild("Title"),
        Loading = Main:WaitForChild("Loading"),
    }
end

local function _sineTween(a1) -- Line: 79 -- upvalues: RunService (val) -- types: a1: userdata
    while a1.Parent do
        a1.FillTransparency = (math.cos(14 * (tick()) / 2) + 0.5) * 0.5 + 0.5
        RunService.RenderStepped:Wait()
    end
end

local function isMobile() -- Line: 91
    return workspace.CurrentCamera.ViewportSize.X < 1024
end

function u73.Enable(a1) -- Line: 95
    -- upvalues: u74 (ref), PlayerListStore (val), _createInterface (val), u92 (val), Create (val), _sineTween (val)
    -- upvalues: Signal (val), Profiles (val), Asset (val)
    local Character = a1.Character
    if not (workspace.CurrentCamera.ViewportSize.X < 1024) then
        u74 = true
        PlayerListStore.selectProfile(a1.UserId)
        return
    end
    if Character then
        local v1, u19 = _createInterface()
        u92:Mark(v1)
        u19.Title.Text = a1.Name
        u19.Player.Image = "rbxthumb://type=AvatarHeadShot&id=" .. a1.UserId .. "&w=150&h=150"
        v1.Parent = Character:WaitForChild("HumanoidRootPart")
        local u50 = Create("Highlight", {
            Name = "ProfileHighlight",
            OutlineTransparency = 0,
            FillTransparency = 0.4,
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
            FillColor = Color3.new(1, 1, 1),
            OutlineColor = Color3.new(1, 1, 1),
            Parent = Character,
        })
        task.spawn(_sineTween, u50)
        local v2 = Signal.new()
        coroutine.wrap(function(a1_2) -- Line: 137 -- upvalues: Profiles (upval), a1 (val)
            local v1 = Profiles:InvokeServer("Download", a1)
            if v1 then
                return a1_2:Fire(v1)
            end
        end)(v2)
        u92:Mark((v2:Connect(function(a1) -- Line: 150 -- upvalues: u19 (val), Asset (upval)
            if a1 then
                local Icon = a1.Icon
                local Values = a1.Values
                local Troops = a1.Troops
                if Icon and Values and Troops then
                    local ImageLabel, Stats, TextLabel, v1
                    u19.Main.Image = "rbxassetid://" .. Icon
                    u19.Level.Text = "Lv. " .. Values.Level

                    local function _updateStatus(a1) -- Line: 166 -- upvalues: Values (val), u19 (upval)
                        local v1 = Values[a1]
                        local v2 = u19.Stats:WaitForChild(a1)
                        if v1 and v2 then
                            local Amount = v2:WaitForChild("Amount")
                            if Amount then
                                Amount.Text = v1
                            end
                        end
                    end

                    local function _updateTroop(a1, a2) -- Line: 184 -- upvalues: Asset (upval), u19 (upval)
                        local Stats = (Asset("Troops", a2)).Stats
                        local v1 = u19.Troops:WaitForChild(a1)
                        local TextLabel = v1:WaitForChild("TextLabel")
                        local ImageLabel = v1:WaitForChild("ImageLabel")
                        TextLabel.Text = a2
                        ImageLabel.Image = "rbxassetid://" .. (Stats.Icon or 0)
                        return true
                    end

                    for k, v in pairs(Troops) do
                        Stats = (Asset("Troops", v)).Stats
                        v1 = u19.Troops:WaitForChild(k)
                        TextLabel = v1:WaitForChild("TextLabel")
                        ImageLabel = v1:WaitForChild("ImageLabel")
                        TextLabel.Text = v
                        ImageLabel.Image = "rbxassetid://" .. (Stats.Icon or 0)
                    end
                    local Wins = Values.Wins
                    local Wins_2 = u19.Stats:WaitForChild("Wins")
                    if Wins and Wins_2 then
                        local Amount = Wins_2:WaitForChild("Amount")
                        if Amount then
                            Amount.Text = Wins
                        end
                    end
                    local Loses = Values.Loses
                    local Loses_2 = u19.Stats:WaitForChild("Loses")
                    if Loses and Loses_2 then
                        local Amount_2 = Loses_2:WaitForChild("Amount")
                        if Amount_2 then
                            Amount_2.Text = Loses
                        end
                    end
                    local Triumphs = Values.Triumphs
                    local Triumphs_2 = u19.Stats:WaitForChild("Triumphs")
                    if Triumphs and Triumphs_2 then
                        local Amount_3 = Triumphs_2:WaitForChild("Amount")
                        if Amount_3 then
                            Amount_3.Text = Triumphs
                        end
                    end
                    u19.Loading:Destroy()
                end
            end
        end)))
        u92:Mark(function() -- Line: 223 -- upvalues: u50 (val)
            if u50.Parent then
                u50:Destroy()
            end
        end)
        u74 = true
    end
    return true
end

function u73.Disable() -- Line: 236 -- upvalues: u92 (val), u74 (ref), PlayerListStore (val)
    u92:Sweep()
    if not u74 then
        return false
    end
    u74 = false
    PlayerListStore.selectProfile(nil)
    return true
end

local u114 = Signal.new()
u73.stopSignal = u114
u114:Connect(function() -- Line: 252 -- upvalues: u73 (val)
    u73.Disable()
end)

function u73.ShouldShow() -- Line: 256 -- upvalues: GameType (val)
    if GameType:IsA("Game") and workspace:GetAttribute("Map") == nil then
        return true
    end
    return GameType:IsA("Lobby")
end

if GameType:IsA("Game") and u73.ShouldShow() then
    (workspace:GetAttributeChangedSignal("Map")):Once(function() -- Line: 266 -- upvalues: u114 (val)
        u114:Fire()
    end)
end
if u73.ShouldShow() then
    local u138 = nil
    local u139 = nil
    local u147 = Mouse.Move:Connect(function() -- Line: 273 -- upvalues: Mouse (val), u138 (ref), Players (val), u139 (ref), u107 (val)
        local Target = Mouse.Target
        if Target == u138 then
            return
        end
        local v1 = Target and Target:FindFirstAncestorOfClass("Model")
        local v2 = v1 and Players:GetPlayerFromCharacter(v1) and v1
        if u139 ~= v2 then
            u139 = v1
            u107.Adornee = v2
        end
        u138 = Target
    end)
    u114:Connect(function() -- Line: 291 -- upvalues: u147 (val), u107 (val)
        u147:Disconnect()
        u107.Adornee = nil
    end)
end
return u73