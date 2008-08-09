local evdev_fixes = {
  [113] = 108,
  [115] = 133,
  [116] = 134,
  [98] = 111,
  [100] = 113,
  [104] = 116,
  [102] = 114,
  [112] = 106,
}

function xmodmap_evdev(keys)
  for code, syms in pairs(keys) do
    if evdev_fixes[code] then
      new_code = evdev_fixes[code]
    else
      new_code = code
    end
    io.write(string.format("keycode %3d = %20s %20s %20s %20s\n", new_code, syms.normal,
     syms.shift, syms.ms, syms.ms_shift))
    end
  end

return xmodmap_evdev
