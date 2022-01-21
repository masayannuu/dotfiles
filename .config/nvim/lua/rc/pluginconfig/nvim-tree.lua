local tree_cb = require'nvim-tree.config'.nvim_tree_callback

function NvimTreeEditClose()
  require'nvim-tree'.on_keypress('edit')
  require'nvim-tree'.close()
end

-- default mappings
-- LuaFormatter off
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "<C-v>",                        cb = tree_cb("vsplit") },
  { key = "<C-x>",                        cb = tree_cb("split") },
  { key = "<C-t>",                        cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "D",                            cb = tree_cb("trash") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "]c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "s",                            cb = tree_cb("system_open") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}
-- LuaFormatter on

vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {'notify', 'packer', 'qf', 'toggleterm'},
  buftype = {'terminal'}
}

require'nvim-tree'.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  update_to_buf_dir = {enable = true, auto_open = true},
  diagnostics = {
    enable = false,
    icons = {hint = "", info = "", warning = "", error = ""}
  },
  update_focused_file = {enable = true, update_cwd = false, ignore_list = {}},
  system_open = {cmd = nil, args = {}},
  filters = {dotfiles = false, custom = {}},
  git = {enable = true, ignore = true, timeout = 500},
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {custom_only = false, list = list},
    number = false,
    relativenumber = true,
    signcolumn = "yes"
  },
  trash = {cmd = "trash", require_confirm = true}
}

vim.keymap.set('n', 'gx', '<Cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})