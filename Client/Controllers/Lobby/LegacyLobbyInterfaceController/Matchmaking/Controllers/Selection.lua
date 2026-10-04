-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Matchmaking.Controllers.Selection
-- Decompile time: 18.66 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local LocalPlayer = Players.LocalPlayer
local Assets = (game:GetService("ReplicatedStorage")):WaitForChild("Assets")
local Models = (Assets:WaitForChild("Templates")):WaitForChild("Models")
local u60 = {}
for k, v in pairs(Assets:WaitForChild("PlayerCounts"):children()) do
    v1 = tonumber(v.Name)
    u60[v1] = (require(v))
end
local u79 = {}
for k2, i in pairs(Assets:WaitForChild("Modes"):children()) do
    u79[i.Name] = (require(i))
end
local Primary = require(game.ReplicatedStorage.Client.Modules.PlayerGui).Primary
local Background = Primary:WaitForChild("Background")
local Content = (((Primary:WaitForChild("Menu")):WaitForChild("Containers")):WaitForChild("Matchmaking")):WaitForChild("Content")
local Modes = Content:WaitForChild("Modes")
local Display = Content:WaitForChild("Display")
local Template = Content:WaitForChild("Template")
local v2 = {}
v2.__index = v2

function selfie(a1, a2) -- Line: 62
    return function(...) -- Line: 63 -- upvalues: a1 (val), a2 (val)
        a1(a2, ...)
    end
end

function createAndPlay(...) -- Line: 69 -- upvalues: TweenService (val)
    local v1 = TweenService:Create(...)
    v1:Play()
    return v1
end

function filter(a1, a2) -- Line: 76 -- upvalues: table (val)
    local v1 = {}
    for k, v in pairs(a1) do
        if a2(v, k, a1) then
            table.insert(v1, v)
        end
    end
    return v1
end

function contains(a1) -- Line: 87
    return function(a1_2) -- Line: 88 -- upvalues: a1 (val)
        return a1_2:FindFirstChildOfClass(a1)
    end
end

function v2.Initialize(a1) -- Line: 93 -- upvalues: Modes (val), UserInputService (val)
    a1.Index = 0
    a1.Active = false
    a1.Page = Modes:WaitForChild("UIPageLayout")
    a1.Rotate = false
    a1.Runtime = {Options = {}}
    ;(a1.Page:GetPropertyChangedSignal("CurrentPage")):Connect(function() -- Line: 102 -- upvalues: a1 (val)
        local CurrentPage = a1.Page.CurrentPage
        local Options = a1.Runtime.Options
        local v1 = Options[a1.Index]
        if not v1 then
            return
        end
        if CurrentPage ~= v1.ui then
            for k, v in pairs(Options) do
                if v.ui == CurrentPage then
                    a1:Select(k)
                    return
                end
            end
        end
    end)
    UserInputService.PointerAction:Connect(function(a1_2) -- Line: 120 -- upvalues: a1 (val)
        if not a1.Active or a1_2 == 0 then
            return
        end
        if a1_2 > 0 then
            a1:Next()
            return
        end
        a1:Previous()
    end)
    UserInputService.TouchSwipe:Connect(function(a1_2, a2, a3) -- Line: 134 -- upvalues: a1 (val)
        if not a1.Active then
            return
        end
        if a1_2 == Enum.SwipeDirection.Left then
            a1:Next()
            return
        end
        if a1_2 == Enum.SwipeDirection.Right then
            a1:Previous()
        end
    end)
end

function v2:Next() -- Line: 146
    self:SelectOther(self.Index + 1)
end

function v2:Previous() -- Line: 150
    self:SelectOther(self.Index - 1)
end

function v2:SetRendering(a2) -- Line: 155 -- upvalues: RunService (val)
    local Runtime = self.Runtime
    if Runtime.Rendering == a2 then
        return
    end
    if not a2 then
        RunService:UnbindFromRenderStep("SelectionUpdate")
    else
        RunService:BindToRenderStep("SelectionUpdate", 199, (selfie(self.Render, self)))
    end
    Runtime.Rendering = a2
end

function v2:SetRotate(a2) -- Line: 172
    self.Rotate = a2 or a2 == nil
end

function v2.Render(a1, a2) -- Line: 177
    local CFrame_2, Offset, v1, v2
    local Index = a1.Index
    for k, v in pairs(a1.Runtime.Options) do
        v1 = if not (k == Index) then 1 else 0.3
        v2 = v.rot + v3 * v1
        v.rot = v2
        CFrame_2 = v.part.CFrame
        Offset = v.option.Offset
        if Offset then
            CFrame_2 = CFrame_2 * Offset:inverse()
        end
        v.camera.CFrame = CFrame_2 * CFrame.Angles(0, v2, 0) * CFrame.new(0, 0, 7)
    end
end

function v2.MakeOption(a1, a2) -- Line: 193 -- upvalues: Template (val), Modes (val)
    local v1 = Template:Clone()
    v1.Name = "Option"
    v1.Parent = Modes
    v1.Visible = true
    local Viewport = v1:WaitForChild("Viewport")
    local Camera = Instance.new("Camera")
    Camera.Parent = Viewport
    Viewport.CurrentCamera = Camera
    local WorldModel = Instance.new("WorldModel")
    WorldModel.Parent = Viewport
    local v2 = a2.Model:Clone()
    v2.Parent = WorldModel
    local Glow = v1:FindFirstChild("Glow")
    if Glow then
        Glow.Visible = true
        Glow.ImageTransparency = 0
        if a2.GlowColor then
            Glow.ImageColor3 = a2.GlowColor
        end
    end
    local PrimaryPart = v2.PrimaryPart
    local CFrame_2 = PrimaryPart.CFrame
    local Offset = a2.Offset or CFrame.new()
    Camera.CFrame = CFrame_2 * Offset
    local v3 = {
        rot = 0,
        ui = v1,
        camera = Camera,
        viewport = Viewport,
        world = WorldModel,
        model = v2,
        part = PrimaryPart,
        option = a2,
        clicked = a2.Clicked,
    }
    if a2.Mixin then
        a2.Mixin(v3)
    end
    return v3
end

function v2:AddOption(a2) -- Line: 241 -- upvalues: table (val)
    local v1 = self:MakeOption(a2)
    table.insert(self.Runtime.Options, v1)
    v1.ui.MouseButton1Down:Connect((self:Selector(#self.Runtime.Options)))
    if self.Rotate then
        self:SetRendering(true)
    end
end

function v2:DestroyOption(a2) -- Line: 252
    a2.ui:Destroy()
    self:Selected((self:ClampIndex(self.Index)))
end

function v2:Clear() -- Line: 258 -- upvalues: table (val)
    local Options = self.Runtime.Options
    while #Options > 0 do
        self:DestroyOption((table.remove(Options)))
    end
    self:SetRendering(false)
    self.Index = 0
end

function v2:Unselected(a2) -- Line: 268
    if not a2 then
        return
    end
    local v1 = self.Runtime.Options[a2]
    if not v1 then
        return
    end
    local v2 = TweenInfo.new(0.25, Enum.EasingStyle.Quart)
    createAndPlay(v1.ui.Viewport, v2, {Size = UDim2.fromScale(0.8, 0.8)})
    createAndPlay(v1.ui.Glow, v2, {Size = UDim2.fromScale(1, 1)})
end

function v2:ClampIndex(a2) -- Line: 286 -- upvalues: math (val)
    local v1 = #self.Runtime.Options
    if v1 == 0 then
        return 0
    end
    return math.clamp(a2, 1, v1)
end

function v2:Selected(a2) -- Line: 295 -- upvalues: Display (val)
    local Index = self.Index
    self:Unselected(Index)
    self.Index = a2
    local v1 = self.Runtime.Options[a2]
    if not v1 then
        return
    end
    self.Page:JumpTo(v1.ui)
    local option = v1.option
    Display.Title.Text = option.Text or ""
    Display.Desc.Text = option.Desc or ""
    if v1.click then
        v1.click(v1, Index)
    end
    local v2 = TweenInfo.new(0.5, Enum.EasingStyle.Quart)
    createAndPlay(v1.ui.Viewport, v2, {Size = UDim2.fromScale(1.2, 1.2)})
    createAndPlay(v1.ui.Glow, v2, {Size = UDim2.fromScale(1.2, 1.2)})
end

function v2.Selector(a1, a2) -- Line: 323
    return function() -- Line: 324 -- upvalues: a1 (val), a2 (val)
        a1:Select(a2)
    end
end

function v2:SetCallback(a2) -- Line: 330
    self.Callback = a2
end

function v2:Finish(a2) -- Line: 335
    local v1 = self.Runtime.Options[a2]
    if not v1 then
        error("Selection:Finish called without a selection!")
    end
    self:Clear()
    self:Close()
    local Callback = self.Callback
    if Callback then
        self:SetCallback()
        Callback(v1.option)
    end
end

function v2:Select(a2) -- Line: 353
    if self.Index == a2 then
        self:Finish(a2)
        return
    end
    self:Selected((self:ClampIndex(a2)))
end

function v2:SelectOther(a2) -- Line: 362
    local v1 = self:ClampIndex(a2)
    if self.Index == v1 then
        return
    end
    self:Select(v1)
end

function v2:FromTable(a2) -- Line: 371
    self:Clear()
    for k, v in pairs(a2) do
        self:AddOption(v)
    end
    self:Selected(1)
end

function v2.SelectMode(a1, a2) -- Line: 381 -- upvalues: u79 (val), Models (val), table (val), Content (val)
    local v1
    a1:SetCallback(a2)
    local v2 = {}
    for k, v in pairs(u79) do
        v1 = Models:FindFirstChild(k)
        if v1 then
            table.insert(v2, {
                Name = k,
                Offset = v.CFrame,
                Text = v.DisplayName,
                Desc = v.Description,
                Data = v,
                Model = v1,
            })
        end
    end
    a1:SetRotate()
    a1:FromTable(v2)
    a1:Open()
    Content.ModeButtons.Visible = true
end

local u171 = nil
repeat
    pcall(function() -- Line: 405 -- upvalues: Players (val), LocalPlayer (val), u171 (ref), table (val)
        local FriendsAsync = Players:GetFriendsAsync(LocalPlayer.UserId)
        while true do
            u171 = u171 or {}
            for k, v in pairs(FriendsAsync:GetCurrentPage()) do
                table.insert(u171, v.Id)
            end
            if FriendsAsync.IsFinished then
                break
            end
            FriendsAsync:AdvanceToNextPageAsync()
        end
    end)
until u171
local u181 = nil
pcall(function() -- Line: 421 -- upvalues: u181 (ref), Players (val)
    u181 = Players:GetHumanoidDescriptionFromUserId(1)
end)

function pickUserId(a1) -- Line: 425 -- upvalues: LocalPlayer (val), u171 (ref), math (val)
    if a1 == "Scout" then
        return LocalPlayer.UserId
    end
    if #u171 == 0 then
        return 1
    end
    return u171[math.random(1, #u171)]
end

function pickUserDescription(a1) -- Line: 437 -- upvalues: Players (val), u181 (ref)
    local result, success
    repeat
        local u3 = pickUserId(a1)
        success, result = pcall(function() -- Line: 441 -- upvalues: Players (upval), u3 (val)
            return Players:GetHumanoidDescriptionFromUserId(u3)
        end)
    until success
    return result
end

function setupGroupOption(a1) -- Line: 451 -- upvalues: table (val)
    local option = a1.option
    local model = a1.model
    local v1 = {}
    for k, v in pairs((filter(model:GetChildren(), contains("Humanoid")))) do
        local Humanoid = v:WaitForChild("Humanoid")
        local u37 = Humanoid:LoadAnimation((v:WaitForChild("Animation")))
        task.spawn(function() -- Line: 460 -- upvalues: v (val), model (val), Humanoid (val), a1 (val)
            local v1 = pickUserDescription(v.Name)
            if not v1 then
                return
            end
            model.Parent = workspace
            Humanoid:ApplyDescription(v1)
            model.Parent = a1.world
        end)
        ;(u37:GetMarkerReachedSignal("Freeze")):Connect(function() -- Line: 469 -- upvalues: u37 (val)
            u37:AdjustSpeed(0)
        end)
        u37:Play()
        table.insert(v1, u37)
    end
    a1.anims = v1
end

function replayGroupOption(a1) -- Line: 478
    for k, v in pairs(a1.anims) do
        v:Stop(0)
        v:Play()
    end
end

function v2.SelectPlayers(a1, a2) -- Line: 486 -- upvalues: u60 (val), Models (val), table (val)
    local v1
    a1:SetCallback(a2)
    local v2 = {}
    for k, v in pairs(u60) do
        v1 = Models.PlayerCount:FindFirstChild(k)
        if v1 and not v.Disabled then
            table.insert(v2, 1, {
                Name = k,
                Text = v.DisplayName,
                Desc = v.Description,
                Data = v,
                Offset = v.CFrame * CFrame.new(0, 0, 6),
                Model = v1,
                Mixin = setupGroupOption,
                Clicked = replayGroupOption,
            })
        end
    end
    a1:SetRotate(false)
    a1:FromTable(v2)
    a1:Open()
end

function v2:Open() -- Line: 510 -- upvalues: Modes (val), Background (val), Display (val)
    self.Active = true
    Modes.Visible = true
    Background.Visible = true
    Display.Visible = true
end

function v2:Close() -- Line: 518 -- upvalues: Modes (val), Background (val), Display (val), Content (val)
    self.Active = false
    Modes.Visible = false
    Background.Visible = false
    Display.Visible = false
    self:SetRendering(false)
    Content.ModeButtons.Visible = false
end

return v2