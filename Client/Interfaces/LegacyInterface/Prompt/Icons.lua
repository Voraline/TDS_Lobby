-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Prompt.Icons
-- Decompile time: 0.51 ms

local v1 = {
    Cash = 9245490334,
    Star = 9245488713,
    Stats = 9245486966,
    Crate = 9245485049,
    Shop = 9245481240,
    Check = 9245479057,
    Cancel = 9245480188,
}
for i, j in v1 do
    if typeof(j) == "number" then
        v1[i] = (("rbxassetid://%*"):format(j))
    end
end
table.freeze(v1)
return v1