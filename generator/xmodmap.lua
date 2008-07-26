function xmodmap(keys)
  for code, syms in pairs(keys) do
    io.write(string.format("keycode %3d = %20s %20s %20s %20s\n", code, syms.normal,
     syms.shift, syms.ms, syms.ms_shift))
    end
  end

return xmodmap
