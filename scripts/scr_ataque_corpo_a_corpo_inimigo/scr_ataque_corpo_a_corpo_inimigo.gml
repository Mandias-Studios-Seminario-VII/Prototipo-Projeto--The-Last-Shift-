
function scr_ataque_corpo_a_corpo_inimigo(){

	///@arg _jogador
	///@arg dist_visao
	///@arg xscale

	var outro = argument0;
	var dist_visao = argument1;
	var xscale = argument2;

	// Verificando se o jogador está na linha de visão do inimigo
	var _jogador = collision_line(x, y - sprite_height/4, x + (dist_visao * xscale), y - sprite_height/4, outro, 0, 1);

	// Caso o jogador entrar na linha de visão do inimigo, ele ataca
	if (_jogador)
	{
		estado = "ataque";
	}
}
