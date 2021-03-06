-- npm install -g vscode-json-languageserver
local M = {}

function M.setup()
  require'lspconfig'.jsonls.setup {
    cmd = {
      "node", DATA .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
      "--stdio"
    },
    on_attach = require'lsp'.common_on_attach,

    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
        end
      }
    }
  }
end

return M
