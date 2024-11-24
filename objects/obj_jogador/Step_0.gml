// Checando se o jogador está tocando o chão ou o topo de uma caixa
var _chao = place_meeting(x, y + 1, obj_chao) || place_meeting(x, y + 1, obj_caixa);


// Empurrando a caixa
if (place_meeting(x + velh, y, obj_caixa)) {
    // Referência à caixa próxima
    var caixa = instance_place(x + velh, y, obj_caixa);

    if (caixa != noone) {
        // Empurra a caixa na direção horizontal
        caixa.velh = velh;
    }
}

// Corrige a posição ao cair na caixa
if (place_meeting(x, y + 1, obj_caixa)) {
    var caixa = instance_place(x, y + 1, obj_caixa);
    if (caixa != noone) {
        y = caixa.bbox_top - sprite_height / 2; // Posiciona no topo da caixa
    }
}

// Verificar se a vida chegou a zero
if (gerenciador_vida.vida_atual <= 0 && estado != "morto") {
    // Mudar o estado para "game_over"
    estado = "morto";
}


// Gerenciamento da invencibilidade
if (invencivel) {
    tempo_invencibilidade -= 1; // Decrementa o temporizador
    if (tempo_invencibilidade <= 0) {
        invencivel = false; // Desativa a invencibilidade
    }
}

// Variaveis de Movimentação e ataque
if (tem_controle)
{
	var _jump, _movimento_vertical, _right, _left;

	_jump				= keyboard_check_pressed(vk_space);
	_movimento_vertical = keyboard_check(vk_up) - keyboard_check(vk_down);
	_right				= keyboard_check(vk_right);
	_left				= keyboard_check(vk_left);

	// Controles de Movimento do jogador
	velh = (_right - _left) * max_velh * global.vel_mult;

	// Adcionando velocidade vertical (gravidade)
	if (!is_on_ladder)
	{
		velv += gravidade * global.vel_mult;
	}
	// Limitando a gravidade
	velv = clamp(velv, -max_velv, max_velv * 2);
	
}
else
{
	_jump					= 0;
	_movimento_vertical		= 0;
	_left					= 0;
	_right					= 0;
}

// Iniciando a maquina de estados do jogador
switch (estado)
{
	#region parado
	case "parado":
	{
		// Comportamento do estado parado
		sprite_index = spr_jogador_idle;
		is_jumping = false;
		
		// Condições de troca de estado
		// Em Movimento
		if (velh != 0)
		{
			estado = "movendo";
		}
		// Pulando
		else if (_jump && _chao)
		{	
			estado = "pulando";
			velv = -max_velv;
			image_index = 0; // Garate que animação sempre inicia no primeiro sprite
			is_jumping = true;
			
			// Toca o som de pulo
			if (sound_manager != noone) 
			{
				sound_manager.jump_snd = true;
			}
	}
		
		if (place_meeting(x, y, obj_escada)) 
		{
			estado = "escada";
		velv = 0; // Zera a velocidade vertical ao entrar na escada
		}
		
		
		if (is_landed)
		{
			if (sound_manager != noone)
			{
				sound_manager.land_snd = true;
			}
			is_landed = false;
		}
		break;
	}
	#endregion
	
	#region movendo
	case "movendo":
	{
		// Comportamento do estado em movimento
		sprite_index = spr_jogador_run;
		
		// Codições de troca de estado
		// Parado
		if (abs(velh) < .1)
		{
			estado = "parado";
			velh = 0;
		}
		// Pulando
		else if (_jump && _chao)
		{
			estado = "pulando";
			velv = -max_velv;
			image_index = 0;
			is_jumping = true;
			
			if (sound_manager != noone) 
			{
				sound_manager.jump_snd = true;
			}
		}
		break;
	}
	#endregion
	
	#region pulando
	case "pulando":
	{
		if (velv > 0)
		{
			// Jogador caindo
			sprite_index = spr_jogador_falling;
		}
		{
			// Comportamento do estado de pulo
			sprite_index = spr_jogador_jump;
			// Evintado que a animação de pulo se repita
			if (image_index >= image_number - 1)
			{
				image_index = image_number - 1;
			}
		}
		
		if (place_meeting(x, y, obj_escada)) 
		{
			estado = "escada";
			velv = 0; // Zera a velocidade vertical ao entrar na escada
		}
		
		// Condição de troca de estado
		// No chão
		if (_chao)
		{
			estado = "parado";
			velh = 0;
			is_landed = true; // Jogador aterrissou
		}
		break;
	}
	#endregion
	
	#region escada
	
	// Caso esteja perto de ou em uma escada
	case "escada":
	{
		if (place_meeting(x, y, obj_escada))
		{
			// Define a sprite somente se ela não estiver configurada
			if (sprite_index != spr_jogador_climb)
			{
				sprite_index = spr_jogador_climb;
				image_index = 0;  // Garante que a animação começa do início apenas uma vez
			}

			is_on_ladder = true;
			velv = 0;  // Zera a velocidade vertical padrão enquanto sobe
		}
		else
		{
			is_on_ladder = false;
			estado = "parado"; // Sai do estado de escada se não estiver mais colidindo
		}
		
		// Caso estiver na escada
		if (is_on_ladder)
		{
			// Desativando a gravidade
			velv = 0
			
			/*if (_movimento_vertical == 1) velv = -2
			if (_movimento_vertical == -1) velv = 2*/
			
			// Subindo e descendo a escada
			if (_movimento_vertical != 0) velv = _movimento_vertical * -1
		}
		
		// Verificando se pode pular, mas somente se estiver no chão
		if (_jump && _chao)
		{
			velv = -max_velv; // Dá impulso vertical
            estado = "pulando";
		}
		
		// Sai da escada ao chegar no topo ou base
        if (!place_meeting(x, y + sign(_movimento_vertical), obj_escada)) {
            estado = "parado"; // Define o próximo estado dependendo do contexto
        }
		
		// Em caso de colisão no eixo x
		if (place_meeting(x + velh, y, obj_chao))
		{
			while (!place_meeting(x + sign(velh), y, obj_chao))
			{
				x += sign(velh)
			}
			velh = 0;
		}
		
		// Em caso de colisão no eixo y
		if (place_meeting(x , y + velv, obj_chao))
		{
			while (!place_meeting(x , y + sign(velv), obj_chao))
			{
				y += sign(velv);
			}
			velv = 0
		}
		
		break;
	}
	#endregion
	
	#region ferido
	case "ferido":
	{	
		if (sprite_index != spr_jogador_hurt)
		{
			// Comportamento do estado ferido
			sprite_index = spr_jogador_hurt;
			image_index = 0;
			
			// Tremendo a tela
			screenshake(3);
			
			// Adicionando o efeito sonoro de dano
			if (sound_manager != noone)
			{
				sound_manager.damage_snd = true;
			}
		}
		
		// Condição de troca de estado
		if (image_index > image_number - 1)
		{
			if (vida_atual > 0)
			{
				estado = "parado";
				was_hit = false; // Resetando o efeito sonoro de ferido
			} else if (gerenciador_vida.vida_atual <= 0 && estado != "morto") // Verificando se o jogador perdeu toda a vida, então ele morre
			{
				estado = "morto";
			}
		}
		break;
	}
	#endregion
	
	#region morto
	case "morto":
	{
		// Verificando se o controlador do jogo está funcionando
		if (instance_exists(obj_game_controller))
		{
			with(obj_game_controller)
			{
				game_over = true;
			}
		}
		
		velh = 0;		
		if (sprite_index != spr_jogador_dead)
		{
			// comportamento do estado morto
			image_index = 0;
			sprite_index = spr_jogador_dead;
			
			// Adicionando efeito sonoro de game-over
			if (sound_manager != noone)
			{
				sound_manager.game_over_snd = true;
			}
		}
		// fazendo o jogador parar após a animação de morte
		if (image_index >= image_number - 1)
		{
			image_index = image_number - 1;
		}
		
		break;
	}
	#endregion
		
}

