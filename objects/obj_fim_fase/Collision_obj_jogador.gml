/// @description Vai para a proxima sala do jogo

with (obj_jogador)
{
	if (tem_controle)
	{
		tem_controle = false;
		scr_slide_transicao(TRANS_MODO.GOTO, other.alvo);
	}
}