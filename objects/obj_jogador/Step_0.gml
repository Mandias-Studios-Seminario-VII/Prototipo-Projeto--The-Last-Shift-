// Checando se o jogador esta tocando o chão
var _chao = place_meeting(x, y + 1, obj_chao);

// Variaveis de Movimentação e ataque
if (tem_controle)
{
	var _jump, _down, _up, _left, _right, _attack, _roll;

	_jump	= keyboard_check_pressed(vk_space);
	_down	= keyboard_check_pressed(vk_down);
	_up		= keyboard_check_pressed(vk_up);
	_left	= keyboard_check(vk_left);
	_right	= keyboard_check(vk_right);
	_attack = keyboard_check_pressed(vk_enter);
	_roll	= keyboard_check_pressed(ord("Q"));

	if (attack_buff > 0) attack_buff -= 1;

	// Controles de Movimento do jogador
	velh = (_right - _left) * max_velh * global.vel_mult;

	// Adcionando velocidade vertical (gravidade)
	velv += gravidade * global.vel_mult;

	// Limitando a gravidade
	velv = clamp(velv, -max_velv, max_velv * 2);
	
}
else
{
	_jump		= 0;
	_down		= 0;
	_up			= 0;
	_left		= 0;
	_right		= 0;
	_attack		= 0;
	_roll		= 0;
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
		// Atacando
		else if (_attack)
		{
			estado = "ataque";
			image_index = 0;
		}
		// Deslizando
		else if (_roll)
		{
			estado = "deslizando";
			image_index = 0;
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
		// Atacando
		else if (_attack)
		{
			estado = "ataque";
			velh = 0;
			image_index = 0;
		}
		// Deslizando
		else if (_roll)
		{
			estado = "deslizando";
			image_index = 0;
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
		} else
		{
			// Comportamento do estado de pulo
			sprite_index = spr_jogador_jump;
			// Evintado que a animação de pulo se repita
			if (image_index >= image_number - 1)
			{
				image_index = image_number - 1;
			}
		}
		
		// Condição de troca de estado
		// No chão
		if (_attack)
		{
			estado = "ataque aereo";
		}
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
	/*case "escada":
	{
		if (_up || _down)
		{
			if place_meeting(x, y, obj_escada) = escada = true;
		}
		break;
	}*/
	#endregion
	
	#region ataque
	case "ataque":
	{
		if (!is_attacking)
		{
			if (sound_manager != noone) 
			{
				sound_manager.attack_snd = true;
			}
			is_attacking = true;
		}
		if (combo == 0)
		{
		// Comportamento do estado de ataque 01
		sprite_index = spr_jogador_attack01;
		} else if (combo == 1)
		{
			// Comportamento do estado de ataque 02
			sprite_index = spr_jogador_attack02;
		} else if (combo == 2)
		
		// Configuração do buffer de ataque do jogador
		if (_attack && combo < 1)
		{
			attack_buff = room_speed;
		}
		
		// Condição para fazer combo
		if (attack_buff && combo < 1 && image_index >= image_number - 1)
		{
			combo++;
			image_index = 0;
			posso_causar_dano = true;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone
			}
			
			attack_buff = 0;
		}
		
		// Adicionando o objeto de dano
		if (image_index >= 2 && dano == noone && posso_causar_dano)
		{
			dano			  = instance_create_layer(x + sprite_width / 2, y - sprite_height / 2, layer, obj_dano);
			dano.dano		  = ataque * attack_multiplier;
			dano.pai		  = id;
			posso_causar_dano = false;
		}
		
		// Saindo do estado de ataque
		if (image_index > image_number-1) // Imagem inicial maior que total de imagens
		{
			estado = "parado";
			combo = 0;
			posso_causar_dano = true;
			attack_multiplier += .5;
			is_attacking = false;
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone
			}
			
		}
		if (_roll)
		{
			estado = "deslizando";
			image_index = 0;
			combo = 0;
			is_attacking = false;
			// Caso jogador deslizer apos a animação de dano o dano é cancelado
			if (dano)
			{
				instance_destroy(dano, false);
				dano = noone;
			}
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
			if (sound_manager != noone && !was_hit)
			{
				sound_manager.damage_snd = true;
				was_hit = true;
			}
		}
		// Fazendo o jogador ficar parado ao levar dano por alguns instantes
		velh = 0;
		
		// Condição de troca de estado
		if (image_index > image_number - 1)
		{
			if (vida_atual > 0)
			{
				estado = "parado";
				was_hit = false; // Resetando o efeito sonoro de ferido
			} else if (vida_atual <= 0) // Verificando se o jogador perdeu toda a vida, então ele morre
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
	
	#region deslizando
	case "deslizando":
	{
		if (sprite_index != spr_jogador_slide)
		{
			// Comportamento do estado deslizando
			sprite_index = spr_jogador_slide;
			image_index = 0;
		}
		
		// Adcionando velocidade ao deslizar
		velh = image_xscale * roll_vel;
		
		// Saindo do estado de deslizar
		if (image_index >= image_number - 1 || !_chao)
		{
			estado = "parado";
		}
		break;
	}
	#endregion
	
}

