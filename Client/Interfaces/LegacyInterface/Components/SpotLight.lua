-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.SpotLight
-- Decompile time: 2.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
return function(a1) -- Line: 5 -- upvalues: SpotlightStore (val)
    assert(a1, "No props provided")
    assert(a1.Name, "No Name provided")
    local Name = a1.Name
    local Target = a1.Target
    local v1 = a1.Scale or 1
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.fromScale(v1, v1)
    Frame.Position = UDim2.fromScale(0.5, 0.5)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundTransparency = 1
    Frame.Name = ("SpotLight:%*"):format(Name)
    local u45 = nil
    local u35 = nil

    local function onElement() -- Line: 23
        -- upvalues: Target (val), Frame (val), u35 (ref), SpotlightStore (upval), Name (val)
        local Parent = Target or Frame.Parent
        if Parent and Parent:IsA("GuiButton") then
            if u35 and u35.Connected then
                u35:Disconnect()
            end
            u35 = Parent.MouseButton1Up:Connect(function() -- Line: 33 -- upvalues: SpotlightStore (upval), Name (upval)
                if SpotlightStore.getState().selected == Name then
                    SpotlightStore.fire(Name)
                end
            end)
            return
        end
    end

    if not Target then
        u45 = (Frame:GetPropertyChangedSignal("Parent")):Connect(onElement)
    end
    onElement()
    Frame.Destroying:Once(function() -- Line: 46 -- upvalues: u45 (ref), u35 (ref), SpotlightStore (upval), Name (val)
        if u45 and u45.Connected then
            u45:Disconnect()
        end
        if u35 and u35.Connected then
            u35:Disconnect()
        end
        SpotlightStore.remove(Name)
    end)
    SpotlightStore.add(Name, Frame)
    return Frame
end