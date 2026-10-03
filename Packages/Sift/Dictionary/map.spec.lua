-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.map.spec
-- Decompile time: 0.58 ms

return function() -- Line: 1
    local map = require(script.Parent.map)
    it("should return a dictionary where entries are the result of the mapper function", function() -- Line: 4 -- upvalues: map (val)
        local v1 = map({hello = "roblox", goodbye = "world"}, function(a1) -- Line: 5
            return a1 .. "!"
        end)
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox!")
        expect(v1.goodbye).to.equal("world!")
    end)
    it("should not modify the original dictionary", function() -- Line: 15 -- upvalues: map (val)
        local v1 = {hello = "roblox", goodbye = "world"}
        map(v1, function(a1) -- Line: 18
            return a1 .. "!"
        end)
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("roblox")
        expect(v1.goodbye).to.equal("world")
    end)
end