/// @desc Algumas variaveis de tamanho e configurações de modo
larg = display_get_gui_width(); // largura da tela
alt = display_get_gui_height(); // altura da tela
alt_metade = alt * 0.5; // Metade da altura
enum TRANS_MODO
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

modo = TRANS_MODO.INTRO;
porcentagem = 0;
alvo = room;
