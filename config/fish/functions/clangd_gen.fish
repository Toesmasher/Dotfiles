function clangd_gen
  make -nw $argv | compiledb -o- > compile_commands.json
end
