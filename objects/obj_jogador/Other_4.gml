/// @desc Auto save do jogo

// Sobrescrevendo um arquivo de save antigo
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

// Criando um novo arquivo de save
var _arquivo;
_arquivo = file_text_open_write(SAVEFILE);
file_text_write_real(_arquivo, room);
file_text_close(_arquivo);