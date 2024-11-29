if (keyboard_check_pressed(ord("T"))) // Verifica se o botão virtual foi pressionado
{
    global.efeitos_ativos = !global.efeitos_ativos; // Inverte o estado
    
    if (global.efeitos_ativos) {
        // Ativa o efeito sonoro do jogo (define o volume do grupo para 1.0)
        audio_group_set_gain(adg_snd_effects, 1.0, 0); // Efeitos sonoros
    } else {
        // Desativa o efeito sonoro do jogo (define o volume do grupo para 0.0)
        audio_group_set_gain(adg_snd_effects, 0.0, 0); // Efeitos sonoros
    }
}
