/// @desc Evento Post-Draw do objeto pausa
gpu_set_blendenable(false);

if (esta_pausado)
{
	surface_set_target(application_surface);
		if (surface_exists(pausa_superf)) draw_surface(pausa_superf, 0, 0);
		else
		{
			// Capturando o momento em que o jogo foi pausado (NÃO CAPTURA conteudos de eventos draw_gui)
			pausa_superf = surface_create(largura_res, altura_res);
			buffer_set_surface(pausa_superf_buffer, pausa_superf, 0);
			
		}
	surface_reset_target();
}

if (keyboard_check_pressed(ord("E"))) // Ativa a pausa do jogo
{
	if(!esta_pausado) // Pausando o jogo se estiver falso
	{
		esta_pausado = true;
		
		// Desativa todas as instancias menos esta
		instance_deactivate_all(true);
		
		// Captura o momento atual do jogo para pausa (NÃO CAPTURA conteudo de eventos draw gui)
		pausa_superf = surface_create(largura_res, altura_res);
		surface_set_target(pausa_superf);
			draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		// Faz o backup da superficie no caso de perda
		if (buffer_exists(pausa_superf_buffer)) buffer_delete(pausa_superf_buffer);
		pausa_superf_buffer = buffer_create(largura_res * altura_res * 4, buffer_fixed, 1);
		buffer_get_surface(pausa_superf_buffer, pausa_superf, 0);
	}
	else // Retornando ao jogo
	{
		esta_pausado = false;
		instance_activate_all();
		if (surface_exists(pausa_superf)) surface_free(pausa_superf);
		if (buffer_exists(pausa_superf_buffer)) buffer_delete(pausa_superf_buffer);
	}
}

gpu_set_blendenable(true);
