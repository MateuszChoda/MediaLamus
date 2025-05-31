extends Control

@onready var login = $Background/Login
@onready var password = $Background/Haslo
@onready var sign_in = $Background/SignIn
@onready var register = $Background/Register
@onready var warning = $Background/Warning
@onready var timer = $Timer

var number_of_attempts: int = 0

func _ready() -> void:
	sign_in.disabled = true
	warning.visible = false
	Global.wrong_login.connect(_on_wrong_login)
	Global.wrong_password.connect(_on_wrong_password)

func _process(delta: float) -> void:
	pass

func _on_login_text_changed(new_text: String) -> void:
	if password.text != "":
		sign_in.disabled = false


func _on_haslo_text_changed(new_text: String) -> void:
	if login.text != "":
		sign_in.disabled = false


func _on_haslo_text_submitted(new_text: String) -> void:
	if login.text != "":
		pass
	else:
		warning.text = "Podaj adres email!"
		warning.visible = true


func _on_login_text_submitted(new_text: String) -> void:
	if password.text != "":
		pass
	else:
		warning.text = "Podaj hasło!"
		warning.visible = true


func _on_sign_in_pressed() -> void:
	if login.text != "" and password.text != "":
		Global.sign_in_pressed(login.text, password.text, "")
	else:
		warning.text = "Podaj email i hasło!"
		warning.visible = true


func _on_register_pressed() -> void:
	Global.change_scene("res://Base/Register_screen.tscn")

func _on_wrong_login():
	warning.text = "Podano nieprawidłowy adres email!"
	warning.visible = true

func _on_wrong_password():
	if number_of_attempts < 4:
		number_of_attempts += 1
		warning.text = "Podano nieprawidłowe hasło, pozostało %s prób." % (4-number_of_attempts)
		warning.visible = true
	else:
		warning.text = "Przekroczono dozowloną liczbę prób, logowanie zablokowane na 5 minut."
		warning.visible = true
		timer.start()
		login.editable = false
		password.editable = false
		sign_in.disabled = true

func _on_timer_timeout() -> void:
	login.editable = true
	password.editable = true
	sign_in.disabled = false
