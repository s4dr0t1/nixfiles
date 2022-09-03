# [Neovim](https://neovim.io/)

## Table of contents

- [Shortcuts](#shortcuts)
	- [Plugin management](#plugin-management)
	- [Filesystem explorer](#filesystem-explorer)
	- [Editing shenanigans](#editing-shenanigans)
	- [Buffer movement](#buffer-movement)
	- [Finding stuff really fast using Telescope](#finding-stuff-really-fast-using-telescope)
	- [LSP](#lsp)

## Shortcuts

### Plugin management

- Plugin are managed with the help of [Packer](https://github.com/wbthomason/packer.nvim)
- When opening neovim for the first time, Packer gets installed automatically if it doesn't exist already
- Upon every change to the plugins file (`./lua/core/packer.lua`), a `:PackerSync` operation will start automatically to install new plugins


Shortcut | Description
-|-
`:PackerSync` | Perform `:PackerUpdate` and `:PackerCompile`


### Filesystem explorer

These shortcuts depend upon [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua).

Shortcut | Description
-|-
`<C-b>`     | Toggle the explorer on and off
`<leader>d` | Delete the file, requires confirmation.
`<leader>c` | Copy the file.
`<leader>x` | Cut the file.
`<leader>p` | Paste the file in the current folder.
`<leader>a` | Create a new file.
`<leader>r` | Rename the file.

### Editing shenanigans

- Check how to use snippets in this [documentation](https://github.com/rafamadriz/friendly-snippets/wiki/C), uses [friendly-snippets](https://github.com/rafamadriz/friendly-snippets), [luasnip](https://github.com/L3MON4D3/LuaSnip) and [cmp_luasnip](saadparwaiz1/cmp_luasnip)

```
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```
Shortcut | Description | Usage
-|-|-
K/ J | Go to visual mode, select the lines you want to move and move them using the shortcuts specified | Text movement
`<C-t>` | Similar to ctags, show all symbols (uses the [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) plugin) | See all symbols
`<C-j>` and `<C-k>` | Move down and up respectively in the autocompletion suggestion window, or just simply use `<TAB>`| Autocompletion
`<C-Space>` | Invoke the autocompletion menu | Autocompletion
`<C-e>` | Stop the autocompletion menu from showing | Autocompletion
`<C-b>` and `<C-f>` | Move up and down in the documentation window | Autocompletion
`<leader>t` | Show the terminal, uses [toggleterm](https://github.com/akinsho/toggleterm.nvim), or use `:! <command>` to execute one-liners.
`"+y` | Yank to the system clipboard.

### Buffer movement

- It's all about having smooth movements from one thing to another, say one buffer to another, and the likes.
- Watch this video to understand more about buffers, tabs and registers: [Link](https://youtu.be/vJAmjAax2H0?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)

Shortcut | Description
-|-
`:sp`   | Create a horizontal split on the downward side
`:vsp`   | Create a vertical split on the right
`:bd <bufferIdentifier>` | Close a specific buffer, if no identifier is provided, the current one will be closed.
`<C-h>` | Move to the left buffer
`<C-l>` | Move to the right buffer
`<C-k>` | Move to the upper buffer
`<C-k>` | Move to the bottom buffer
`<S-h>` | Move to the left buffer according to tab ordering in bufferline.nvim
`<S-l>` | Move to the right buffer according to tab ordering in bufferline.nvim
`<C-arrow_keys>` | Resize buffers
`<C-w>q` | Close the current tab


### Finding stuff really fast using Telescope

All the mappings are present [here](https://github.com/nvim-telescope/telescope.nvim#default-mappings)

Shortcut | Description
-|-
`<leader>ff` | Look for files using Telescope
`<leader>fg` | Live grep code using Telescope
`<leader>fb` | Search for buffers using Telescope
`<C-j>` and `<C-k>` | Move up and down in the search results in insert mode
`<C-p>` and `<C-n>` | Cycle through the search history in insert mode
`<ESC>` | Exit the telescope


### LSP

Shortcut | Description
-|-
`:LspInfo` | Check information about LSP and which server is active.
`:Mason` or `<leader>m` | Open Mason, use `q` to quit Mason.
`gl` | Open the message box to see diagnostic information.
`gd` | Go to the definition of the current symbol.
`gD` | Go to the declaration of the current symbol.
`<C-k>` and `K` | Similar to the hover capability in Visual Studio Code, get information about the thing under the cursor. The second one is for getting information regarding the signature.
`gi` | To-do
`gr` | Check references to the symbol under the cursor.
`gj` and `gk`| Jump between where the errors are.
`gm` | Show all diagnostic information, similar to <CTRL> + M from Visual Studio Code.
