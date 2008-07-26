function xmodmap(keys)
  for code, syms in pairs(keys) do
    io.write(string.format("keycode %d = %s %s %s %s\n", code, syms.normal,
     syms.shift, syms.ms, syms.ms_shift))
    end
  end

return xmodmap
