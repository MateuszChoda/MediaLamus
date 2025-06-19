extends Control

@onready var container = $ColorRect/ScrollContainer/VBoxContainer
@onready var label = $ColorRect/Label
@onready var item: PackedScene = preload("res://Base/template.tscn")
@onready var confirm_popup = $ConfirmPopup

func _ready() -> void:
	Global.main_screen_btn_pressed.connect(_on_main_screen_button_pressed)

func _on_main_screen_button_pressed(prod_type: Global.ProductTypes):
	if prod_type == Global.ProductTypes.AGD:
		label.text = "AGD"
	elif prod_type == Global.ProductTypes.RTV:
		label.text = "RTV"
	elif prod_type == Global.ProductTypes.PERSONAL_COMPUTER:
		label.text = "Komputery osobiste"
	elif prod_type == Global.ProductTypes.SMARTPHONE:
		label.text = "Smartfony"
	elif prod_type == Global.ProductTypes.AUDIO:
		label.text = "Audio"
	elif prod_type == Global.ProductTypes.GAMING:
		label.text = "Gaming"
	for key in Global.products:
		var properties = Global.products[key]
		if properties["type"] == prod_type:
			var new_item = item.instantiate()
			container.add_child(new_item)
			new_item.call_deferred("add_new", key, properties["price"], properties["type"])

func _on_home_btn_pressed() -> void:
	if Global.administrator == true:
		Global.change_scene("res://Base/admin_screen.tscn")
	else:
		Global.change_scene("res://Base/main_screen.tscn")

func _on_cart_btn_pressed() -> void:
	Global.change_scene("res://Base/cart_screen.tscn")
