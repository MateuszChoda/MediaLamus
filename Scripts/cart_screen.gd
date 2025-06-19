extends ColorRect

@onready var payment_screen = $PaymentScreen
@onready var container = $ScrollContainer/VBoxContainer
@onready var item: PackedScene = preload("res://Base/template.tscn")
@onready var confirm_popup = $ConfirmPopup

var total: float

func _ready() -> void:
	payment_screen.visible = false
	confirm_popup.visible = false
	for key in Global.cart:
		var properties = Global.cart[key]
		var new_item = item.instantiate()
		container.add_child(new_item)
		new_item.call_deferred("add_new", key, properties["price"], properties["type"])
		total += properties["price"]

func _process(delta: float) -> void:
	$Label3.text = str(total).pad_decimals(2)

func _on_home_btn_pressed() -> void:
	if Global.administrator == true:
		Global.change_scene("res://Base/admin_screen.tscn")
	else:
		Global.change_scene("res://Base/main_screen.tscn")


func _on_cart_btn_pressed() -> void:
	Global.change_scene("res://Base/cart_screen.tscn")


func _on_button_pressed() -> void:
	payment_screen.visible = true

func refresh():
	var items = container.get_children()
	for item in items:
		container.remove_child(item)
		item.queue_free()
	for key in Global.cart:
		var properties = Global.cart[key]
		var new_item = item.instantiate()
		container.add_child(new_item)
		new_item.call_deferred("add_new", key, properties["price"], properties["type"])
