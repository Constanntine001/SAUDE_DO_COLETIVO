extends Node

#[CONSTANTES E VARIÁVEIS FIXAS]

# Salva o node do pepino(gato) para movimentar ele
@onready var pepino : Node2D = get_parent()

enum PepinoActions {Idle}
var pepinoAcaoAtual = PepinoActions.Idle

#[==========================]

#[ATRIBUTOS DO SCRIPT]

@export var proximaAcao : PepinoActions

#[==========================]




