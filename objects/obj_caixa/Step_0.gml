/// @desc Logica de movimento e colisão da caixa
// Aplicando gravidade
if (!place_meeting(x, y + 1, obj_chao)) {
    velv += gravidade;
} else {
    velv = 0; // Parando de cair ao tocar o chão
}

// Movimento horizontal
x += velh;

// Limitando o movimento horizontal para a colisão com o chão
if (place_meeting(x + velh, y, obj_chao)) {
    velh = 0;
}

// Fazendo a caixa parar se nenhuma força for aplicada
velh = lerp(velh, 0, peso);

// Aplicando o movimento vertical
y += velv;

// Para ao colidir lateralmente com o chão
if (place_meeting(x + sign(velh), y, obj_chao)) {
    velh = 0;
}
