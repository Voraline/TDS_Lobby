-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Matchmaking.Controllers.MatchInfo
-- Decompile time: 18.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local PlayerGui = require(game.ReplicatedStorage.Client.Modules.PlayerGui)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local LocalPlayer = Players.LocalPlayer
local Primary = PlayerGui.Primary
local Assets = (game:GetService("ReplicatedStorage")):WaitForChild("Assets")
local Content = (((Primary:WaitForChild("Menu")):WaitForChild("Containers")):WaitForChild("Matchmaking")):WaitForChild("Content")
local GameInfo = Content:WaitForChild("GameInfo")
local v1 = {}
v1.__index = v1
local floor = math.floor
local spawn = task.spawn
local wait = task.wait
local insert = table.insert
local remove = table.remove
local sort = table.sort

function indexOf(a1, a2) -- Line: 62
    for k, v in pairs(a1) do
        if v == a2 then
            return k
        end
    end
end

function iteratee(a1) -- Line: 70
    local v1 = type(a1)
    if v1 == "function" then
        return a1
    end
    if v1 == "table" then
        return function(a1_2) -- Line: 75 -- upvalues: a1 (val)
            for k, v in pairs(a1) do
                if v ~= a1_2[k] then
                    return false
                end
            end
            return true
        end
    end
    if v1 == "string" then
        return function(a1_2) -- Line: 85 -- upvalues: a1 (val)
            return a1_2[a1]
        end
    end
    error("invalid type to iterate")
end

function safe(a1) -- Line: 93 -- upvalues: remove (val)
    return function() -- Line: 94 -- upvalues: a1 (val), remove (upval)
        local v1 = {pcall(a1)}
        if remove(v1, 1) then
            return unpack(v1)
        end
    end
end

function find(a1, a2) -- Line: 103
    local v1 = iteratee(a2)
    for k, v in pairs(a1) do
        if v1(v, k, a1) then
            return v
        end
    end
end

function default(a1, a2) -- Line: 113
    if a1 == nil then
        return a2
    end
    return a1
end

function v1.Initialize(a1) -- Line: 121
    a1.Players = {}
    a1.Status = nil
    a1.MatchInfo = nil
    a1.Matching = nil
    a1.Runtime = {Rendering = false, Minimized = false, Cards = {}}
end

function v1:Minimize(a2) -- Line: 135 -- upvalues: Content (val)
    local v1 = default(a2, true)
    local Runtime = self.Runtime
    if Runtime.Minimized == v1 then
        return
    end
    Runtime.Minimized = v1
    Content.Match.Visible = not v1
    if not v1 then
        self:Update()
    end
end

function v1.Maximize(a1) -- Line: 149
    a1:Minimize(false)
end

function v1:Open() -- Line: 153 -- upvalues: Content (val), GameInfo (val)
    Content.Match.Visible = not self.Runtime.Minimized
    GameInfo.Visible = true
end

function v1.Close(a1) -- Line: 158 -- upvalues: Content (val), GameInfo (val)
    Content.Match.Visible = false
    GameInfo.Visible = false
    a1:SetRendering(false)
end

function v1:SetRendering(a2) -- Line: 165 -- upvalues: RunService (val)
    local Runtime = self.Runtime
    if Runtime.Rendering == a2 then
        return
    end
    if not a2 then
        RunService:UnbindFromRenderStep("MatchInfoUpdate")
    else
        RunService:BindToRenderStep("MatchInfoUpdate", 299, function() -- Line: 175 -- upvalues: self (val)
            self:Render()
        end)
    end
    Runtime.Rendering = a2
end

function getLevel(a1) -- Line: 186
    return a1.Level
end

function getTowers(a1) -- Line: 191
    return a1.Towers
end

function getStats(a1) -- Line: 196
    return a1.Stats
end

function isInParty(a1) -- Line: 200
    return a1.Party
end

function getCustomBackground(a1) -- Line: 204
    return a1.Background
end

local Template = Content.Match.Template

function createCard() -- Line: 211 -- upvalues: Template (val)
    local v1 = Template:Clone()
    v1.Name = "Card"
    return v1
end

function getTroopIcon(a1) -- Line: 218 -- upvalues: Asset (val)
    local v1 = Asset("Troops", a1)
    if not v1 then
        return
    end
    return v1.Stats.Icon
end

function setTower(a1, a2) -- Line: 227
    a1.ImageLabel.Visible = false
    if a2 then
        local v1 = getTroopIcon(a2)
        a1.ImageLabel.Image = "rbxassetid://" .. v1
        a1.ImageLabel.Visible = true
    end
end

local Children = ((Assets:WaitForChild("Templates")):WaitForChild("Models")):WaitForChild("PlayerRigs"):GetChildren()

function pickRandomRig() -- Line: 239 -- upvalues: Children (val), math (val)
    local v1 = #Children
    if v1 == 1 then
        return Children[1]
    end
    return Children[math.random(1, v1)]
end

function v1.ApplyCard(a1, a2, a3, a4) -- Line: 247 -- upvalues: Comma (val), Players (val), math (val), Content (val)
    local v1
    local ui = a3.ui
    ui.Title.Text = ("%s'S TOWERS"):format((a2.Name:upper()))
    ui.Level.Text = ("Lv. %s"):format((Comma((getLevel(a2)))))
    ui.LayoutOrder = a4 or 1
    local v2 = getTowers(a2)
    for i = 1, 6 do
        v1 = ui.Towers:findFirstChild(i)
        if v1 then
            setTower(v1, v2[i])
        end
    end
    local v3 = getStats(a2) or {}
    local Stats = ui.Stats
    Stats.Loss.TextLabel.Text = Comma(v3.Losses or 0)
    Stats.Wins.TextLabel.Text = Comma(v3.Wins or 0)
    Stats.Triumphs.TextLabel.Text = Comma(v3.Triumphs or 0)
    task.spawn(safe(function() -- Line: 271 -- upvalues: Players (upval), a2 (val), ui (val), a3 (val), math (upval)
        local UserIdFromNameAsync = Players:GetUserIdFromNameAsync(a2.Name)
        if NO_VIEWPORT then
            local UserThumbnailAsync = Players:GetUserThumbnailAsync(UserIdFromNameAsync, "HeadShot", "Size150x150")
            ui.Player.Image = UserThumbnailAsync
            return
        end
        if a3.playerModel then
            return
        end
        a3.playerModel = true
        local v1 = pickRandomRig():Clone()
        local Humanoid = v1:WaitForChild("Humanoid")
        local HumanoidDescriptionFromUserId = Players:GetHumanoidDescriptionFromUserId(UserIdFromNameAsync)
        v1.Parent = workspace
        Humanoid:ApplyDescription(HumanoidDescriptionFromUserId)
        local Camera = Instance.new("Camera")
        Camera.Parent = v1
        Camera.CFrame = Humanoid.RootPart.CFrame * ((CFrame.new(-3, 1, -4)) * CFrame.Angles(0, math.pi + math.rad(15), 0))
        local Icon = ui:WaitForChild("Icon")
        Icon.CurrentCamera = Camera
        local WorldModel = Instance.new("WorldModel")
        WorldModel.Parent = Icon
        v1.Parent = WorldModel
        local u77 = Humanoid:LoadAnimation((v1:WaitForChild("Animation")))
        ;(u77:GetMarkerReachedSignal("Freeze")):Connect(function() -- Line: 301 -- upvalues: u77 (val)
            u77:AdjustSpeed(0)
        end)
        u77:Play()
        a3.playerModel = v1
    end))
    if not isInParty(a2) then
        ui.UIStroke.Color = Color3.new(1, 1, 1)
    else
        ui.UIStroke.Color = Color3.fromRGB(37, 161, 255)
    end
    v1 = getCustomBackground(a2)
    if v1 then
        ui.Image = "rbxassetid://" .. v1
    end
    ui.Visible = true
    ui.Parent = Content.Match
end

function createAndPlay(...) -- Line: 329 -- upvalues: TweenService (val)
    local v1 = TweenService:Create(...)
    v1:Play()
    return v1
end

function v1.DestroyCard(a1, a2) -- Line: 335
    a2.ui:Destroy()
end

function v1:Update() -- Line: 340 -- upvalues: GameInfo (val)
    local v1
    local Runtime = self.Runtime
    local Status = self.Status
    if Status then
        GameInfo.Status.Text = Status.Status
        GameInfo.Image = "rbxassetid://" .. (Status.Image or "7207459146")
        GameInfo.Icon.Image = "rbxassetid://" .. (Status.Icon or "7095709088")
        if Runtime.MatchProgress ~= Status.Progress then
            Runtime.MatchProgress = Status.Progress
            local v2 = UDim2.fromScale(Status.Progress, 1)
            local v3 = TweenInfo.new(0.25, Enum.EasingStyle.Quart)
            createAndPlay(GameInfo.Progress.Bar, v3, {Size = v2})
        end
    end
    local MatchInfo = self.MatchInfo
    if MatchInfo then
        local v4 = ("%s (%d/%d)"):format(MatchInfo.Mode, #self.Players, MatchInfo.MaxPlayers)
        GameInfo.Gamemode.Text = v4
    end
    if Runtime.Minimized then
        return
    end
    for k, v in pairs(self.Players) do
        v1 = Runtime.Cards[v.Name]
        if not v1 then
            v1 = {ui = createCard()}
            Runtime.Cards[v.Name] = v1
        end
        v5:ApplyCard(v, v1, k)
    end
    for k2, i in pairs(Runtime.Cards) do
        if not find(v5.Players, {Name = k2}) then
            v5:DestroyCard(i)
            Runtime.Cards[k2] = nil
        end
    end
end

function wide(a1, a2) -- Line: 392
    str = tostring(a1)
    local v1 = #str
    local v2 = a2 - 1
    for i = v1, v2 do
        if not (a1 < 10 ^ i) then
            str = str .. "0"
        else
            str = "0" .. str
        end
    end
    return str
end

function formatTime(a1) -- Line: 405 -- upvalues: floor (val)
    return (wide(floor(a1 / 60), 1)) .. ":" .. wide(a1 % 60, 2)
end

function v1:Render() -- Line: 410 -- upvalues: floor (val), GameInfo (val)
    local Runtime = self.Runtime
    if not self.Matching then
        GameInfo.ElapsedTime.Text = ""
        return
    end
    local v1 = floor(tick() - self.Matching)
    if Runtime.elapsed == v1 then
        return
    end
    Runtime.elapsed = v1
    GameInfo.ElapsedTime.Text = formatTime(v1)
end

function v1:SortPlayers() -- Line: 424 -- upvalues: sort (val), LocalPlayer (val)
    sort(self.Players, function(a1, a2) -- Line: 425 -- upvalues: LocalPlayer (upval)
        if a1.Party and a2.Party then
            return a1.Name == a1.Party.Leader
        end
        if a1.Name ~= LocalPlayer.Name and a2.Name ~= LocalPlayer.Name then
            if a1.InParty and not a2.InParty then
                return true
            end
            if a1.Type == "local" and a2.Type == "remote" then
                return true
            end
            return a1.Name < a2.Name
        end
        return a1.Name == LocalPlayer.Name
    end)
    self:Update()
end

function v1.SetPlayers(a1, a2) -- Line: 449
    a1.Players = a2 or {}
    a1:SortPlayers()
end

function v1:AddPlayer(a2, a3) -- Line: 456 -- upvalues: insert (val)
    if indexOf(self.Players, a2) then
        return
    end
    local Type = a2.Type or a3 or "local"
    a2.Type = Type
    insert(self.Players, a2)
    self:SortPlayers()
end

function v1:DropPlayer(a2) -- Line: 466 -- upvalues: remove (val)
    local v1 = find(self.Players, {Name = a2})
    if not v1 then
        return false
    end
    remove(self.Players, (indexOf(self.Players, v1)))
    self:Update()
    return true
end

function v1.DropRemotePlayers(a1) -- Line: 478
    for k, v in pairs(a1.Players) do
        if v.Type == "remote" then
            a1:DropPlayer(v.Name)
        end
    end
end

function v1.UpdatePlayer(a1, a2) -- Line: 486
    a1:DropPlayer(a2.Name)
    a1:AddPlayer(a2)
end

function v1.SetStatus(a1, a2) -- Line: 493
    a1.Status = a2
    a1:Update()
end

function v1.SetInfo(a1, a2) -- Line: 499
    a1.MatchInfo = a2
    a1:Update()
end

function v1.StartMatching(a1, a2) -- Line: 505
    a1.Matching = a2 or tick()
    a1:Update()
    a1:Open()
    a1:SetRendering(true)
end

function v1.StopMatching(a1) -- Line: 513
    a1.Matching = nil
    a1:Update()
    a1:SetRendering(false)
end

function v1.IsMatching(a1) -- Line: 520
    return a1.Matching ~= nil
end

return v1