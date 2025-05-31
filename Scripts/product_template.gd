class_name ProductTemplate
extends ColorRect

@onready var name_label = $Name
@onready var price_label = $Price

@export var type: Global.ProductTypes

func _ready() -> void:
	name_label.text = ""
	price_label.text = ""

func add_new(new_name: String, new_price: int, new_type: Global.ProductTypes):
	name_label.text = new_name
	price_label.text = new_price
	type = new_type
