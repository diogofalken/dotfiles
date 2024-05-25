return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local nmap = function(keys, func, desc)
			if desc then
				desc = "[H]: " .. desc
			end
			vim.keymap.set("n", keys, func, { desc = desc })
		end

		nmap("<leader>ha", function() harpoon:list():add() end, "add file")
		nmap("<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "menu")
		nmap("<leader>1", function() harpoon:list():select(1) end, "goto 1")
		nmap("<leader>2", function() harpoon:list():select(2) end, "goto 2")
		nmap("<leader>3", function() harpoon:list():select(3) end, "goto 3")
    nmap("<leader>4", function() harpoon:list():select(4) end, "goto 4")
  end,
}
