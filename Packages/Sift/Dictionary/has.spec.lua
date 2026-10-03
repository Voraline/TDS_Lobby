-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.has.spec
-- Decompile time: 0.41 ms

return function() -- Line: 1
    local has = require(script.Parent.has)
    it("should return true if the dictionary has the given key", function() -- Line: 4 -- upvalues: has (val)
        local v1 = has({hello = "roblox", goodbye = "world"}, "hello")
        expect(v1).to.equal(true)
    end)
    it("should return false if the dictionary does not have the given key", function() -- Line: 12 -- upvalues: has (val)
        local v1 = has({hello = "roblox", goodbye = "world"}, "cat")
        expect(v1).to.equal(false)
    end)
end