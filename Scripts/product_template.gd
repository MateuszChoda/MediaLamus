class_name ProductTemplate
extends ColorRect

@onready var name_label = $Name
@onready var price_label = $Price
@onready var confirm_popup = get_tree().get_current_scene().get_child(-1)

@export var type: Global.ProductTypes

func _ready() -> void:
	name_label.text = ""
	price_label.text = ""

func add_new(new_name: String, new_price: float, new_type: Global.ProductTypes):
	name_label.text = new_name
	price_label.text = str(new_price).pad_decimals(2)
	type = new_type

func _on_button_pressed() -> void:
	confirm_popup._set_data(name_label.text, price_label.text.to_float(), type)
	confirm_popup.visible = true
