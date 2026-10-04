-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.includes.spec
-- Decompile time: 0.30 ms

return function() -- Line: 1
    local includes = require(script.Parent.includes)
    it("should return true if the dictionary includes the given value", function() -- Line: 4 -- upvalues: includes (val)
        local v1 = includes({hello = "roblox", goodbye = "world"}, "roblox")
        expect(v1).to.equal(true)
    end)
    it("should return false if the dictionary does not include the given value", function() -- Line: 12 -- upvalues: includes (val)
        local v1 = includes({hello = "roblox", goodbye = "world"}, "cat")
        expect(v1).to.equal(false)
    end)
end