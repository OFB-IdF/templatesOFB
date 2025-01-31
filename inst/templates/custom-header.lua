-- Fonction pour convertir un nombre en chiffres romains
local function to_roman(num)
  local roman_numerals = {
    {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"},
    {100, "C"}, {90, "XC"}, {50, "L"}, {40, "XL"},
    {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"},
    {1, "I"}
  }
  local result = ""
  for _, pair in ipairs(roman_numerals) do
    while num >= pair[1] do
      result = result .. pair[2]
      num = num - pair[1]
    end
  end
  return result
end

-- Variables globales pour suivre la numérotation
local counters = {0, 0, 0, 0} -- Pour h2, h3, h4 (h1 est ignoré)

function Header(el)
  if el.level == 1 then
    -- Supprimer la numérotation pour h1
    el.attributes.number = nil
    return el
  elseif el.level == 2 then
    -- Incrémenter le compteur de h2 et réinitialiser les suivants
    counters[1] = counters[1] + 1
    counters[2], counters[3], counters[4] = 0, 0, 0
    el.content:insert(1, pandoc.Str(to_roman(counters[1]) .. ". "))
  elseif el.level == 3 then
    -- Incrémenter le compteur de h3 et réinitialiser les suivants
    counters[2] = counters[2] + 1
    counters[3], counters[4] = 0, 0
    el.content:insert(1, pandoc.Str(to_roman(counters[1]) .. "." .. counters[2] .. " "))
  elseif el.level == 4 then
    -- Incrémenter le compteur de h4
    counters[3] = counters[3] + 1
    el.content:insert(1,
      pandoc.Str(to_roman(counters[1]) .. "." .. counters[2] .. "." .. counters[3] .. " "))
  end

  return el
end
