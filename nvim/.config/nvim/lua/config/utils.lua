function table.unique(tbl)
  local ret, hash = {}, {}
  for _, value in ipairs(tbl) do
    if not hash[value] then ret[#ret + 1] = value end
    hash[value] = true
  end

  return ret
end

function table.merge(...)
  local ret = {}
  for _, tbl in ipairs({ ... }) do
    for key, value in pairs(tbl) do
      ret[type(key) == "number" and #ret + 1 or key] = value
    end
  end

  return ret
end

function table.reduce(tbl, callback, initial)
  local ret = initial or tbl[1]
  for key, value in pairs(tbl) do
    ret = callback(ret, value, key)
  end

  return ret
end

function table.filter(tbl, callback)
  local ret = {}
  for key, value in pairs(tbl) do
    local keep, k = callback(value, key)
    ret[k or #ret + 1] = keep and value or nil
  end

  return ret
end

function table.map(tbl, callback)
  local ret = {}
  for key, value in pairs(tbl) do
    local v, k = callback(value, key)
    ret[k or #ret + 1] = v
  end

  return ret
end

function vim.callback(callback, ...)
  local params = { ... }

  return function()
    return callback(unpack(params))
  end
end
