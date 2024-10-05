
var _chao = place_meeting(x, y + 1, obj_chao);

if (!_chao)
{
	velv += gravidade * global.vel_mult;
}


/*
// Verificando o estado de ataque
if (mouse_check_button_pressed(mb_right))
{
	estado = "ataque";
}*/

// Iniciando a maquina de estados do inimigo esqueleto
switch (estado)
{
	#region parado
	case "parado":
	{
		velh = 0;
		timer_estado++;
		if (sprite_index != spr_inimigo_esqueleto_idle)
		{
			image_index = 0;
		}
		// Comportamento do estado parado
		sprite_index = spr_inimigo_esqueleto_idle;
		
		// Condição de troca de estado
		// Ferido
		if (position_meeting(mouse_x, mouse_y, self))
		{
			if (mouse_check_button_pressed(mb_right))
			{
				estado = "ferido";
			}
		}
		// Em movimento
		if (irandom(timer_estado) > 300)
		{
			estado = choose("andando", "parado", "andando");
			timer_estado = 0;
		}
		// Script de ataque corpo a corpo inimigo em ação
		scr_ataque_corpo_a_corpo_inimigo(obj_jogador, dist_visao, xscale);
		
		break;
	}
	#endregion
	
	#region andando
	case "andando":
	{
		timer_estado++;
		if (sprite_index != spr_inimigo_esqueleto_walk)
		{
			image_index = 0;
			velh = choose(1, -1); // Escolhendo em qual direção andar
		}
		// Comportamento do estado de movimento
		sprite_index = spr_inimigo_esqueleto_walk;
		
		// Caso o inimigo colida com a parede ele muda de direção
		if (place_meeting(x + velh, y, obj_chao)) 
		{
			velh *= -1;
		}
		
		// Caso o inimigo esteja na beirada de uma plataforma ele muda de direção
		if (pode_cair ==  false) 
		{
			if (place_meeting(x + (velh * 10), y + 1, obj_chao) == false)
			{
			// Caso o inimigo não possa cair e não tenha mais chão a sua frente
				velh *= -1;
			}
		}
		
		// Condição de saida do estado de movimento
		if (irandom(timer_estado) > 300)
		{
			estado = choose("parado", "andando", "parado");
			timer_estado = 0;
		}
		scr_ataque_corpo_a_corpo_inimigo(obj_jogador, dist_visao, xscale);
		
		break;
	}
	#endregion
	
	#region ataque
	case "ataque":
	{
		velh = 0;
		if (sprite_index != spr_inimigo_esqueleto_attack)
		{
			image_index = 0;
			posso_causar_dano = true;
		}
		// Comportamento do estado de ataque
		sprite_index = spr_inimigo_esqueleto_attack;
		
		// Condição de saida do estdado de ataque
		if (image_index > image_number - 1)
		{
			estado = "parado";
		}
		// Criando o dano do inimigo
		if (image_index == 5 && dano == noone && posso_causar_dano)
		{
			dano		= instance_create_layer(x + sprite_width/2, y - sprite_height/2, layer, obj_dano);
			dano.dano	= ataque;
			dano.pai	= id;
			posso_causar_dano = false;
		}
		
		// Destruindo o estado de dano
		if (dano != noone && image_index == 7)
		{
			instance_destroy(dano, false);
			dano = noone;
		}
		break;
	}
	#endregion
	
	#region ferido
	case "ferido":
	{	
		if (sprite_index != spr_inimigo_esqueleto_hurt)
		{
			image_index = 0;
			//vida_atual--;
		}
		
		// Comportamento do estado ferido
		sprite_index = spr_inimigo_esqueleto_hurt;
		
		// Condição de troca de estado
		if (image_index > image_number - 1)
		{
			if (vida_atual > 0)
			{
				estado = "parado";
			} else if (vida_atual <= 0)
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
		velh = 0;
		if (sprite_index != spr_inimigo_esqueleto_dead)
		{
			// Garantido que a animação seja executada
			image_index = 0;
		}
		
		// Comportamento do estado morto
		sprite_index = spr_inimigo_esqueleto_dead;
		
		// Fazendo o inimigo morrer sem ficar repetido a animação
		if (image_index > image_number - 1)
		{
			// Parando a animação quando morre
			image_speed = 0;
			image_alpha -= .01;
			
			if (image_alpha <= 0) instance_destroy();
			
		}
		break;
	}
	#endregion

}
