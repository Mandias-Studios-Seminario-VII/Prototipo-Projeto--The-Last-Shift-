/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (target_follow == noone) exit;

// Fazendo a camera seguir o alvo
x = lerp(x, target_follow.x, .1);
y = lerp(y, target_follow.y, .1);

// Criando efeito de parallax (Sensação de Movimento das imagens de fundo)
var _mountains = layer_get_id("Background_Mountains");
var _graveyard = layer_get_id("Background_Graveyard");

layer_x(_mountains, lerp(0, camera_get_view_x(view_camera[0]), 0.7));
layer_x(_graveyard, lerp(0, camera_get_view_x(view_camera[0]), 0.5));
