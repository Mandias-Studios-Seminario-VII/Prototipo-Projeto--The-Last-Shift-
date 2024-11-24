/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (invencivel && (tempo_invencibilidade mod 4 < 2)) {
    // Faz o jogador piscar durante a invencibilidade
    draw_self(); // Alterna entre desenhar e não desenhar
} else if (!invencivel) {
    draw_self(); // Desenha normalmente se não estiver invencível
}
