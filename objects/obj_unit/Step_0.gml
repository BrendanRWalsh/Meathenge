/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

//
function wander(){
	target = {}
	target.x = random_range(x-wander_dist,x+wander_dist)
	target.y = random_range(y-wander_dist,y+wander_dist)

	//clamp to map
	if target.x < 0 {target.x = wander_dist};
	if target.x > room_width {target.x = room_width-wander_dist};
	if target.y < 0 {target.y = wander_dist};
	if target.y > room_height {target.y = room_height-wander_dist};				
}
function get_memory(){
	return random_range(memory*0.7, memory*1.3)
}
function find_target(obj){
	var _list = ds_list_create();
	var _num = collision_circle_list(x,y,sight_radius,obj,false,true,_list,true)
	if (_num > 0){
		target = _list[| 0];
		target_in_view = true;
		target_memory = get_memory();
		state = "approach"
		}
	ds_list_destroy(_list)
}

//state machine
if(!knocked_back){
	switch(state){
		//default
		case "idle":
			find_target(obj_enemy);
			if state == "idle" {wander()}
			break
		//approaching target not in attack radius
		case "approach":
	
			//move unit towards target
			dir = point_direction(x,y,target.x,target.y)
			goal_x = x + lengthdir_x(move_speed,dir)
			goal_y = y + lengthdir_y(move_speed,dir)
			x = goal_x
			y = goal_y
		
		
			//check if unit within attack range
			if point_distance(x,y,target.x,target.y) < attack_radius {
				state = "attack"
			}
		
			//check if unit within sight range
			if point_distance(x,y,target.x,target.y) < sight_radius {
				//ensure memory reset to full amount if true
				target_in_view = true;
				target_memory = get_memory();	
			} else {
				//otherwise countdown memory
				if target_in_view {
					//initial bool flip
					target_in_view = false;
					target_memory = get_memory();
				} else {
					target_memory--
				}
				//if memory has run out, then 
				if target_memory <= 0 {
					state = "idle"
				}	
			}

			break
		case "attack":
			//check if target died last frame
			if instance_exists(target) {
			
				//check if still in range
				if distance_to_object(target) > attack_radius {
					state = "approach"
				} else {
				//otherwise, attack
					//attack loop
					if attack_cooldown <= 0 {
						if attack_mode == "melee" {
							target.hp -= damage / target.defence //address target defence
						} else {
							s = instance_create_layer(x,y,"instances",obj_spell0)
							s.dir = point_direction(x,y,target.x,target.y)
						}
						attack_cooldown = attack_speed;
						
					} else {
						attack_cooldown--
					}
				}
			
				//run countdown on memory
				if !target_in_view {
					target_memory--
				}
			} else {
				//if target lost/dead return to idle
				state = "idle"
				target = noone
				attack_cooldown = 0
			}
			break

	}
} else {
	_xx = lengthdir_x(recoil,dir)
	_yy = lengthdir_y(recoil,dir)
	recoil *= 0.9
	x += _xx
	y += _yy
	recoil_time--
	
	if recoil_time <= 0 {
		knocked_back = false;
		recoil_time = recoil_value;
	}
}

if hp<= 0 {
	//create blood
	drops = max_hp
	while drops > 0 {
		b = instance_create_layer(x,y,"instances",obj_blood)
		b.dir = random_range(0,360)
		b.spd = random_range(0,5)
		if drops > 50 {
			b.value = 50
			drops -= 50
		} else {
			b.value = drops
			drops = 0
		}
	}
	
	//create mana
	m = instance_create_layer(x,y,"instances",obj_mana)
	m.mana = max_hp / 2
	instance_destroy()
	
}
depth = -y
depth = -y