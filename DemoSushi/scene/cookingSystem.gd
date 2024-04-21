extends Control

var progress_bar: ProgressBar
var status_label: Label
var cookingInProgress = false

# Define recipes
var recipes = {
	"nigiri_sushi": {
		"rice": 1,
		"vinegar": 1,
		"salmon": 1,
		"tuna": 1,
		"wasabi": 1,
		"nori": 1
	},
	"sashimi": {
		"salmon": 1,
		"soysauce": 1,
		"wasabi": 1
	},
	"maki_sushi": {
		"rice": 1,
		"nori": 1,
		"tuna": 1,
		"cucumber": 1,
		"avocado": 1,
		"vinegar": 1
	},
	"temaki_sushi": {
		"rice": 1,
		"nori": 1,
		"salmon": 1,
		"cucumber": 1,
		"avocado": 1,
		"vinegar": 1
	},
	"gunkan_sushi": {
		"rice": 1,
		"salmon": 1,
		"vinegar": 1
	}
}

func _ready():
	# Initialize UI elements
	progress_bar = $ProgressBar
	status_label = $Label2
	progress_bar.visible = false
	status_label.visible = false

func start_cooking(recipe_name: String):
	if not cookingInProgress:
		cookingInProgress = true
		progress_bar.visible = true
		status_label.visible = true
		progress_bar.value = 0
		status_label.text = "Cooking " + recipe_name + "..."
		# Start cooking process
		start_cooking_process(recipe_name)

func start_cooking_process(recipe_name: String):
	# Here you would implement the cooking process
	var recipe = recipes[recipe_name]
	for ingredient_name in recipe.keys():
		var quantity_needed = recipe[ingredient_name]
		# Deduct ingredients from the inventory
		$Control.updateItemQuantity(ingredient_name, $Control.item_quantities[ingredient_name] - quantity_needed)
		# Simulate cooking progress with a timer
		await get_tree().create_timer(1.0)
	# Cooking finished
	cookingInProgress = false
	progress_bar.visible = false
	status_label.visible = true
	status_label.text = "Cooking " + recipe_name + " finished!"

func _process(delta):
	# Check for key press to start cooking
	if Input.is_action_pressed("k"):
		# Start cooking
		start_cooking("nigiri_sushi")
		# Show UI
		progress_bar.visible = true
		status_label.visible = true
	else:
		# Hide UI
		progress_bar.visible = false
		status_label.visible = false

func check_recipe_ingredients(recipe_name: String):
	var recipe = recipes[recipe_name]
	for ingredient_name in recipe.keys():
		var quantity_needed = recipe[ingredient_name]
		if $Control.item_quantities[ingredient_name] < quantity_needed:
			return false
	return true
