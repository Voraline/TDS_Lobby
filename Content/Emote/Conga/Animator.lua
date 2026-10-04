-- Script path: ReplicatedStorage.Content.Emote.Conga.Animator
-- Decompile time: 1.13 ms

local RunService = game:GetService("RunService")
return {
    Initialize = function(a1) -- Line: 5 -- upvalues: RunService (val)
        local Character = a1.Character
        local Root = Character.Root
        local Humanoid = Character.Humanoid
        local Target = a1.Target
        local Character_2 = Target
        if Character_2 then
            Character_2 = Target.Character
        end
        if Character_2 then
            Character_2:SetAttribute("EmoteInteractable", false)
            a1.emoteChanged = (Character_2:GetAttributeChangedSignal("Emoting")):Connect(function() -- Line: 17 -- upvalues: Character_2 (ref), a1 (val), Target (ref)
                if Character_2:GetAttribute("Emoting") == true then
                    return
                end
                if a1.emoteChanged then
                    a1.emoteChanged:Disconnect()
                    a1.emoteChanged = nil
                end
                Target = nil
                Character_2 = nil
                a1.Target = nil
            end)
        end
        if a1.Local and not a1.Preview then
            a1.walkToPoint = RunService.Heartbeat:Connect(function() -- Line: 37 -- upvalues: Target (ref), Character_2 (ref), Root (val), Humanoid (val)
                if not Target then
                    Humanoid:MoveTo(Root.Position + Root.CFrame.LookVector * 10)
                    return
                end
                local v1 = Character_2
                local PrimaryPart = v1 and v1.PrimaryPart
                if not PrimaryPart then
                    Target = nil
                    return
                end
                Humanoid:MoveTo(Root.Position + (CFrame.lookAt(Root.Position, (PrimaryPart.CFrame * CFrame.new(0, 0, 2)).Position)).LookVector * 10)
            end)
            return
        end
    end,
    Destroy = function(a1) -- Line: 58
        if a1.Local then
            a1.Character.Humanoid:MoveTo(a1.Character.Root.Position)
        end
        if a1.emoteChanged then
            a1.emoteChanged:Disconnect()
            a1.emoteChanged = nil
        end
        if a1.walkToPoint then
            a1.walkToPoint:Disconnect()
            a1.walkToPoint = nil
        end
    end,
}