local M = {}
M.tableHasKey = function(table, key)
	return table[key] ~= nil
end

return M
