/// @desc Progresso de transição entre fases

if (modo != TRANS_MODO.OFF)
{
	if (modo == TRANS_MODO.INTRO)
	{
		porcentagem = max(0, porcentagem - max((porcentagem/10), 0.005));
	}
	else
	{
		porcentagem = min(1.2, porcentagem + max (((1.2 - porcentagem)/10), 0.005));
	}
	
	if (porcentagem == 1.2) || (porcentagem == 0)
	{
		switch (modo)
		{
			case TRANS_MODO.INTRO:
			{
				modo = TRANS_MODO.OFF;	
				break;
			}
			case TRANS_MODO.NEXT:
			{
				modo = TRANS_MODO.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODO.GOTO:
			{
				modo = TRANS_MODO.INTRO;
				room_goto(alvo);
				break;
			}
			case TRANS_MODO.RESTART:
			{
				game_restart();
				break;
			}
		}
	}
}

