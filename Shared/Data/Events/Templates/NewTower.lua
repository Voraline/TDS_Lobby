-- Script path: ReplicatedStorage.Shared.Data.Events.Templates.NewTower
-- Decompile time: 0.91 ms

local CollectionService = game:GetService("CollectionService")
local MarketplaceService = game:GetService("MarketplaceService")

local function setup() -- Line: 4 -- upvalues: MarketplaceService (val), CollectionService (val)
    local AnimationController, Animations, Animator, v1
    local success, result = pcall(function() -- Line: 5 -- upvalues: MarketplaceService (upval)
        return MarketplaceService:GetProductInfo(786591818, Enum.InfoType.GamePass).PriceInRobux
    end)
    local Countdown = workspace:FindFirstChild("Countdown")
    if Countdown then
        if not success or not result then
            Countdown.BillboardGui.Price.Text = "Lv. 150 or 1800"
        else
            Countdown.BillboardGui.Price.Text = ("Lv. 150 or %*"):format(result)
        end
    end
    for i, j in CollectionService:GetTagged("UnitAnimated") do
        Animations = j:FindFirstChild("Animations")
        if Animations then
            AnimationController = j:FindFirstChildOfClass("AnimationController")
            if AnimationController then
                Animator = AnimationController:FindFirstChildOfClass("Animator")
                if not Animator then
                    Animator = Instance.new("Animator")
                    Animator.Parent = AnimationController
                end
                v1 = Animator:LoadAnimation((Animations:FindFirstChild("Idle")))
                v1.Looped = true
                v1:Play()
            end
        end
    end
end

return {
    name = "Mercenary Base Tower",
    starts = DateTime.fromUnixTimestamp(1713556800),
    running = setup,
    inactive = setup,
}