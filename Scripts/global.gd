extends Node

var current_scene_name
var save_path = "user://save.json"
var loading = false

enum ProductTypes {AGD, RTV, PERSONAL_COMPUTER, SMARTPHONE, AUDIO, GAMING}

var login_data = {
	"admin": "admin"
}

var products = {}

signal scene_changed
signal wrong_password
signal wrong_login
signal mismatched_password

func _ready() -> void:
	current_scene_name = get_tree().get_current_scene().name

func change_scene(scene_path):
	current_scene_name = scene_path.get_file().get_basename()
	var current_scene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)
	current_scene.queue_free()
	var new_scene = load(scene_path).instantiate()
	get_tree().get_root().call_deferred("add_child", new_scene) 
	get_tree().call_deferred("set_current_scene", new_scene)    
	call_deferred("post_scene_change_initialization")
	
func post_scene_change_initialization():
	scene_changed.emit()

func sign_in_pressed(login, password, scene_path):
	if login == "admin":
		if password == "admin":
			change_scene("res://Base/admin_screen.tscn")
	elif login_data.has(login):
		if login_data.get(login) == password:
			change_scene(scene_path)
		else:
			wrong_password.emit()
	else:
		wrong_login.emit()

func register_pressed(login, password, passconf, scene_path):
	if login_data.has(login) == false:
		if password == passconf:
			login_data.set(login, password)
			change_scene(scene_path)
		else:
			mismatched_password.emit()
	else:
		wrong_login.emit()

func product_added(type: ProductTypes, prod_name: String, prodPrice: float):
	var prod_desc = {}
	prod_desc.set("price", prodPrice)
	prod_desc.set("type", type)
	products.set(prod_name, prod_desc)

func product_deleted(prod_name: String):
	if products.has(prod_name) == true:
		products.erase(prod_name)

func user_deleted(user_name: String):
	if login_data.has(user_name):
		login_data.erase(user_name)
