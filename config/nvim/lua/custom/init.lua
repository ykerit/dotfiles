function format_filter(client)
  local filetype = vim.bo.filetype
  local n = require "null-ls"
  local s = require "null-ls.sources"
  local method = n.methods.FORMATTING
  local available_formatters = s.get_available(filetype, method)

  if #available_formatters > 0 then
    return client.name == "null-ls"
  elseif client.supports_method "textDocument/formatting" then
    return true
  else
    return false
  end
end

function format(opts)
  opts = opts or {}
  opts.filter = format_filter
  return vim.lsp.buf.format(opts)
end

function enable_format_on_save()
  local opts = {
    pattern = "*",
    timeout = 1000,
    async = true,
  }
  vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      format { timeout_ms = opts.timeout, filter = opts.filter }
    end,
  })
end

enable_format_on_save()
