---@imports kimpure/sakura.nvim

local lush = require("lush")
local hsluv = lush.hsluv

return {
	bg0 = hsluv(300, 6, 8),
	bg1 = hsluv(300, 6, 14),
	bg2 = hsluv(300, 8, 18),
	bg3 = hsluv(300, 8, 36),

	vs0 = hsluv(310, 12, 20),
	vs1 = hsluv(310, 6, 12),

	fg0 = hsluv(0, 25, 80),
	fg1 = hsluv(0, 25, 70),
	fg8 = hsluv(0, 15, 65),
	fg9 = hsluv(0, 10, 55),

	er0 = hsluv(7, 55, 50),
	er9 = hsluv(7, 55, 20),

	yl0 = hsluv(40, 40, 60),
	yl8 = hsluv(40, 40, 30),
	yl9 = hsluv(40, 40, 20),

	sr0 = hsluv(300, 40, 65),
	sr1 = hsluv(300, 35, 55),
	sr9 = hsluv(300, 35, 20),

	gr0 = hsluv(150, 35, 60),
	gr9 = hsluv(150, 35, 20),

	gb0 = hsluv(260, 35, 60),
	gb1 = hsluv(260, 35, 50),
	gb9 = hsluv(260, 35, 20),

	gp0 = hsluv(270, 50, 65),
	gp1 = hsluv(270, 40, 55),
	gp9 = hsluv(270, 35, 20),

	sa0 = hsluv(340, 35, 65),
	sa1 = hsluv(340, 35, 55),
	sa2 = hsluv(340, 30, 45),

	pi0 = hsluv(310, 15, 60),
	pi1 = hsluv(310, 15, 45),
}
