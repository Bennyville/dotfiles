local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("heex", { t("<%= "), ls.insert_node(1), t(" %>") }),
}

