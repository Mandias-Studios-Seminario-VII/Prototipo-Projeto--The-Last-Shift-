/// @description Evento Step do obj_camera
// Criando efeito de parallax basico

if (target_follow == noone) exit;

// Fazendo a camera seguir o alvo
x = lerp(x, target_follow.x, .1);
y = lerp(y, target_follow.y, .1);

// Criando efeito de parallax (Sensação de Movimento das imagens de fundo)
var _background_02 = layer_get_id("Background_02");
var _background_03 = layer_get_id("Background_03");
var _background_04 = layer_get_id("Background_04");

layer_x(_background_02, lerp(0, camera_get_view_x(view_camera[0]), 0.7));
layer_x(_background_03, lerp(0, camera_get_view_x(view_camera[0]), 0.5));
layer_x(_background_04, lerp(0, camera_get_view_x(view_camera[0]), 0.3));
