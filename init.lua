-- gruberdarker.lua --- Gruber Darker color theme for NeoVim.
-- 
-- https://github.com/rexim/gruber-darker-theme/blob/master/gruber-darker-theme.el
--
-- Commentary:
--
--Gruber Darker color theme for Emacs by Jason Blevins. A darker
--variant of the Gruber Dark theme for BBEdit by John Gruber. Variant
--by Alexey Kutepov a.k.a. rexim for Emacs. Adapted for Neovim

local g = {}

local colors = {
	gruberDarkerFg = "#e4e4ef",
	gruberDarkerFg1 = "#f4f4ff",
	gruberDarkerFg2 = "#f5f5f5",
	gruberDarkerWhite = "#ffffff",
	gruberDarkerBlack = "#000000",
	gruberDarkerBgBlack1 = "#101010",
	gruberDarkerBg = "#181818",
	gruberDarkerBg1 = "#282828",
	gruberDarkerBg2 = "#453d41",
	gruberDarkerBg3 = "#484848",
	gruberDarkerBg4 = "#52494e",
	gruberDarkerRed1 = "#c73c3f",
	gruberDarkerRed = "#f43841",
	gruberDarkerRedPlus1 = "#ff4f58",
	gruberDarkerGreen = "#73c936",
	gruberDarkerYellow = "#ffdd33",
	gruberDarkerBrown = "#cc8c3c",
	gruberDarkerQuartz = "#95a99f",
	gruberDarkerNiagara2 = "#303540",
	gruberDarkerNiagara1 = "#565f73",
	gruberDarkerNiagara = "#96a6c8",
	gruberDarkerWisteria = "#9e95c7",
}

colors.fg = colors.gruberDarkerFg
colors.fg_1 = colors.gruberDarkerFg1
colors.fg_2 = colors.gruberDarkerFg2

colors.bg = colors.gruberDarkerBg
colors.bg_1 = colors.gruberDarkerBg1
colors.bg_2 = colors.gruberDarkerBg2

colors.cursor = colors.gruberDarkerYellow
colors.yellow = colors.gruberDarkerYellow
colors.comment = colors.gruberDarkerBrown


local hlgroups = {
	Comment      = { fg = colors.comment, bg = colors.bg, bold = true },

	Normal       = { fg = colors.fg, bg = colors.bg },

	Character    = { fg = colors.yellow },
	Constant     = { fg = colors.yellow },
	Number       = {},
	Boolean      = { fg = colors.yellow },
	Float        = {},
	Conditional  = {},
	Statement    = { fg = colors.yellow },
	Repeat       = {},
	Label        = {},
	Keyword      = {},
	Exception    = {},
	Include      = { fg = colors.gruberDarkerQuartz },
	Prefoc       = {},
	Define       = { fg = colors.yellow },
	Macro        = {},
	PreCondit    = {},
	StorageClass = {},
	Type         = { fg = colors.gruberDarkerQuartz },
	Struct       = { fg = colors.yellow },
	Typedef      = { fg = colors.yellow },
	Tag          = {},

	Cursor       = { fg = colors.bg, bg = colors.cursor },
	MsgArea      = { fg = colors.fg, bg = colors.bg },
	StatusLine   = { fg = colors.fg_1, bg = colors.bg_1 },
	Directory    = { fg = colors.gruberDarkerNiagara, bg = colors.bg },
	ErrorMsg     = { fg = colors.gruberDarkerRedPlus1, bg = colors.bg_1 },
	MoreMsg      = { fg = colors.yellow, bg = colors.bg_1 },
	Search       = { fg = colors.gruberDarkerWhite, bg = colors.gruberDarkerQuartz },
}

function g.schema()
	if vim.g.color_name ~= "gruberdarker" then
		vim.cmd("hi clear")
	end

	vim.g.color_name = "gruberdarker"
	vim.o.termguicolors = true

	for group, color in pairs(hlgroups) do
		if not vim.tbl_isempty(color) then
			if color.link then
				vim.cmd("hi! link" .. group .. " " .. color.link)
			else
				local fg = color.fg and "guifg=" .. color.fg .. " " or ""
				local bg = color.bg and "guibg=" .. color.bg .. " " or ""
				local style = color.style and "gui=" .. color.style .. " " or ""
				local guisp = color.guis and "guisp=" .. color.style .. " " or ""
				vim.cmd("hi " .. group .. " " .. fg .. bg .. style .. guisp)
			end
		end
	end
end

return g
