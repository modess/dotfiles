require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { "/usr/lib/node_modules/php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9004,
    pathMappings = {
      ["/srv"] = "${workspaceFolder}"
    }
  }
}

require "nvim-dap-virtual-text".setup {}

vim.fn.sign_define('DapBreakpoint',{ text ='', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})
