extends Control

@onready var login = $Background/Login
@onready var password = $Background/Haslo
@onready var sign_in = $Background/SignIn
@onready var register = $Background/Register

func _ready() -> void:
	sign_in.disabled = true

func _process(delta: float) -> void:
	pass

func _on_login_text_changed(new_text: String) -> void:
	pass # Replace with function body.


func _on_haslo_text_changed(new_text: String) -> void:
	pass # Replace with function body.


func _on_haslo_text_submitted(new_text: String) -> void:
	pass # Replace with function body.


func _on_login_text_submitted(new_text: String) -> void:
	pass # Replace with function body.


func _on_sign_in_pressed() -> void:
	pass # Replace with function body.


func _on_register_pressed() -> void:
	pass # Replace with function body.
