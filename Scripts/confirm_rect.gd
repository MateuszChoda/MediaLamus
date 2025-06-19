extends ColorRect

@onready var cart_screen = self.get_parent()

var item_name: String
var item_price: float
var item_type: Global.ProductTypes

func _ready() -> void:
	self.visible = false

func _set_data(new_name: String, new_price: float, new_type: Global.ProductTypes):
	item_name = new_name
	item_price = new_price
	item_type = new_type

func _on_reject_btn_pressed() -> void:
	self.visible = false


func _on_confirm_btn_pressed() -> void:
	Global.remove_prod_from_cart(item_name)
	cart_screen.total -= item_price
	cart_screen.refresh()
	self.visible = false
