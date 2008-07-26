local qwerty = require("qwerty_map")

function grub(keys)
  for code, syms in pairs(keys) do
    for i, v in ipairs({'normal', 'shift'}) do
      sym_in = syms[v]
      sym_grub = qwerty[tonumber(code)][v]
      if sym_in ~= sym_grub then
        io.write(string.format("setkey %s %s\n", sym_in, sym_grub))
      end
    end
  end
end

return grub
