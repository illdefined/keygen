local rows = { 
  {9},
  {49,10,11,12,13,14,15,16,17,18,19,20,21},
  {23,24,25,26,27,28,29,30,31,32,33,34,35},
  {66,38,39,40,41,42,43,44,45,46,47,48,51,36},
  {52,53,54,55,56,57,58,59,60,61},
}

local xmodmap_signs = {
  ["dollar"] = "$",
  ["ampersand"] = "&",
  ["bracketleft"] = "[",
  ["braceleft"] = "{",
  ["braceright"] = "}",
  ["parenleft"] = "(",
  ["equal"] = "=",
  ["asterisk"] = "*",
  ["parenright"] = ")",
  ["plus"] = "+",
  ["bracketright"] = "]",
  ["exclam"] = "!",
  ["numbersign"] = "#",
  ["period"] = ".",
  ["apostrophe"] = "'", 
  ["semicolon"] = ";",
  ["slash"] = "/",
  ["minus"] = "-",
  ["minus"] = "-",
  ["backslash"] = "\\",
  ["at"] = "@",
  ["Return"] = "¶",
}


function text(keys)
  rows_desc = {}
  for row, codes in pairs(rows) do
    for _, code in pairs(codes) do
      sym = keys[code].normal
      if xmodmap_signs[sym] then
        sym = xmodmap_signs[sym]
      end
      io.write(string.format("%8s ", sym))
    end
    io.write("\n");
  end
end

return text
