hs.hotkey.bind({"ctrl"}, "t", function()
    local kitty = hs.application.get("kitty")
    if kitty == nil then
        hs.application.launchOrFocus("/Applications/kitty.app")
    elseif kitty:isFrontmost() then
        kitty:hide()
    else
        hs.application.launchOrFocus("/Applications/kitty.app")
    end
end)

-- hs.hotkey.bind({"ctrl"}, "o", function()
--     local kitty = hs.application.get("alacritty")
--     if kitty == nil then
--         hs.application.launchOrFocus("/Applications/Alacritty.app")
--     elseif kitty:isFrontmost() then
--         kitty:hide()
--     else
--         hs.application.launchOrFocus("/Applications/Alacritty.app")
--     end
-- end)
