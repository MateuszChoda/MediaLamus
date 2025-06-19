extends Control


func _on_button_pressed() -> void:
	if button.text == "AGD":
		signal.emit(Global.ProductTypes.AGD)
