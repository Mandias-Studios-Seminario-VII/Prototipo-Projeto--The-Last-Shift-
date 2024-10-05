// Adicionando uma camera para seguir o jogador
var _camera = instance_create_layer(x, y, layer, obj_camera);
_camera.target_follow = id;

// Inherit the parent event
event_inherited();



vida_max = 8;
vida_atual = vida_max;

max_velh = 3;
max_velv = 8;
roll_vel = 6;
pulo_duplo = 2;

mostrar_estado = true;
combo = 0;
img_spd = 30;
dano = noone;
ataque = 1;
posso_causar_dano = true;
attack_multiplier = 1;
attack_buff = room_speed;
tem_controle = true;
is_jumping = false; // Variavel de som caso esteja em pulo
is_attacking = false // Variavel de som caso esteja atacando
was_hit = false; // Variavel de som caso esteja sendo atingido
is_landed = false; // Variavel de som caso tenha aterrissado

if (!instance_exists(obj_sound_manager)) {
    instance_create_layer(x, y, layer, obj_sound_manager);
}
sound_manager = instance_find(obj_sound_manager, 0);