local converter = require("@self/converter")
local lexer = require("@self/lexer")
local parser = require("@self/parser")
local prep = require("@self/prep")

local function main(source: string)
	local preppedSource = prep(source)
	local lexemes = lexer(preppedSource)
	local parsed = parser(lexemes)
	local converted = converter(parsed)

	return converted
end

return main
