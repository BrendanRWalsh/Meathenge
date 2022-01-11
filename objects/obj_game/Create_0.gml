/// @description Insert description here
// You can write your code in this edito

//wave mechanics
spawn_rate = 3 * room_speed
spawn_timer = spawn_rate
max_spawn = 4;
blud = surface_create(room_height,room_width);
debug_view = false;

randomize();
current_wave = 0
spawn_budget = 5
spawn_hp_mod = 1

enemy_units = [
	{	
		type : "normal",
		hp : 100,
		cost : 1,
		speed : 3,
		defence : 1,
		attack_radius : 50,
		sight_radius : 150,
		attack_speed: 1,
		memory: 2,
		allow_knockback : true,
		knockback_resistance: 0,
		sprite : spr_normal_palceholder
	},
	{
		type : "fast",
		hp : 20,
		cost : 0.2,
		speed : 6,
		defence : 1,
		attack_radius : 50,
		sight_radius : 150,
		attack_speed: 0.8,
		memory: 2,
		allow_knockback : true,
		knockback_resistance: 0,
		sprite : spr_normal_palceholder
	},
	{	
		type : "armoured",
		hp : 400,
		cost : 4,
		speed : 2,
		defence : 4,
		attack_radius : 50,
		sight_radius : 150,
		attack_speed: 1,
		memory: 2,
		allow_knockback : true,
		knockback_resistance: 0,
		sprite : spr_normal_palceholder
	},
	{
		type : "mage",
		hp : 500,
		cost : 5,
		speed : 4,
		defence : 1,
		attack_radius : 50,
		sight_radius : 150,
		attack_speed: 1,
		memory: 2,
		allow_knockback : true,
		knockback_resistance: 0,
		sprite : spr_normal_palceholder
	},
	{
		type : "tank",
		hp : 1000,
		cost : 10,
		speed : 1,
		defence : 10,
		attack_radius : 50,
		sight_radius : 150,
		attack_speed: 1,
		memory: 2,
		allow_knockback : false,
		knockback_resistance: 0,
		sprite : spr_normal_palceholder
	},
	{
		type : "behemoth",
		hp : 10000,
		cost: 100,
		speed : 2,
		defence : 20,
		attack_radius : 50,
		sight_radius : 150,
		attack_speed: 1,
		memory: 2,
		allow_knockback : false,
		knockback_resistance: 0,
		sprite : spr_normal_palceholder
	}
]
event_user(0)
show_debug_message(irandom(3))
