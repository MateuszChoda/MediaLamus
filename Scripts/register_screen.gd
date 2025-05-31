extends Control

@onready var login = $ColorRect/Login
@onready var haslo = $ColorRect/Haslo
@onready var haslo2 = $ColorRect/Haslo2
@onready var warning = $ColorRect/Warning
@onready var register = $ColorRect/Register

func _ready():
	warning.visible = false
	register.disabled = true
	Global.wrong_login.connect(_on_wrong_login)
	Global.mismatched_password.connect(_on_mismatched_password)

func _on_login_text_changed(new_text: String) -> void:
	if haslo.text != "" and haslo2.text != "":
		register.disabled = false

func _on_login_text_submitted(new_text: String) -> void:
	if haslo.text != "" and haslo2.text != "":
		Global.register_pressed(login.text, haslo.text, haslo2.text, "res://Base/login_screen.tscn")
	elif haslo.text != "":
		warning.text = "Potwierdź hasło!"
		warning.visible = true
	elif haslo2.text != "":
		warning.text = "Podaj hasło!"
		warning.visible = true
	else:
		warning.text = "Podaj i potwierdź hasło!"
		warning.visible = true



func _on_haslo_text_changed(new_text: String) -> void:
	if haslo.text != "" and haslo2.text != "":
		register.disabled = false


func _on_haslo_text_submitted(new_text: String) -> void:
	if login.text != "" and haslo2.text != "":
		Global.register_pressed(login.text, haslo.text, haslo2.text, "res://Base/login_screen.tscn")
	elif login.text != "":
		warning.text = "Potwierdź hasło!"
		warning.visible = true
	elif haslo2.text != "":
		warning.text = "Podaj login!"
		warning.visible = true
	else:
		warning.text = "Podaj email i potwierdź hasło!"
		warning.visible = true


func _on_haslo_2_text_changed(new_text: String) -> void:
	if haslo.text != "" and haslo2.text != "":
		register.disabled = false


func _on_haslo_2_text_submitted(new_text: String) -> void:
	if login.text != "" and haslo.text != "":
		Global.register_pressed(login.text, haslo.text, haslo2.text, "res://Base/login_screen.tscn")
	elif login.text != "":
		warning.text = "Potwierdź hasło!"
		warning.visible = true
	elif haslo.text != "":
		warning.text = "Podaj login!"
		warning.visible = true
	else:
		warning.text = "Podaj email i hasło!"
		warning.visible = true


func _on_register_pressed() -> void:
	if login.text != "" and haslo.text != "" and haslo2.text != "":
		Global.register_pressed(login.text, haslo.text, haslo2.text, "res://Base/login_screen.tscn")


func _on_sign_in_pressed() -> void:
	Global.change_scene("res://Base/login_screen.tscn")

func _on_wrong_login():
	warning.text = "Podany adres email jest już zarejestrowany!"
	warning.visible = true

func _on_mismatched_password():
	warning.text = "Podane hasła są różne!"
	warning.visible = true
