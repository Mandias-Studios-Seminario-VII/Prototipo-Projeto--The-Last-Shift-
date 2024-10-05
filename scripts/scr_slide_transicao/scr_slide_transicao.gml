/// @desc scr_slide_transicao (modo, sala_alvo)
/// @arg Mode define o modo de transição entre next, restart e goto.
/// @arg Target define a sala alvo quando estiver usando o modo goto.

function scr_slide_transicao()
{
	with (obj_transicao)
	{
		modo = argument[0];
		if (argument_count > 1) alvo = argument[1];
		
	}
	
}