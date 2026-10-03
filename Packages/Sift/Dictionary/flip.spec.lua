-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.flip.spec
-- Decompile time: 0.43 ms

return function() -- Line: 1
    local flip = require(script.Parent.flip)
    it("should return a flipped dictionary", function() -- Line: 4 -- upvalues: flip (val)
        local v1 = flip({hello = "roblox", goodbye = "world"})
        expect(v1).to.be.a("table")
        expect(v1.world).to.equal("goodbye")
        expect(v1.roblox).to.equal("hello")
    end)
end