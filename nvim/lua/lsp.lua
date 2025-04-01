local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Initialize Mason
mason.setup()
mason_lspconfig.setup({
  ensure_installed = {
    "ts_ls", -- JavaScript, TypeScript
    "html",       -- HTML
    "cssls",      -- CSS
    "tailwindcss",-- Tailwind
    "eslint",     -- ESLint
    "pyright",    -- Python
    "solargraph", -- Ruby
    "clangd",     -- C, C++
    "emmet_language_server" -- Emmet
  }
})

-- Function to set up keymaps when LSP attaches
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- LSP Keybindings
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- Go to definition
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)          -- Go to declaration
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)           -- List references
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)       -- Go to implementation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- Show hover doc
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- Rename symbol
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- Code actions
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts) -- Show diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)         -- Previous diagnostic
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- Next diagnostic
end

-- Capabilities for auto-completion
local capabilities = cmp_nvim_lsp.default_capabilities()

-- LSP Server Setup
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
})

