//@desc Evento de colisão com o objeto jogador
if (!obj_jogador.invencivel) { // Só causa dano se o jogador não estiver invencível
    obj_jogador.gerenciador_vida.perdendo_vida(3); // Reduz 1 ponto de vida
    obj_jogador.estado = "ferido"; // Define o estado como 'ferido'
    obj_jogador.invencivel = true; // Ativa o estado de invencibilidade temporária
    obj_jogador.tempo_invencibilidade = room_speed * 2; // Define a duração da invencibilidade (2 segundos)
}
