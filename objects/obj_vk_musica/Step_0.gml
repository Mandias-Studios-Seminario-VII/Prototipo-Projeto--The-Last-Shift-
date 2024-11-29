/// @desc Evento step do objeto do botão de musica
// Ativando/desativando a musica do jogo
if (keyboard_check_pressed(ord("Y"))) // Verifica se o botão virtual foi pressionado
{
    global.musica_ativa = !global.musica_ativa; // Inverte o estado
    
    if (global.musica_ativa) {
        // Ativa a musica do jogo (define o volume do grupo para 1.0)
        audio_group_set_gain(adg_music, 1.0, 0); // musica
    } else {
        // Desativa a musica do jogo (define o volume do grupo para 0.0)
        audio_group_set_gain(adg_music, 0.0, 0); // musica
    }
}

