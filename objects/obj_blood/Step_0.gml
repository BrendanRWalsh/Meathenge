/// @description Insert description here
// You can write your code in this editor
function home_in(target){
	new_dir = point_direction(x, y, target.x, target.y);
	new_spd = max(rotation_speed, 0);
	dmp = clamp(damping, 0, 1);

	dir -= clamp(angle_difference(dir, new_dir) * dmp, -new_spd, new_spd); //Smoothly rotate to aim position.
}

home_in(obj_henge,3,0.5)
rotation_speed += 0.1
//move obj
x += lengthdir_x(spd,dir)
y += lengthdir_y(spd,dir)

//accelerate
spd *= 1.01

if spd >= max_speed {spd = max_speed}

if point_distance(x,y,obj_henge.x,obj_henge.y) < 10 {
	obj_henge.blood += value;
	instance_destroy();
}
depth = -y