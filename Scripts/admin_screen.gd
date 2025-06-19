extends Control

@onready var addProductScreen = $BackgroundRect/AddProductScreen
@onready var delProductScreen = $BackgroundRect/DeleteProductScreen
@onready var delUserScreen = $BackgroundRect/DeleteUserScreen
@onready var addProduct = $BackgroundRect/AddProductScreen/Add
@onready var deleteProduct = $BackgroundRect/DeleteProductScreen/Delete
@onready var deleteUser = $BackgroundRect/DeleteUserScreen/DelUser
@onready var addProdName = $BackgroundRect/AddProductScreen/AddProductName
@onready var addProdPrice = $BackgroundRect/AddProductScreen/ProductPrice
@onready var menuButton = $BackgroundRect/AddProductScreen/MenuButton
@onready var addProdWarn = $BackgroundRect/AddProductScreen/Warning
@onready var delProdWarn = $BackgroundRect/DeleteProductScreen/Warning
@onready var delUserWarn = $BackgroundRect/DeleteUserScreen/Warning
@onready var delProdName = $BackgroundRect/DeleteProductScreen/DelProductName
@onready var delUserName = $BackgroundRect/DeleteUserScreen/UserName

func _ready() -> void:
	addProductScreen.visible = false
	delProductScreen.visible = false
	delUserScreen.visible = false
	addProduct.disabled = true
	deleteProduct.disabled = true
	deleteUser.disabled = true

func _on_add_product_pressed() -> void:
	addProductScreen.visible = true


func _on_delete_product_pressed() -> void:
	delProductScreen.visible = true


func _on_delete_user_pressed() -> void:
	delUserScreen.visible = true


func _on_add_pressed() -> void:
	if Global.products.has(addProdName.text):
		addProdWarn.text = "Dany produkt już istnieje!"
	elif addProdPrice.text.is_valid_float() == false:
		addProdWarn.text = "Podano nieprawidłową cenę!"
	elif menuButton.selected == -1:
		addProdWarn.text = "Nie wybrano typu produktu!"
	else:
		var prod_type: Global.ProductTypes
		if menuButton.selected == 0:
			prod_type = Global.ProductTypes.AGD
		if menuButton.selected == 1:
			prod_type = Global.ProductTypes.RTV
		if menuButton.selected == 2:
			prod_type = Global.ProductTypes.PERSONAL_COMPUTER
		if menuButton.selected == 3:
			prod_type = Global.ProductTypes.SMARTPHONE
		if menuButton.selected == 4:
			prod_type = Global.ProductTypes.AUDIO
		if menuButton.selected == 5:
			prod_type = Global.ProductTypes.GAMING
		Global.product_added(prod_type, addProdName.text, addProdPrice.text.to_float())
		addProdWarn.text = "Produkt dodany!"


func _on_return_pressed() -> void:
	addProductScreen.visible = false
	delProductScreen.visible = false
	delUserScreen.visible = false
	addProduct.disabled = true
	deleteProduct.disabled = true
	deleteUser.disabled = true


func _on_product_price_text_changed(new_text: String) -> void:
	if addProdName.text != "" and addProdPrice.text != "" and menuButton.selected != -1:
		if addProdPrice.text.is_valid_float():
			addProduct.disabled = false
		else:
			addProdWarn.text = "Podano nieprawidłową wartość ceny!"
			


func _on_product_name_text_changed(new_text: String) -> void:
	if addProdName.text != "" and addProdPrice.text != "" and menuButton.selected != -1:
		if addProdPrice.text.is_valid_float():
			addProduct.disabled = false
		else:
			addProdWarn.text = "Podano nieprawidłową wartość ceny!"


func _on_product_name_text_submitted(new_text: String) -> void:
	if addProdPrice.text == "" and menuButton.selected == -1:
		addProdWarn.text = "Podaj cenę i typ produktu"
	elif addProdPrice.text == "":
		addProdWarn.text = "Podaj cenę produktu"
	elif menuButton.selected == -1:
		addProdWarn.text = "Podaj typ produktu"
	elif addProdPrice.text.is_valid_float() == false:
		addProdWarn.text = "Podano nieprawidłową wartość ceny!"


func _on_product_price_text_submitted(new_text: String) -> void:
	if addProdName.text == "" and menuButton.selected == -1:
		addProdWarn.text = "Podaj nazwę i typ produktu"
	elif addProdName.text == "":
		addProdWarn.text = "Podaj nazwę produktu"
	elif menuButton.selected == -1:
		addProdWarn.text = "Podaj typ produktu"
	elif addProdPrice.text.is_valid_float() == false:
		addProdWarn.text = "Podano nieprawidłową wartość ceny!"


func _on_del_product_name_text_changed(new_text: String) -> void:
	deleteProduct.disabled = false


func _on_delete_pressed() -> void:
	if Global.products.has(delProdName.text):
		Global.product_deleted(delProdName.text)
		delProdWarn.text = "Produkt usunięty!"
	else:
		delProdWarn.text = "Podany produkt nie istnieje!"


func _on_user_name_text_changed(new_text: String) -> void:
	deleteUser.disabled = false


func _on_del_user_pressed() -> void:
	if Global.login_data.has(delUserName.text):
		Global.user_deleted(delUserName.text)
		delUserWarn.text = "Użytkownik usunięty!"
	else:
		delUserWarn.text = "Podany użytkownik nie istnieje!"
