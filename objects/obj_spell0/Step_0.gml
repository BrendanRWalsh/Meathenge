/// @description Insert description here
// You can write your code in this editor
function home_in(target,rotation_speed,damping){
	new_dir = point_direction(x, y, target.x, target.y);
	new_spd = max(rotation_speed, 0);
	dmp = clamp(damping, 0, 1);

	dir -= clamp(angle_difference(dir, new_dir) * dmp, -new_spd, new_spd); //Smoothly rotate to aim position.
}

//move obj
x += lengthdir_x(spd,dir)
y += lengthdir_y(spd,dir)
if has_target {
	try{
		home_in(target,3,0.9);
		if point_distance(x,y,target.x,target.y) >  homing_radius {
			target = noone
			has_target = false;
		}
	}catch(error){}
}
if homing {
	if !has_target{
		var _list = ds_list_create();
		var _num = collision_circle_list(x,y,homing_radius,obj_enemy,false,true,_list,true)
		if (_num > 0){
			target = _list[| 0];
			has_target = true
			}
		ds_list_destroy(_list)
	}
	//_direction_to_enemy = point_direction(x,y,target.x,target.y);
	//_length = point_distance(x,y,target.x,target.y)
	//_offset_x = x + lengthdir_x(_length,_direction_to_enemy)
	//_offset_y = y + lengthdir_y(_length,_direction_to_enemy)
	
}

//collision
	//map edge
	if x < 0 || x > room_width || y < 0 || y > room_height {
		instance_destroy()
	}
	//enemy
	_inst = instance_place(x,y,obj_enemy);
	if _inst != noone {
		_inst.x += lengthdir_x(knockback,dir)
		_inst.y += lengthdir_y(knockback,dir)
		_inst.hp -= damage
		_inst.knocked_back = true
		_inst.recoil_time = _inst.recoil_value;
		instance_destroy()
	}
	
//age
life_remaining--
if life_remaining <= 0 {
	instance_destroy()
}