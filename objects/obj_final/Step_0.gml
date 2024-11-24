/// @desc Permitindo que o jogador avance as linhas de texto da cena final
// Movendo o jogador para o centro da tela
layer_x("Assets_final", min(layer_get_x("Assets_final")+ 1, res_larg * 0.5 - 32));

letras += spd;
texto = string_copy(textofinal[linha_atual], 1, floor(letras));

if (letras >= len) && (keyboard_check_pressed(vk_enter))
{
	if (linha_atual + 1 == array_length(textofinal))
	{
		scr_slide_transicao(TRANS_MODO.RESTART);
	}
	else
	{
		linha_atual++;
		letras = 0;
		len = string_length(textofinal[linha_atual]);
	}
}