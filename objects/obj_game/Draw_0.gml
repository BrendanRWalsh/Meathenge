/// @description Insert description here
// You can write your code in this editor
if !surface_exists(blud){
	blud = surface_create(room_height,room_width);
}

	surface_set_target(blud);
	draw_clear_alpha(c_black,0)
	gpu_set_blendmode(bm_add);
	with(obj_blood) {
		draw_self();
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target()
	
	gpu_set_alphatestenable(true);
	gpu_set_alphatestref(150);
	draw_surface_ext(blud,0,0,1,1,0,c_red,1)
	gpu_set_alphatestenable(false);