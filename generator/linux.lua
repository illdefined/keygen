local subst = {
  ["0"] = "zero",
  ["1"] = "one",
  ["2"] = "two",
  ["3"] = "three",
  ["4"] = "four",
  ["5"] = "five",
  ["6"] = "six",
  ["7"] = "seven",
  ["8"] = "eight",
  ["9"] = "nine",
  ["dead_abovedot"] = "VoidSymbol",
  ["dead_abovering"] = "VoidSymbol",
  ["dead_macron"] = "VoidSymbol",
  ["ellipsis"] = "U+2026",
  ["emdash"] = "U+2014",
  ["endash"] = "U+2013",
  ["EuroSign"] = "euro",
  ["infinity"] = "U+221E",
  ["KP_Begin"] = "VoidSymbol",
  ["KP_Decimal"] = "period",
  ["KP_Delete"] = "Delete",
  ["KP_Down"] = "Down",
  ["KP_End"] = "End",
  ["KP_Equal"] = "equal",
  ["KP_Home"] = "Home",
  ["KP_Insert"] = "Insert",
  ["KP_Left"] = "Left",
  ["KP_Next"] = "PageDown",
  ["KP_Prior"] = "PageUp",
  ["KP_Right"] = "Right",
  ["KP_Up"] = "Up",
  ["Mode_switch"] = "AltGr",
  ["Multi_key"] = "Compose",
  ["NoSymbol"] = "VoidSymbol",
  ["numerosign"] = "U+2116",
  ["thinspace"] = "U+2009",
  ["eth"] = "VoidSymbol",
  ["Eth"] = "VoidSymbol",
  ["thorn"] = "VoidSymbol",
  ["Thorn"] = "VoidSymbol",
}

function linux(keys)
  io.write("alt_is_meta\n")
  io.write("strings as usual\n")
  io.write("compose as usual\n")
  io.write("include \"linux-keys-bare\"\n")

  io.write("keymaps 0-3\n")
  io.write("keycode 58 = Control\n")

  for code, syms in pairs(keys) do
    for k, v in pairs(syms) do
      if subst[v] then
        syms[k] = subst[v]
      else
        syms[k] = string.gsub(syms[k], "U(%d+)", "U+%1")
      end
    end
    new_code = code - 8
    if string.len(syms.normal) == 1 then
      io.write(string.format("keycode %3d = %20s\n", new_code, syms.normal))
    else
      io.write(string.format("keycode %3d = %20s %20s %20s %20s\n", new_code, syms.normal,
       syms.shift, syms.ms, syms.ms_shift))
    end
  end
end

return linux
