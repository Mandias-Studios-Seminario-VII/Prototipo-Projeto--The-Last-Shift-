/// @desc Progresso de transição entre fases
if (modo != TRANS_MODO.OFF)
{
    if (modo == TRANS_MODO.INTRO)
    {
        // Desacelera a transição enquanto o valor diminui
        porcentagem = max(0, porcentagem - max((porcentagem / 10), 0.005));
    }
    else
    {
        // Acelera a transição enquanto o valor aumenta
        porcentagem = min(1.2, porcentagem + max(((1.2 - porcentagem) / 10), 0.005));
    }
    
    // Verifica se a porcentagem atingiu o limite superior ou inferior com margem de erro
    if (abs(porcentagem - 1.2) < 0.005 || abs(porcentagem - 0) < 0.005)
    {
        switch (modo)
        {
            case TRANS_MODO.INTRO:
                modo = TRANS_MODO.OFF;  // Transição completada
                break;
            case TRANS_MODO.NEXT:
                modo = TRANS_MODO.INTRO;
                room_goto_next();  // Muda para a próxima sala
                break;
            case TRANS_MODO.GOTO:
                modo = TRANS_MODO.INTRO;
                room_goto(alvo);  // Vai para a sala definida em 'alvo'
                break;
            case TRANS_MODO.RESTART:
                game_restart();  // Reinicia o jogo
                break;
        }
    }
}
