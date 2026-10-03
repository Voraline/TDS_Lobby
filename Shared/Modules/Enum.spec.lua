-- Script path: ReplicatedStorage.Shared.Modules.Enum.spec
-- Decompile time: 0.64 ms

return function() -- Line: 1
    local Enum = require(script.Parent.Enum)
    it("Should throw when trying to index an invalid Enum", function() -- Line: 4 -- upvalues: Enum (val)
        expect(function() -- Line: 5 -- upvalues: Enum (upval)
            local GarbleGoop = Enum.Team.GarbleGoop
            print(GarbleGoop)
        end).to.throw()
    end)
    it("Should throw when trying to index an invalid set of Enums", function() -- Line: 11 -- upvalues: Enum (val)
        expect(function() -- Line: 12 -- upvalues: Enum (upval)
            local GarbleGoop = Enum.GarbleGoop
            print(GarbleGoop)
        end).to.throw()
    end)
    it("Should be able to access global enums properly", function() -- Line: 18 -- upvalues: Enum (val)
        expect(function() -- Line: 19 -- upvalues: Enum (upval)
            local AccessoryType = Enum.AccessoryType
            local Back = Enum.AccessoryType.Back
            print(AccessoryType, Back)
        end).to.throw()
    end)
end