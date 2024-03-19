-- dap and the kitchen sink
return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'mfussenegger/nvim-dap',
    keys = {
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Start/Continue Debugger',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Add Breakpoint',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate Debugger',
      },
      {
        '<F1>',
        function()
          require('dap').step_over()
        end,
        desc = 'Step Over',
      },
      {
        '<F2>',
        function()
          require('dap').step_into()
        end,
        desc = 'Step Into',
      },
      {
        '<F3>',
        function()
          require('dap').step_last()
        end,
        desc = 'Step Last',
      },
    },
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = {
      ensure_installed = { 'delve' },
      automatic_installation = true,
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = 'mfussenegger/nvim-dap',
    keys = {
      {
        '<leader>du',
        function()
          require('dapui').toggle()
        end,
        desc = 'Toggle Debugger UI',
      },
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
  {
    'leoluz/nvim-dap-go',
    dependencies = 'mfussenegger/nvim-dap',
    opts = {},
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = { enabled = true },
  },
}
