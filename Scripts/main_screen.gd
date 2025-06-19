extends Control

func _ready() -> void:
	pass

func _on_agd_btn_pressed() -> void:
	Global.button_pressed(Global.ProductTypes.AGD)


func _on_rtv_btn_pressed() -> void:
	Global.button_pressed(Global.ProductTypes.RTV)


func _on_pc_btn_pressed() -> void:
	Global.button_pressed(Global.ProductTypes.PERSONAL_COMPUTER)


func _on_smartphone_btn_pressed() -> void:
	Global.button_pressed(Global.ProductTypes.SMARTPHONE)


func _on_audio_btn_pressed() -> void:
	Global.button_pressed(Global.ProductTypes.AUDIO)


func _on_gaming_btn_pressed() -> void:
	Global.button_pressed(Global.ProductTypes.GAMING)
