local M = {}

M.assign = function(target, tables)
  for _, t in ipairs(tables) do
    for k, v in pairs(t) do
      if type(v) == "table" and type(target[k]) == "table" then
        M.assign(target[k], { v })
      else
        target[k] = v
      end
    end
  end

  return target
end

return M
