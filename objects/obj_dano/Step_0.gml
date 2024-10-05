
var _outro = instance_place(x, y, obj_entidade);

// Caso esteja tocando em outra entidade
if (_outro)
{
	// Caso não esteja em contato com a variavel pai
	if (_outro.id != pai)
	{
		// Checando se o inimigo possui o objeto pai como parente senão causa dano
		var _father = object_get_parent(_outro.object_index);
		if (_father != object_get_parent(pai.object_index))
		{
			if (_outro.vida_atual > 0) // permite ao jogador causar dano novamente
			{
				_outro.estado = "ferido";
				_outro.image_index = 0;
				_outro.vida_atual -= dano;
				
				// Checando se o inimigo está levando dano
				// Checando se o inimigo é filho do objeto inimigo_pai
				if (object_get_parent(_outro.object_index) == obj_inimigo_pai)
				{
					// Tremendo a tela ao levar dano
					screenshake(2);
				}
				instance_destroy();
			}
		}
	}
}
