/// @desc Evento create do objeto de creditos do jogo
// Posição inicial do texto (centralizado verticalmente)
y_texto = display_get_gui_height() - 50; // Ajuste 50 para a posição inicial desejada, usando display_get_gui_height()

// Centraliza horizontalmente
x_texto = display_get_gui_width() / 2; 

// Velocidade de rolagem para cima
velocidade = 1.5;

creditos = [
    ["The Last Shift", ""],
    ["Produtor", "Yhugo Gabriel"],
    ["Programador Lider", "Yhugo Gabriel"],
    ["Diretor Tecnico", "Yhugo Gabriel"],
    ["Programador", "Yhugo Gabriel"],
    ["Diretor de Arte", "Enderson Gabriel"],
    ["Artista Conceitual", "Enderson Gabriel"],
    ["Artista Tecnico", "Elson Davi"],
    ["Artista de Storyboard", "Yhugo Gabriel"],
    ["Artista de UI", "Yhugo Gabriel"],
    ["Creative Director", "Yhugo Gabriel"],
    ["Designer de Jogos", "Nelson Machado"],
    ["Designer de Som", "Yhugo Gabriel"],
    ["Lider de QA", "Yhugo Gabriel"],
    ["Equipe de QC", "Yhugo/Elson/Nelson/Victor/Enderson"],
    ["Sprites do personagem", "Mucho Pixels"],
    ["Pacote de Tileset do Jogo", "Craftpix.net"],
    ["Controles de Tela", "Kenney.nl"],
    ["Fonte Monogram", "datagoblin"],
    ["Fonte Bitwise", "Dafont.com"],
    ["Fonte Game Paused", "Dafont.com"],
    ["Fonte VCR OSD Mono", "Dafont.com"],
    ["Efeitos Sonoros", "Yatch Club Games"],
    ["Musica da Fase 01", "OpenGameArt.org"],
    ["Musica do Menu inicial", "OpenGameArt.org"],
    ["Musica da Tela de Creditos", "Trevor Lentz"],
    ["Musica da cena de corte", "Yubatake/Opengameart.org"]
];

espacamento = 58;

