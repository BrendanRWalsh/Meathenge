/// @description Insert description here
// You can write your code in this editor

function spawn_foe(){
	edge = irandom(3)
	show_debug_message(edge)
	switch(edge){
		case 0:
			spawn_x = room_width;
			spawn_y = random_range(0,room_height);
			break
		case 1:
			spawn_x = random_range(0,room_width);
			spawn_y = 0
			break
		case 2:
			spawn_x = 0
			spawn_y = random_range(0,room_height);
			break
		case 3:
			spawn_x = random_range(0,room_width);
			spawn_y = room_height
			break
	}
	_foe = enemy_units[wave_units[0]]
	e = instance_create_layer(spawn_x,spawn_y,"instances",obj_enemy)
	e.hp =  _foe.hp
	e.move_speed =  _foe.speed
	e.defence =  _foe.defence
	e.attack_radius =  _foe.attack_radius
	e.sight_radius =  _foe.sight_radius
	e.attack_speed =  _foe.attack_speed
	e.memory =  _foe.memory
	e.allow_knockback =  _foe.allow_knockback
	e.knockback_resistance =  _foe.knockback_resistance
	e.sprite_index = _foe.sprite
	array_delete(wave_units,0,1)
	return e
}


if spawn_timer <= 0 {
	if array_length(wave_units) > 0{
		if instance_number(obj_enemy) < max_spawn{
			spawn_foe()
		}
	} else {
		event_user(0)
	}
	spawn_timer = spawn_rate
} else {
	spawn_timer--;
}
