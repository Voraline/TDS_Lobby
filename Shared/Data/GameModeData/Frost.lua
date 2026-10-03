-- Script path: ReplicatedStorage.Shared.Data.GameModeData.Frost
-- Decompile time: 0.20 ms

return {
    Waves = 40,
    Boss = "Frost Spirit",
    EstimatedTime = 30,
    RewardHolderSize = UDim2.fromScale(1, 0.7),
    RewardItemSize = UDim2.fromScale(0.8, 0.18),
    Rewards = {
        Coins = NumberRange.new(2000, 2000),
        Experience = NumberRange.new(200, 300),
        Gems = NumberRange.new(45),
    },
    ColorScheme = {
        Primary = Color3.fromRGB(0, 110, 255),
        Secondary = Color3.fromRGB(0, 195, 255),
        Tertiary = Color3.fromRGB(41, 166, 255),
    },
}