local status, telescope = pcall(require, 'telescope')
if (not status) then
  return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup{
  defaults = {
    file_ignore_patterns = {'^.git/', '^node_modules/'},
    layout_strategy = 'vertical',
    layout_config = { height = 0.8, width = 0.8 },
    sorting_strategy = 'ascending',
    mappings = {
      i = { ['<Leader>q'] = actions.close }
    }
  }
}
telescope.load_extension('frecency')

vim.keymap.set('n', '[[<C-[>]]', function()
  builtin.find_files({ no_ignore = false, hidden = true })
end)

vim.keymap.set('n', '<C-p>', function()
  local function is_git_repo()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir('.git', '.;')
    return vim.fn.fnamemodify(dot_git_path, ':h')
  end
  local opts = {}
  if is_git_repo() then
    opts = { cwd = get_git_root() }
  end
  builtin.find_files(opts)
end)

vim.keymap.set('n', ',b', function()
  builtin.buffers()
end)

vim.keymap.set('n', ',r', function()
  builtin.live_grep({ hidden = true })
end)

vim.keymap.set('n', ',a', function()
  builtin.diagnostics()
end)

vim.keymap.set('n', ',q', function()
  builtin.quickfix()
end)

vim.keymap.set('n', ',f', "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {
  noremap = true,
  silent = true
})

