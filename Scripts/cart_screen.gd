extends ColorRect


func _on_home_btn_pressed() -> void:
	if Global.administrator == true:
		Global.change_scene("res://Base/admin_screen.tscn")
	else:
		Global.change_scene("res://Base/main_screen.tscn")


func _on_cart_btn_pressed() -> void:
	Global.change_scene("res://Base/cart_screen.tscn")
