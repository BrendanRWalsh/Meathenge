/// @description Insert description here
// You can write your code in this editor
function home_in(target,rotation_speed,damping){
	new_dir = point_direction(x, y, target.x, target.y);
	new_spd = max(rotation_speed, 0);
	dmp = clamp(damping, 0, 1);

	dir -= clamp(angle_difference(dir, new_dir) * dmp, -new_spd, new_spd); //Smoothly rotate to aim position.
}
if point_distance(x,y,obj_player.x,obj_player.y) < attract_range {
	home_in(obj_player,9,0.1)
	spd += 0.1
	spd *= 1.1
	clamp(spd,-max_speed,max_speed)
}


x += lengthdir_x(spd,dir)
y += lengthdir_y(spd,dir)

spd *= 0.95