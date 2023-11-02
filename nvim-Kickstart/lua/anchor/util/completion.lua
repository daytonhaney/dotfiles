function M.format_filter(clients)
	return vim.tbl_filter(function(client)
		local status_ok, formatting_supported = pcall(function()
			return client.supports_method("textDocument/formatting")
		end)
		if status_ok and formatting_supported and client.name == "null-ls" then
			return "null-ls"
		elseif not server_formatting_block_list[client.name] and status_ok and formatting_supported then
			return client.name
		end
	end, clients)
end
