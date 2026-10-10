local ls = require("luasnip")
local s  = ls.snippet
local t  = ls.text_node
local i  = ls.insert_node
local f  = ls.function_node

local function class_name()
  local name = vim.fn.expand("%:t:r")
  return name ~= "" and name or "ClassName"
end

return {
  s("php", {
    t({ "<?php", "", "declare(strict_types=1);", "" }),
    t("namespace "), i(1),
    t({ ";", "", "class " }),
    f(class_name, {}),
    t({ "", "\t" }),
    i(0),
    t({ "", "}" }),
  }),
}
