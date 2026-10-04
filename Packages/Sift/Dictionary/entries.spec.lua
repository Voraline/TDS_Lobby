-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.entries.spec
-- Decompile time: 0.48 ms

return function() -- Line: 1
    local entries = require(script.Parent.entries)
    it("should return a list of entries as key-value pairs", function() -- Line: 4 -- upvalues: entries (val)
        local v1 = entries({hello = "roblox", goodbye = "world"})
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(2)
        expect(v1[1]).to.be.a("table")
        expect(#v1[1]).to.equal(2)
        expect(v1[1][1]).to.equal("hello")
        expect(v1[1][2]).to.equal("roblox")
        expect(v1[2]).to.be.a("table")
        expect(#v1[2]).to.equal(2)
        expect(v1[2][1]).to.equal("goodbye")
        expect(v1[2][2]).to.equal("world")
    end)
end