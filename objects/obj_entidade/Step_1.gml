// Caso esteja em movimento
if (velh != 0) xscale = sign(velh);
// Fazendo o jogador vira para a esquerda ou direita
image_xscale = xscale;

// Exibindo o estado quando o usuario mandar
if (position_meeting(mouse_x, mouse_y, id)) 
{
	if (mouse_check_button_released(mb_left))
		mostrar_estado = !mostrar_estado;
}

image_speed = (img_spd / room_speed) * global.vel_mult;
