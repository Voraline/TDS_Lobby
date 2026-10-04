-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Champion.Animator
-- Decompile time: 2.06 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u17 = require("@self/FrostChampionAnimatorStates")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local FractalitySpring = require(ReplicatedStorage.Packages.FractalitySpring)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 17
    -- upvalues: StateManager (val), Animation (val), FractalitySpring (val), RunService (val), u17 (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local Animator = (a1.Model:WaitForChild("AnimationController")):WaitForChild("Animator")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({Preload = true, Track = j, Target = Animator}))
    end
    a1._upperTorsoBone = a1.Model.UpperTorsoBone.Value
    a1._upperRightArmBone = a1.Model.UpperArmBone_R.Value
    a1._neckBone = a1.Model.NeckBone.Value
    a1._bannerAimSpring = FractalitySpring.new(1, 1, CFrame.identity, CFrame.identity)
    a1.Maid:Mark((RunService.PreRender:Connect(function(a1_2) -- Line: 37 -- upvalues: a1 (val) -- types: a1_2: number
        a1:_updateBannerAim(a1_2)
    end)))
    for k, n in u17 do
        a1._stateManager:addState(n)
    end
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 46 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, a1, ...)
        end,
        AreaIndicator = function(a1_2, a2, a3, a4) -- Line: 49
            -- upvalues: a1 (val)
            a1:_showAreaIndicator(a1_2, a2, a3, a4)
        end,
    }
    a1._stateManager:changeState("Walking", a1)
end

function v1:_updateBannerAim(a2) -- Line: 62 -- upvalues: GameState (val) -- types: self: table, a2: number
    local v1 = select(1, (self._bannerAimSpring:step(a2 * GameState.TimeScale)):ToEulerAnglesXYZ()) / 2
    local RightVector = self.Model.PrimaryPart.CFrame.RightVector
    local v2 = self._upperTorsoBone.TransformedWorldCFrame:VectorToObjectSpace(RightVector)
    local v3 = self._upperRightArmBone.TransformedWorldCFrame:VectorToObjectSpace(RightVector)
    local v4 = self._neckBone.TransformedWorldCFrame:VectorToObjectSpace(RightVector)
    local _upperTorsoBone = self._upperTorsoBone
    _upperTorsoBone.Transform = _upperTorsoBone.Transform * CFrame.fromAxisAngle(v2, v1)
    local _upperRightArmBone = self._upperRightArmBone
    _upperRightArmBone.Transform = _upperRightArmBone.Transform * CFrame.fromAxisAngle(v3, v1)
    local _neckBone = self._neckBone
    _neckBone.Transform = _neckBone.Transform * CFrame.fromAxisAngle(v4, v1)
end

function v1:_showAreaIndicator(a2, a3, a4, a5) -- Line: 79
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    local v1 = HttpService:GenerateGUID(false)
    AreaIndicatorStore.create(v1, {
        type = "full",
        fadeInTime = 0.5,
        radius = a2,
        color3 = a5 or Color3.fromRGB(255, 0, 64),
        position = a3,
        tweenInfo = TweenInfo.new(a4),
        lifeTime = a4,
    })
    self:Wait(a4 + 0.25)
    AreaIndicatorStore.remove(v1)
end

return v1