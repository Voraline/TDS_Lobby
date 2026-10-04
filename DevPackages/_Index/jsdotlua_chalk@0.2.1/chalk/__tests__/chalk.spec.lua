-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_chalk@0.2.1.chalk.__tests__.chalk.spec
-- Decompile time: 19.06 ms

return function() -- Line: 1
    local u2 = require("../init")

    local function ansi16(a1) -- Line: 4
        return string.format("%c[%dm", 27, a1)
    end

    local function ansi256(a1) -- Line: 8
        return string.format("%c[%d;5;%dm", 27, 38, a1)
    end

    local function bgAnsi256(a1) -- Line: 12
        return string.format("%c[%d;5;%dm", 27, 48, a1)
    end

    it("don't add any styling when called as the base function", function() -- Line: 16 -- upvalues: u2 (val)
        expect(u2("foo")).to.equal("foo")
    end)
    it("calls tostring on input", function() -- Line: 20 -- upvalues: u2 (val)
        expect(u2(123)).to.equal("123")
    end)
    it("styles string", function() -- Line: 24 -- upvalues: u2 (val), ansi16 (val)
        (expect((u2.underline("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%dm", 27, 4), ansi16(24)))
        ;(expect((u2.red("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%dm", 27, 31), ansi16(39)))
        ;(expect((u2.bgRed("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%dm", 27, 41), ansi16(49)))
    end)
    it("supports applying multiple styles at once", function() -- Line: 30 -- upvalues: u2 (val), ansi16 (val)
        (expect((u2.red((u2.bgGreen((u2.underline("foo")))))))).to.equal(string.format(
            "%s%s%sfoo%s%s%s",
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 42),
            string.format("%c[%dm", 27, 4),
            string.format("%c[%dm", 27, 24),
            string.format("%c[%dm", 27, 49),
            ansi16(39)
        ))
        ;(expect((u2.underline((u2.red((u2.bgGreen("foo")))))))).to.equal(string.format(
            "%s%s%sfoo%s%s%s",
            string.format("%c[%dm", 27, 4),
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 42),
            string.format("%c[%dm", 27, 49),
            string.format("%c[%dm", 27, 39),
            ansi16(24)
        ))
    end)
    it("supports nesting styles of different types", function() -- Line: 55 -- upvalues: u2 (val), ansi16 (val)
        (expect((u2.red("r" .. (u2.bold("b")) .. "r")))).to.equal(string.format(
            "%sr%sb%sr%s",
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 1),
            string.format("%c[%dm", 27, 22),
            ansi16(39)
        ))
    end)
    it("reset all styles with .reset()", function() -- Line: 61 -- upvalues: u2 (val), ansi16 (val)
        (expect((u2.reset((u2.red((u2.bgGreen((u2.underline("foo")))))))))).to.equal(string.format(
            "%s%s%s%sfoo%s%s%s%s",
            string.format("%c[%dm", 27, 0),
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 42),
            string.format("%c[%dm", 27, 4),
            string.format("%c[%dm", 27, 24),
            string.format("%c[%dm", 27, 49),
            string.format("%c[%dm", 27, 39),
            ansi16(0)
        ))
    end)
    it("supports composing multiple styles", function() -- Line: 77 -- upvalues: u2 (val), ansi16 (val)
        local v1 = u2.red .. u2.bold
        ;(expect((v1("foo")))).to.equal(string.format(
            "%s%sfoo%s%s",
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 1),
            string.format("%c[%dm", 27, 22),
            ansi16(39)
        ))
    end)
    it("reopens tags when encounters closing tag", function() -- Line: 84 -- upvalues: u2 (val), ansi16 (val)
        local v1 = u2.red("FIRST ") .. " SECOND"
        ;(expect((u2.red(v1)))).to.equal(string.format(
            "%s%sFIRST %s%s SECOND%s",
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 39),
            string.format("%c[%dm", 27, 31),
            ansi16(39)
        ))
    end)
    it("reopens tags when encounters closing tag - works with unicode chars", function() -- Line: 99 -- upvalues: u2 (val), ansi16 (val)
        local v1 = u2.red("● FIRST ") .. " ● SECOND"
        ;(expect((u2.red(v1)))).to.equal(string.format(
            "%s%s● FIRST %s%s ● SECOND%s",
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 39),
            string.format("%c[%dm", 27, 31),
            ansi16(39)
        ))
    end)
    describe("aliases for gray", function() -- Line: 114 -- upvalues: u2 (val)
        local foo = u2.gray("foo")
        local foo_2 = u2.bgGray("foo")
        it("grey", function() -- Line: 118 -- upvalues: u2 (upval), foo (val)
            expect(u2.grey("foo")).to.equal(foo)
        end)
        it("blackBright", function() -- Line: 122 -- upvalues: u2 (upval), foo (val)
            expect(u2.blackBright("foo")).to.equal(foo)
        end)
        it("bgGrey", function() -- Line: 126 -- upvalues: u2 (upval), foo_2 (val)
            expect(u2.bgGrey("foo")).to.equal(foo_2)
        end)
        it("bgBlackBright", function() -- Line: 130 -- upvalues: u2 (upval), foo_2 (val)
            expect(u2.bgBlackBright("foo")).to.equal(foo_2)
        end)
    end)
    it("don't output escape codes if the input is empty", function() -- Line: 135 -- upvalues: u2 (val)
        expect(u2.red()).to.equal("")
        expect(u2.red("")).to.equal("")
        expect(u2.red(u2.blue(u2.black()))).to.equal("")
        expect(u2.red(u2.blue(u2.black("")))).to.equal("")
    end)
    it("don't output escape codes if level is 0", function() -- Line: 142 -- upvalues: u2 (val)
        u2.level = 0
        expect(u2.red("red")).to.equal("red")
        u2.level = 2
    end)
    it("should work across line breaks", function() -- Line: 148 -- upvalues: u2 (val), ansi16 (val)
        (expect((u2.red("hello\nworld")))).to.equal(string.format(
            "%shello%s\n%sworld%s",
            string.format("%c[%dm", 27, 31),
            string.format("%c[%dm", 27, 39),
            string.format("%c[%dm", 27, 31),
            ansi16(39)
        ))
    end)
    describe(".ansi()", function() -- Line: 154 -- upvalues: u2 (val)
        it(".ansi()", function() -- Line: 155 -- upvalues: u2 (upval)
            expect(u2.ansi(31)("foo")).to.equal(u2.red("foo"))
        end)
        it(".bgAnsi()", function() -- Line: 159 -- upvalues: u2 (upval)
            expect(u2.bgAnsi(41)("foo")).to.equal(u2.bgRed("foo"))
        end)
        it(".ansi() doesn't output escape codes for invalid inputs", function() -- Line: 163 -- upvalues: u2 (upval)
            expect(u2.ansi(999)("foo")).to.equal("foo")
        end)
        it(".bgAnsi() doesn't output escape codes for invalid inputs", function() -- Line: 167 -- upvalues: u2 (upval)
            expect(u2.bgAnsi(999)("foo")).to.equal("foo")
        end)
    end)
    describe(".ansi256()", function() -- Line: 172 -- upvalues: u2 (val), ansi16 (val)
        it(".ansi256()", function() -- Line: 173 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.ansi256(196)("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 38, 196), ansi16(39)))
        end)
        it(".bgAnsi256()", function() -- Line: 179 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.bgAnsi256(196)("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 48, 196), ansi16(49)))
        end)
        it(".ansi256() doesn't output escape codes for invalid inputs", function() -- Line: 185 -- upvalues: u2 (upval)
            expect(u2.ansi256(999)("foo")).to.equal("foo")
        end)
        it(".bgAnsi256() doesn't output escape codes for invalid inputs", function() -- Line: 189 -- upvalues: u2 (upval)
            expect(u2.bgAnsi256(999)("foo")).to.equal("foo")
        end)
    end)
    describe(".rgb()", function() -- Line: 194 -- upvalues: u2 (val), ansi16 (val)
        it(".rgb()", function() -- Line: 195 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.rgb(255, 0, 0)("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 38, 196), ansi16(39)))
        end)
        it(".bgRgb()", function() -- Line: 201 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.bgRgb(255, 0, 0)("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 48, 196), ansi16(49)))
        end)
        it("composes with modifiers", function() -- Line: 207 -- upvalues: u2 (upval), ansi16 (upval)
            local v1 = (u2.rgb(255, 0, 0)) .. u2.bold
            ;(expect((v1("foo")))).to.equal(string.format(
                "%s%sfoo%s%s",
                string.format("%c[%d;5;%dm", 27, 38, 196),
                string.format("%c[%dm", 27, 1),
                string.format("%c[%dm", 27, 22),
                ansi16(39)
            ))
        end)
        it("clamps to 16", function() -- Line: 214 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.rgb(0, 0, 0)("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 38, 16), ansi16(39)))
        end)
        it("clamps to 231", function() -- Line: 220 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.rgb(255, 255, 255)("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 38, 231), ansi16(39)))
        end)
        it(".rgb() doesn't output escape codes for invalid inputs", function() -- Line: 226 -- upvalues: u2 (upval)
            expect(u2.rgb(false)("foo")).to.equal("foo")
            expect(u2.rgb(999, 999, 999)("foo")).to.equal("foo")
        end)
        it(".bgRgb() doesn't output escape codes for invalid inputs", function() -- Line: 231 -- upvalues: u2 (upval)
            expect(u2.bgRgb(false)("foo")).to.equal("foo")
            expect(u2.bgRgb(999, 999, 999)("foo")).to.equal("foo")
        end)
    end)
    describe(".hex()", function() -- Line: 237 -- upvalues: u2 (val), ansi16 (val)
        it(".hex()", function() -- Line: 238 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.hex("#ff0000")("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 38, 196), ansi16(39)))
        end)
        it(".bgHex()", function() -- Line: 244 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.bgHex("#ff0000")("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 48, 196), ansi16(49)))
        end)
        it("composes with modifiers", function() -- Line: 250 -- upvalues: u2 (upval), ansi16 (upval)
            local v1 = (u2.hex("#ff0000")) .. u2.bold
            ;(expect((v1("foo")))).to.equal(string.format(
                "%s%sfoo%s%s",
                string.format("%c[%d;5;%dm", 27, 38, 196),
                string.format("%c[%dm", 27, 1),
                string.format("%c[%dm", 27, 22),
                ansi16(39)
            ))
        end)
        it("clamps to 16", function() -- Line: 257 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.hex("#000000")("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 38, 16), ansi16(39)))
        end)
        it("clamps to 231", function() -- Line: 263 -- upvalues: u2 (upval), ansi16 (upval)
            (expect((u2.hex("#FFFFFF")("foo")))).to.equal(string.format("%sfoo%s", string.format("%c[%d;5;%dm", 27, 38, 231), ansi16(39)))
        end)
        it(".hex() doesn't output escape codes for invalid inputs", function() -- Line: 269 -- upvalues: u2 (upval)
            expect(u2.hex(false)("foo")).to.equal("foo")
            expect(u2.hex("#XXX")("foo")).to.equal("foo")
            expect(u2.hex("#FFFFFFF")("foo")).to.equal("foo")
        end)
        it(".bgHex() doesn't output escape codes for invalid inputs", function() -- Line: 275 -- upvalues: u2 (upval)
            expect(u2.bgHex(false)("foo")).to.equal("foo")
            expect(u2.bgHex("#XXX")("foo")).to.equal("foo")
            expect(u2.bgHex("#FFFFFFF")("foo")).to.equal("foo")
        end)
    end)
end