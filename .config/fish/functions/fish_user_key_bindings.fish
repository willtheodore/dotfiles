function fish_user_key_bindings
    fish_vi_key_bindings insert

    # Customs
    bind -M insert \t accept-autosuggestion
end
