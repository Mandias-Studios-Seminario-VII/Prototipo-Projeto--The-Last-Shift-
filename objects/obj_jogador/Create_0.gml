// Adicionando uma camera para seguir o jogador
var _camera = instance_create_layer(x, y, layer, obj_camera);
_camera.target_follow = id;

// Inherit the parent event
event_inherited();



vida_max = 10;
vida_atual = vida_max;
gerenciador_vida = new ScrgerenciadorVida(vida_max)

invencivel = false; // Controle de invencibilidade
tempo_invencibilidade = 0; // Temporizador para controlar a duração da invencibilidade
estado = "parado"; // Garante que o jogador tenha um estado inicial definido



max_velh = 3;
max_velv = 8;
roll_vel = 6;
vel = 0.6
pulo_duplo = 2;
mostrar_estado = true;
img_spd = 30;
tem_controle = true;
is_jumping = false; // Variavel de som caso esteja em pulo
is_landed = false; // Variavel de som caso tenha aterrissado
is_on_ladder = false; // Confirmação se está ou não na escada

if (!instance_exists(obj_sound_manager)) {
    instance_create_layer(x, y, layer, obj_sound_manager);
}
sound_manager = instance_find(obj_sound_manager, 0);
