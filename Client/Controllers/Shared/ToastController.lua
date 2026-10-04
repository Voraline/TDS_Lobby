-- Script path: ReplicatedStorage.Client.Controllers.Shared.ToastController
-- Decompile time: 0.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u11 = require(ReplicatedStorage.Shared.Modules.Signal).new()
return {
    onToastNotification = function(a1) -- Line: 19 -- upvalues: u11 (val) -- types: a1: function
        local u5 = u11:Connect(a1)
        return function() -- Line: 21 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end,
    showToast = function(a1) -- Line: 26 -- upvalues: u11 (val) -- types: a1: table
        u11:Fire(a1)
    end,
}