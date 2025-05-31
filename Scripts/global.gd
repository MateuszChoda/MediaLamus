extends Node

var current_scene_name
var save_path = "user://save.json"
var loading = false

var login_data = {
	"admin": "admin"
}

signal scene_changed
signal wrong_password
signal wrong_login

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
	if login_data.has(login):
		if login_data.get(login) == password:
			change_scene(scene_path)
		else:
			wrong_password.emit()
	else:
		wrong_login.emit()
