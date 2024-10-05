/// @desc Desenhando efeito visual de transição entre salas
image_alpha = 0;
if (modo != TRANS_MODO.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, larg, porcentagem * alt_metade, false);
	draw_rectangle(0, alt, larg, alt-(porcentagem * alt_metade), false);
}
