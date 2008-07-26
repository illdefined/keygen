local qwerty = require("qwerty_map")

function grub(keys)
  for code, syms in pairs(keys) do
    io.write(string.format("setkey %s %s\n", syms.normal, 
     qwerty[tonumber(code)].normal))
    end
  end

return grub
