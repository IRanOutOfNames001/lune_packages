local spawn_process = require("./spawn_process")

local darklua = {}

function darklua.build(projectDirectory: string, targetDirectory: string, configFileName: string, watch: boolean)
	local parameters = {
		"process",
		"--config",
		configFileName,
		projectDirectory,
		targetDirectory,
	}

	if watch then
		table.insert(parameters, "--watch")
	end

	return spawn_process("darklua", parameters)
end

return darklua
