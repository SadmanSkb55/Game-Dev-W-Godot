extends StaticBody2D

var item = 1
var coin = Global.coins

func _ready():
	self.visible=false
	$icon.play("Nori")
	$ItemName.bbcode_text = "Nori"
	$ItemAmount.bbcode_text = str(Global.nori)
	$AmtOfCoins.bbcode_text = str(coin)
	update_ui()

func _on_button_2_pressed():
	swap_item_back()

func _on_button_3_pressed():
	swap_item_forward()

func swap_item_back():
	item -= 1
	if item < 1:
		update_ui()

func swap_item_forward():
	item += 1
	if item > 1:
		update_ui()

func hide_ui():
	self.visible = false

func show_ui():
	self.visible = true

func _input(event):
	if event.is_action_pressed("i"):
		if self.visible:
			hide_ui()
		else:
			show_ui()

func update_ui():
	if item == 1:
		$icon.play("Nori")
		$ItemName.bbcode_text = "Nori"
		$ItemAmount.bbcode_text = str(Global.nori)
	elif item == 2:
		$icon.play("rice")
		$ItemName.bbcode_text = "Rice"
		$ItemAmount.bbcode_text = str(Global.rice)
	elif item == 3:
		$icon.play("soysauce")
		$ItemName.bbcode_text = "Soy Sauce"
		$ItemAmount.bbcode_text = str(Global.soysauce)
	elif item == 4:
		$icon.play("wasabi")
		$ItemName.bbcode_text = "Wasabi"
		$ItemAmount.bbcode_text = str(Global.wasabi)
	elif item == 5:
		$icon.play("pickledginger")
		$ItemName.bbcode_text = "Pickled Ginger"
		$ItemAmount.bbcode_text = str(Global.pickledginger)
	elif item == 6:
		$icon.play("vinegar")
		$ItemName.bbcode_text = "Rice Vinegar"
		$ItemAmount.bbcode_text = str(Global.ricevinegar)
	elif item == 7:
		$icon.play("sugar")
		$ItemName.bbcode_text = "Sugar"
		$ItemAmount.bbcode_text = str(Global.sugar)
	elif item == 8:
		$icon.play("salt")
		$ItemName.bbcode_text = "Salt"
		$ItemAmount.bbcode_text = str(Global.salt)
	elif item == 9:
		$icon.play("tuna")
		$ItemName.bbcode_text = "Tuna"
		$ItemAmount.bbcode_text = str(Global.tuna)
	elif item == 10:
		$icon.play("salmon")
		$ItemName.bbcode_text = "Salmon"
		$ItemAmount.bbcode_text = str(Global.salmon)
	elif item == 11:
		$icon.play("crabmeat")
		$ItemName.bbcode_text = "Crabmeat"
		$ItemAmount.bbcode_text = str(Global.crabmeat)
	elif item == 12:
		$icon.play("cucumber")
		$ItemName.bbcode_text = "Cucumber"
		$ItemAmount.bbcode_text = str(Global.cucumber)
	elif item == 13:
		$icon.play("avocado")
		$ItemName.bbcode_text = "Avocado"
		$ItemAmount.bbcode_text = str(Global.avocado)
	elif item == 14:
		$icon.play("carrot")
		$ItemName.bbcode_text = "Carrot"
		$ItemAmount.bbcode_text = str(Global.carrot)
	elif item == 15:
		$icon.play("onion")
		$ItemName.bbcode_text = "Onion"
		$ItemAmount.bbcode_text = str(Global.onions)
	elif item == 16:
		$icon.play("seed")
		$ItemName.bbcode_text = "Seed"
		$ItemAmount.bbcode_text = str(Global.seed)
	elif item == 17:
		$icon.play("mirin")
		$ItemName.bbcode_text = "Mirin"
		$ItemAmount.bbcode_text = str(Global.mirin)
