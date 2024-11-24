if (keyboard_check_pressed(ord("T"))) // Verifica se o botão virtual foi pressionado
{
    global.som_ativo = !global.som_ativo; // Inverte o estado
    
    if (global.som_ativo) {
        // Ativa o som (define o volume do grupo para 1.0)
        audio_group_set_gain(adg_music, 1.0, 0); // Músicas
        audio_group_set_gain(adg_snd_effects, 1.0, 0); // Efeitos sonoros
    } else {
        // Desativa o som (define o volume do grupo para 0.0)
        audio_group_set_gain(adg_music, 0.0, 0); // Músicas
        audio_group_set_gain(adg_snd_effects, 0.0, 0); // Efeitos sonoros
    }
}
