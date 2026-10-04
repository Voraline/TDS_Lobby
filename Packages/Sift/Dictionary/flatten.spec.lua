-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.flatten.spec
-- Decompile time: 0.73 ms

return function() -- Line: 1
    local flatten = require(script.Parent.flatten)
    it("should return a flattened dictionary", function() -- Line: 4 -- upvalues: flatten (val)
        local v1 = flatten({hello = "world", goodbye = {yes = "no", no = "yes"}})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("world")
        expect(v1.yes).to.equal("no")
        expect(v1.no).to.equal("yes")
    end)
    it("should not flatten nested dictionaries if depth = 0", function() -- Line: 22 -- upvalues: flatten (val)
        local v1 = {hello = "world", goodbye = {yes = "no", no = "yes"}}
        local v2 = flatten(v1, 0)
        expect(v2).to.be.a("table")
        expect(v2.hello).to.equal("world")
        expect(v2.goodbye).to.equal(v1.goodbye)
    end)
    it("should flatten as deeply as possible", function() -- Line: 39 -- upvalues: flatten (val)
        local v1 = flatten({
            hello = "world",
            goodbye = {yes = "no", no = "yes", maybe = {maybe = "ok", okay = {experience = "roblox"}}},
        })
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal("world")
        expect(v1.yes).to.equal("no")
        expect(v1.no).to.equal("yes")
        expect(v1.maybe).to.equal("ok")
        expect(v1.experience).to.equal("roblox")
    end)
end