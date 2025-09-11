local spawn_process = require("./spawn_process")

local rojo = {}

function rojo.serve(projectFile: string): thread
	return spawn_process("rojo", { "serve", projectFile })
end

function rojo.sourcemap(projectFile: string, outputFile: string, watch: boolean): thread
	local parameters = {
		"sourcemap",
		projectFile,
		"-o",
		outputFile,
		"--include-non-scripts",
	}

	if watch then
		table.insert(parameters, "--watch")
	end

	return spawn_process("rojo", parameters)
end

function rojo.build(projectFile: string, output: string): thread
	return spawn_process("rojo", { "build", projectFile, "--output", output })
end

return rojo
