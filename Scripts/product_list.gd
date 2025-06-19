extends ColorRect

@onready var container = $ScrollContainer/VBoxContainer
@onready var item: PackedScene = preload("res://Base/template.tscn")

func _ready() -> void:
	self.visible = false

func _on_searchbar_text_changed(new_text: String) -> void:
	self.visible = true
	for key in Global.products:
		if key.contains(new_text):
			var properties = Global.products[key]
			var new_item = item.instantiate()
			container.add_child(new_item)
			new_item.call_deferred("add_new", key, properties["price"], properties["type"])
