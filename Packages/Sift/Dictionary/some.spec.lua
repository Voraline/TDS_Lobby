-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.some.spec
-- Decompile time: 0.48 ms

return function() -- Line: 1
    local some = require(script.Parent.some)
    it("should return true if the predicate returns true for any of the values", function() -- Line: 4 -- upvalues: some (val)
        local v1 = some({hello = "roblox", goodbye = "world"}, function(a1) -- Line: 7
            return a1 == "roblox"
        end)
        expect(v1).to.equal(true)
    end)
    it("should return false if the predicate returns false for all of the values", function() -- Line: 14 -- upvalues: some (val)
        local v1 = some({hello = "roblox", goodbye = "world"}, function(a1) -- Line: 17
            return a1 == "hello"
        end)
        expect(v1).to.equal(false)
    end)
end