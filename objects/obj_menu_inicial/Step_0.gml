/// Configurações das opções do menu do jogo

// Alterando a seleção
menu_x += (menu_x_alvo - menu_x) / menu_vel;

// Teclas virtuais do menu inicial

// Controles do menu
if (menu_controle)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_selecao--;
		if (menu_selecao < 0) menu_selecao = menu_itens - 1;
		audio_play_sound(snd_menu_cursor_move, 1, false);
		show_debug_message("Tecla para cima precionada")
		
	}
	if (keyboard_check_pressed(vk_down))
	{
		menu_selecao++;
		if (menu_selecao >= menu_itens) menu_selecao = 0;
		audio_play_sound(snd_menu_cursor_move, 1, false);
	}
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_alvo = gui_larg + 150;
		menu_ajuste = menu_selecao;
		menu_controle = false;
		audio_play_sound(snd_menu_cursor_select, 1, false);
	}
}

if (menu_ajuste != -1)
{
	switch (menu_ajuste)
	{
		case 0: scr_slide_transicao(TRANS_MODO.NEXT); break; // Novo Jogo
		case 1: // Continuar
		{
			if (!file_exists(SAVEFILE))
			{
				scr_slide_transicao(TRANS_MODO.NEXT)
			}
			else
			{
				var _arquivo = file_text_open_read(SAVEFILE);
				var _alvo = file_text_read_real(_arquivo);
				file_text_close(_arquivo);
				scr_slide_transicao(TRANS_MODO.GOTO, _alvo);
			}
		}
		break;
		case 2: scr_slide_transicao(TRANS_MODO.GOTO, rm_creditos) break;
		case 3: scr_slide_transicao(TRANS_MODO.GOTO, rm_opcoes) break;
		case 4: game_end(); break;
	}

}
