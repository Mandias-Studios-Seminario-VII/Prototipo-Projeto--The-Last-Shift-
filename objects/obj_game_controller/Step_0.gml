/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (game_over)
{
	global.vel_mult = .5;
	// Alternar entre opções com as setas esquerda e direita
    if (keyboard_check_pressed(vk_left))
    {
        opcao_selecionada = 0; // Tentar Novamente
		audio_play_sound(snd_gameover_cursor_move, 1, false);
    }
    else if (keyboard_check_pressed(vk_right))
    {
        opcao_selecionada = 1; // Sair
		audio_play_sound(snd_gameover_cursor_move, 1, false);
    }
	
	// Seleciona a opção com  a tecla ENTER
    if (keyboard_check_pressed(vk_enter))
    {
		audio_play_sound(snd_gameover_menu_select, 1, false);
        if (opcao_selecionada == 0)
        {
            // Reiniciar o jogo ou a room atual
            room_restart();
        }
        else if (opcao_selecionada == 1)
        {
            // Fechar o jogo
            game_end();
        }
	}
}
else
{
	global.vel_mult = 1;
}

/*
// Testando a tela de game over
if (keyboard_check(vk_up))
{
	game_over = true;
}
else
{
	game_over = false;
}
/*