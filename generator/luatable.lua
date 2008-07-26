function luatable(keys)
  io.write("return {\n")
  for code, syms in pairs(keys) do
    io.write(string.format("[%d] = {normal = %q, shift = %q, ms = %q, ms_shift = %q },\n", code, syms.normal, syms.shift, syms.ms, syms.ms_shift))
  end
  io.write("}\n")
end

return luatable
