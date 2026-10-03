-- Script path: ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.SkillTree.HexTree.HexTile
-- Decompile time: 11.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Assets = ReplicatedStorage.Assets
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local FastSignal = require(ReplicatedStorage.Shared.Modules.FastSignal)
local HexCoordinate = require(script.HexCoordinate)
local HexTileInfo = require(ReplicatedStorage.Client.Interfaces.Game.Components.HexTileInfo)
local Promise = require(ReplicatedStorage.Packages.Promise)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local BhristtSpring = require(ReplicatedStorage.Shared.Modules.BhristtSpring)
local WorldCursor = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.WorldCursor)
local atom = Charm.atom
local subscribe = Charm.subscribe
local untracked = Charm.untracked
local Hexagon = Assets.Effects.Client.Hexagon
local u80 = {}
u80.__index = u80
u80.__class = "HexTile"
local u86 = Color3.fromRGB(70, 70, 70)
local u91 = Color3.fromRGB(35, 35, 35)
local u96 = Color3.fromRGB(150, 150, 150)
local u101 = Color3.fromRGB(200, 200, 200)
local u106 = Color3.fromRGB(255, 246, 127)
local u107 = {
    [Enum.SkillTreeCategory.Offense] = "rbxassetid://130451134553128",
    [Enum.SkillTreeCategory.Defense] = "rbxassetid://99378605710102",
    [Enum.SkillTreeCategory.Strategy] = "rbxassetid://71617560524485",
    [Enum.SkillTreeCategory.Economy] = "rbxassetid://108342143613858",
    [-1] = "rbxassetid://140238974525975",
}

function u80.new(a1, a2, a3, a4, a5, a6) -- Line: 104
    -- upvalues: HexCoordinate (val), Skills (val), Hexagon (val), atom (val), Enum (val), FastSignal (val), u96 (val)
    -- upvalues: BhristtSpring (val), u80 (val)
    local v1 = HexCoordinate.new(a2, a3)
    local v2 = a6 or Skills.nodes[a5] or {}
    local v3 = {
        _tiltAxis = Vector3.new(0, 0, 0),
        Coordinate = v1,
        Index = a1,
        Mesh = Hexagon:Clone(),
        SkillEnum = a5,
        SkillData = v2,
        Atoms = {
            Visible = atom(false),
            IsHovering = atom(false),
            IsAnimating = atom(false),
            IsHeldDown = atom(false),
            IsLocked = atom(false),
            IsRoot = atom(a4),
            IsSelected = atom(false),
            IsMaxedOut = atom(false),
            TileState = atom(Enum.SkillTileState.Locked),
            Level = atom(0),
            Price = atom(0),
            SkillCap = atom(0),
            SelectionCount = atom(0),
            LevelsNeeded = atom(0),
            SkillPointCost = atom(0),
            SkillPriceNumber = atom(0),
        },
        Promises = {},
        Events = {PlayUnlockAnimation = FastSignal.new()},
        Constants = {BasePosition = v1:ToWorldPosition_PointyTopped()},
        VisualData = {TileColor = u96},
        TiltSpring = BhristtSpring.fromFrequency(1, 5, 1, 0, 0, 0),
        BounceSpring = BhristtSpring.fromFrequency(1, 50, 1, 0, 0, 0),
    }
    local v4 = setmetatable(v3, u80)
    v4:_initializeVisuals()
    v4:_initializeSubscriptions()
    return v4
end

function u80.Render(a1, a2) -- Line: 160 -- types: a1: table, a2: number
    local Offset = a1.TiltSpring.Offset
    local Offset_2 = a1.BounceSpring.Offset
    local v1 = CFrame.fromAxisAngle(a1._tiltAxis or Vector3.new(1, 0, 0), (math.rad(Offset)))
    local v2 = Vector3.new(0, Offset_2, 0)
    a1.Mesh.CFrame = CFrame.new(a1.Constants.BasePosition + v2) * v1
end

function u80.SetSkillPointCost(a1, a2) -- Line: 172 -- types: a1: table, a2: number
    if a2 < 0 then
        return
    end
    a1.Atoms.SkillPointCost(a2)
end

function u80.SetSkillPriceNumber(a1, a2) -- Line: 182 -- types: a1: table, a2: number
    if a2 < 0 then
        return
    end
    a1.Atoms.SkillPriceNumber(a2)
end

function u80.SetLevelsNeeded(a1, a2) -- Line: 192 -- types: a1: table, a2: number
    if a2 < 0 then
        return
    end
    a1.Atoms.LevelsNeeded(a2)
end

function u80.Select(a1) -- Line: 202 -- upvalues: untracked (val)
    local v1 = untracked(a1.Atoms.SelectionCount) + 1
    a1.Atoms.SelectionCount(v1)
    local v2 = false
    if v1 == 1 then
        a1:SetSelected(true)
        return v2
    end
    if v1 >= 2 then
        a1:SetSelected(false)
        a1.Atoms.SelectionCount(0)
        v2 = true
    end
    return v2
end

function u80.SetState(a1, a2) -- Line: 222
    a1.Atoms.TileState(a2)
end

function u80.SetLevel(a1, a2) -- Line: 228 -- types: a1: table, a2: number
    if a2 < 0 then
        return
    end
    a1.Atoms.Level(a2)
end

function u80.SetPrice(a1, a2) -- Line: 238 -- types: a1: table, a2: number
    if a2 < 0 then
        return
    end
    a1.Atoms.Price(a2)
end

function u80.SetSkillcap(a1, a2) -- Line: 248 -- types: a1: table, a2: number
    if a2 < 0 then
        return
    end
    a1.Atoms.SkillCap(a2)
end

function u80.SetHovering(a1, a2) -- Line: 258 -- upvalues: untracked (val), Enum (val) -- types: a1: table, a2: boolean
    if not untracked(a1.Atoms.Visible) then
        return
    end
    if (untracked(a1.Atoms.TileState)) == Enum.SkillTileState.Locked and a1.SkillData.mode ~= "Research" then
        return
    end
    a1.Atoms.IsHovering(a2)
end

function u80.SetHeldDown(a1, a2) -- Line: 274 -- upvalues: untracked (val), Enum (val) -- types: a1: table, a2: boolean
    if not untracked(a1.Atoms.Visible) then
        return
    end
    if (untracked(a1.Atoms.TileState)) == Enum.SkillTileState.Locked and a1.SkillData.mode ~= "Research" then
        return
    end
    a1.Atoms.IsHeldDown(a2)
end

function u80.PlayUnlockAnimation(a1, a2) -- Line: 290 -- upvalues: untracked (val) -- types: a1: table, a2: boolean?
    if not a2 and untracked(a1.Atoms.IsLocked) then
        return
    end
    a1.Events.PlayUnlockAnimation:Fire()
end

function u80:SetSelected(a2) -- Line: 300 -- upvalues: untracked (val) -- types: self: table, a2: boolean
    if not untracked(self.Atoms.Visible) then
        return
    end
    self.Atoms.IsSelected(a2)
end

function u80:SetAnimating(a2) -- Line: 310 -- upvalues: untracked (val) -- types: self: table, a2: boolean
    if not untracked(self.Atoms.Visible) then
        return
    end
    self.Atoms.IsAnimating(a2)
end

function u80.IsHeldDown(a1) -- Line: 320 -- upvalues: untracked (val)
    return untracked(a1.Atoms.IsHeldDown)
end

function u80.IsHovering(a1) -- Line: 326 -- upvalues: untracked (val)
    return untracked(a1.Atoms.IsHovering)
end

function u80:IsVisible() -- Line: 332 -- upvalues: untracked (val)
    return untracked(self.Atoms.Visible)
end

function u80:_initializeVisuals() -- Line: 338
    -- upvalues: u96 (val), WorldCursor (val), ReactRoblox (val), React (val), HexTileInfo (val), u107 (val)
    self.Mesh.Position = self.Coordinate:ToWorldPosition_PointyTopped()
    self.Mesh.Parent = workspace
    self.Mesh.Color = u96
    self.Mesh.Size = Vector3.new(0, 0, 0)
    self.Mesh.Name = tostring(self.SkillEnum)
    WorldCursor:AddWorldObject(self.Mesh)
    local SurfaceGui = Instance.new("SurfaceGui")
    SurfaceGui.Name = "TileSurfaceGui"
    SurfaceGui.Face = Enum.NormalId.Top
    SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize
    SurfaceGui.CanvasSize = Vector2.new(1000, 860)
    SurfaceGui.Adornee = self.Mesh
    SurfaceGui.AlwaysOnTop = false
    SurfaceGui.LightInfluence = 0
    SurfaceGui.ResetOnSpawn = false
    SurfaceGui.Parent = self.Mesh
    local v1 = ReactRoblox.createRoot(SurfaceGui)
    local createElement = React.createElement
    local v2 = {Text = self.SkillData.displayName}
    local v3 = u107[self.SkillData.category] or u107[-1]
    v2.Background = v3
    v2.Adornee = self.Mesh
    v2.SkillEnum = self.SkillEnum
    v2.SkillData = self.SkillData
    v2.Mode = self.SkillData.mode
    v2.RequiredTowerLevel = self.SkillData.requiredTowerLevel
    v2.Level = self.Atoms.Level
    v2.IsHovering = self.Atoms.IsHovering
    v2.Price = self.Atoms.Price
    v2.IsLocked = self.Atoms.IsLocked
    v2.SkillCap = self.Atoms.SkillCap
    v2.LevelsNeeded = self.Atoms.LevelsNeeded
    v2.IsMaxedOut = self.Atoms.IsMaxedOut
    v2.SkillPointCost = self.Atoms.SkillPointCost
    v2.SkillPriceNumber = self.Atoms.SkillPriceNumber
    v1:render((createElement(HexTileInfo, v2)))
    self._surfaceGui = SurfaceGui
    self._surfaceGuiRoot = v1
end

function u80:_initializeSubscriptions() -- Line: 387 -- upvalues: subscribe (val), untracked (val), Enum (val)
    self.Events.PlayUnlockAnimation:Connect(function() -- Line: 388 -- upvalues: self (val)
        self:_playUnlockAnimation()
    end)
    subscribe(self.Atoms.Visible, function(a1, a2) -- Line: 392 -- upvalues: self (val)
        if a1 then
            self:_setVisible()
            return
        end
        self:_setHidden()
    end)
    subscribe(self.Atoms.IsLocked, function(a1, a2) -- Line: 400 -- upvalues: self (val)
        if a1 then
            self:_setLocked()
            return
        end
        self:_setUnlocked(a2 == true)
    end)
    subscribe(self.Atoms.IsHovering, function(a1, a2) -- Line: 408 -- upvalues: self (val)
        if a1 then
            self:_setHovering()
            return
        end
        self:_setNotHovering()
    end)
    subscribe(self.Atoms.IsHeldDown, function(a1, a2) -- Line: 416 -- upvalues: self (val)
        if a1 then
            self:_setHeldDown()
            return
        end
        self:_setNotHeldDown()
    end)
    subscribe(self.Atoms.IsAnimating, function(a1, a2) -- Line: 424 -- upvalues: self (val)
        if a1 then
            self:_setAnimating()
            return
        end
        self:_setNotAnimating()
    end)
    local u35 = untracked(self.Atoms.LevelsNeeded)
    subscribe(self.Atoms.LevelsNeeded, function(a1, a2) -- Line: 433 -- upvalues: u35 (ref), self (val)
        if u35 < a1 then
            self:_animateLevelsNeeded()
        end
        u35 = a1
    end)
    local u44 = untracked(self.Atoms.Level)
    subscribe(self.Atoms.Level, function(a1, a2) -- Line: 442 -- upvalues: u44 (ref), self (val), untracked (upval)
        if u44 < a1 and a1 > 0 then
            self:_animateLevelUp()
        end
        if a1 == 0 then
            self:_setDefaultVisuals()
        end
        self.Atoms.IsMaxedOut(untracked(self.Atoms.SkillCap) <= a1)
        u44 = a1
    end)
    subscribe(self.Atoms.IsSelected, function(a1, a2) -- Line: 458 -- upvalues: self (val)
        if a1 then
            self:_setSelected()
            return
        end
        self:_setUnselected()
    end)
    subscribe(self.Atoms.IsMaxedOut, function(a1, a2) -- Line: 466 -- upvalues: self (val)
        if a1 then
            self:_setMaxedOut()
            return
        end
        self:_setNotMaxedOut()
    end)
    subscribe(self.Atoms.TileState, function(a1, a2) -- Line: 474 -- upvalues: Enum (upval), self (val)
        self.Atoms.IsLocked(a1 == Enum.SkillTileState.Locked)
    end)
    self.Atoms.IsLocked(untracked(self.Atoms.TileState) == Enum.SkillTileState.Locked)
end

function u80:_setVisible() -- Line: 485 -- upvalues: TweenService (val)
    TweenService:Create(self.Mesh, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Transparency = 0,
        Size = Vector3.new(3.631999969482422, 0.10000000149011612, 4.193999767303467),
    }):Play()
    self:_syncLoopingEffects()
end

function u80:_setHidden() -- Line: 500 -- upvalues: TweenService (val)
    TweenService:Create(
        self.Mesh,
        TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Transparency = 1, Size = Vector3.new(0, 0, 0)}
    ):Play()
    self.Atoms.IsHovering(false)
    self.Atoms.IsHeldDown(false)
    self:_clearParticleEmitters()
end

function u80:_setDefaultVisuals() -- Line: 517 -- upvalues: u96 (val)
    self.VisualData.TileColor = u96
    self.Mesh.Color = u96
end

function u80:_setLocked() -- Line: 524 -- upvalues: u91 (val), u86 (val)
    self.VisualData.TileColor = if self.SkillData.mode ~= "Research" then u86 else u91
    self.Mesh.Color = self.VisualData.TileColor
    self:_syncLoopingEffects()
end

function u80:_setUnlocked(a2) -- Line: 534 -- upvalues: u96 (val) -- types: self: table, a2: boolean?
    self.VisualData.TileColor = u96
    self.Mesh.Color = u96
    self:_syncLoopingEffects()
    if a2 and self.SkillData.mode ~= "Research" then
        self:_emitUnlock()
    end
end

function u80:_setHeldDown() -- Line: 544 -- upvalues: TweenService (val)
    TweenService:Create(
        self.Mesh,
        TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Size = Vector3.new(2.7239999771118164, 0.07500000298023224, 3.1454997062683105)}
    ):Play()
end

function u80:_setNotHeldDown() -- Line: 556 -- upvalues: TweenService (val), untracked (val)
    if not self:IsVisible() then
        self.BounceSpring:SetGoal(0, true)
        return
    end
    local Mesh = self.Mesh
    TweenService:Create(Mesh, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = if not untracked(self.Atoms.IsHovering) then Vector3.new(3.631999969482422, 0.10000000149011612, 4.193999767303467) else Vector3.new(4.176799774169922, 0.11500000208616257, 4.823099613189697),
    }):Play()
    self.BounceSpring:SetGoal(0, true)
end

function u80:_setHovering() -- Line: 575 -- upvalues: TweenService (val), u101 (val), Sound (val)
    if not self:IsVisible() then
        return
    end
    TweenService:Create(self.Mesh, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = Vector3.new(4.176799774169922, 0.11500000208616257, 4.823099613189697),
        Color = u101,
    }):Play()
    ;(Sound("Skill Tree Cursor Hover")):Play(true, {math.random(80, 100) / 100, math.random(100, 120) / 100})
    self.BounceSpring:SetGoal(5)
    self:_emitHover()
end

function u80:_setNotHovering() -- Line: 599 -- upvalues: TweenService (val)
    if not self:IsVisible() then
        self.BounceSpring:SetGoal(0, true)
        return
    end
    TweenService:Create(self.Mesh, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = Vector3.new(3.631999969482422, 0.10000000149011612, 4.193999767303467),
        Color = self.VisualData.TileColor,
    }):Play()
    self.BounceSpring:SetGoal(0, true)
end

function u80:_setSelected() -- Line: 622 -- upvalues: Sound (val)
    if not self:IsVisible() then
        return
    end
    Sound("Skill Tree Select"):Play()
    self:_syncLoopingEffects()
end

function u80:_setUnselected() -- Line: 633
    self.Atoms.SelectionCount(0)
    self:_syncLoopingEffects()
end

function u80:_setAnimating() -- Line: 640 -- upvalues: TweenService (val)
    TweenService:Create(
        self.Mesh,
        TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        {Size = Vector3.new(0, 0, 0), Color = self.VisualData.TileColor}
    ):Play()
    self.TiltSpring:SetFrequency(1, 5, 1, 0, 0, 0)
    self.BounceSpring:SetFrequency(1, 1, 1, 0, 0, 0)
end

function u80:_setNotAnimating() -- Line: 658 -- upvalues: TweenService (val)
    TweenService:Create(self.Mesh, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = Vector3.new(3.631999969482422, 0.10000000149011612, 4.193999767303467),
        Color = self.VisualData.TileColor,
    }):Play()
    self.TiltSpring:SetFrequency(1, 5, 1, 0, 0, 0)
    self.BounceSpring:SetFrequency(1, 50, 1, 0, 0, 0)
end

function u80:_setMaxedOut() -- Line: 676 -- upvalues: u106 (val), Sound (val)
    self.VisualData.TileColor = u106
    self.Mesh.Color = self.VisualData.TileColor
    self:_syncLoopingEffects()
    if not self:IsVisible() then
        return
    end
    Sound("Skill Tree Maximum Upgrade"):Play()
end

function u80:_setNotMaxedOut() -- Line: 690
    self.Mesh.Color = self.VisualData.TileColor
    self:_syncLoopingEffects()
end

function u80:_syncLoopingEffects() -- Line: 697 -- upvalues: untracked (val)
    local v1 = untracked(self.Atoms.Visible)
    self:_setDirectParticleEmitters("Linger", v1 and not untracked(self.Atoms.IsLocked))
    self:_setDirectParticleEmitters("SelectedVFX", v1 and untracked(self.Atoms.IsSelected))
    self:_setDirectParticleEmitters("MaxedVFX", false)
end

function u80:_setDirectParticleEmitters(a2, a3) -- Line: 707 -- types: self: table, a2: string, a3: boolean
    local v1 = self.Mesh:FindFirstChild(a2)
    if not v1 then
        return
    end
    for i, j in v1:GetChildren() do
        if j:IsA("ParticleEmitter") then
            j.Enabled = a3
        end
    end
end

function u80:_clearParticleEmitters() -- Line: 724
    for i, j in self.Mesh:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.Enabled = false
            j:Clear()
        end
    end
end

function u80:_animateLevelsNeeded() -- Line: 737 -- upvalues: Promise (val), TweenService (val)
    if self.Promises.LevelsNeededAnimation then
        self.Promises.LevelsNeededAnimation:cancel()
    end
    self.Promises.LevelsNeededAnimation = (Promise.new(function(a1, a2, a3) -- Line: 744 -- upvalues: self (ref), TweenService (upval)
        self:SetAnimating(true)
        self.TiltSpring:AddVelocity(10)
        self.TiltSpring:SetGoal(5)
        self:_emitLevelsNeeded()
        TweenService:Create(
            self.Mesh,
            TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {Color = Color3.fromRGB(255, 255, 255)}
        ):Play()
        task.wait(0.1)
        TweenService:Create(
            self.Mesh,
            TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {Color = self.VisualData.TileColor}
        ):Play()
        self.TiltSpring:SetGoal(0)
        self.BounceSpring:SetGoal(0)
        a3(function() -- Line: 772 -- upvalues: self (upval)
            self:SetAnimating(false)
        end)
        a1()
    end)):andThen(function() -- Line: 777 -- upvalues: self (ref)
        self:SetAnimating(false)
    end)
end

function u80:_playUnlockAnimation() -- Line: 782 -- upvalues: Promise (val)
    if self.Promises.UnlockAnimation then
        self.Promises.UnlockAnimation:cancel()
    end
    self.Promises.UnlockAnimation = (Promise.new(function(a1, a2, a3) -- Line: 789 -- upvalues: self (ref)
        self:SetAnimating(true)
        self.TiltSpring:AddVelocity(1000)
        self.TiltSpring:SetGoal(90)
        self.BounceSpring:SetGoal(-20)
        task.wait(0.1)
        self.Mesh.Color = self.VisualData.TileColor
        self.TiltSpring:SetGoal(0)
        self.BounceSpring:SetGoal(0)
        a3(function() -- Line: 802 -- upvalues: self (upval)
            self:SetAnimating(false)
        end)
        a1()
    end)):andThen(function() -- Line: 807 -- upvalues: self (ref)
        self:SetAnimating(false)
    end)
end

function u80:_emitParticles(a2) -- Line: 812 -- types: self: table, a2: userdata
    local Attribute_2
    if not self:IsVisible() then
        return
    end
    for i, j in a2:GetChildren() do
        if j:IsA("ParticleEmitter") then
            local Attribute = j:GetAttribute("EmitCount")
            Attribute_2 = j:GetAttribute("EmitDelay")
            if Attribute_2 then
                task.delay(Attribute_2, function() -- Line: 825 -- upvalues: self (val), j (ref), Attribute (val)
                    if not self:IsVisible() then
                        return
                    end
                    j:Emit(Attribute)
                end)
            elseif self:IsVisible() then
                j:Emit(Attribute)
            end
        end
    end
end

function u80:_emitUpgrade() -- Line: 841 -- upvalues: Sound (val)
    if not self:IsVisible() then
        return
    end
    self:_emitParticles(self.Mesh.UpgradeVFX)
    ;(Sound("Skill Tree Upgrade")):Play(true, {math.random(80, 100) / 100, math.random(100, 120) / 100})
end

function u80:_emitUnlock() -- Line: 856 -- upvalues: Sound (val)
    if not self:IsVisible() then
        return
    end
    self:_emitParticles(self.Mesh.UnlockVFX)
    Sound("Skill Tree Unlock"):Play()
end

function u80:_emitHover() -- Line: 868
    self:_emitParticles(self.Mesh.Linger.EmitOnce)
end

function u80._emitReveal(a1) -- Line: 876
    a1:_emitParticles(a1.Mesh.RevealVFX)
end

function u80:_emitLevelsNeeded() -- Line: 883
    self:_emitParticles(self.Mesh.LevelsNeededVFX)
end

function u80._animateFirstTimeUnlock(a1) -- Line: 890
    a1:_emitUnlock()
end

function u80:_animateLevelUp() -- Line: 895
    self:_emitUpgrade()
end

return u80