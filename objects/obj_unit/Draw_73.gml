/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if obj_game.debug_view {
	draw_set_colour(c_white)
	if target != noone {draw_line(x,y,target.x,target.y)}
	draw_set_colour(c_fuchsia)
	draw_circle(x,y,sight_radius,true)
	draw_set_colour(c_red)
	draw_circle(x,y,attack_radius,true)
	draw_set_colour(c_grey);
	draw_rectangle(x-50,y-30,x+50,y-25,false)
	draw_set_colour(c_red);
	draw_rectangle(x-50,y-30,x-50 + 100*(hp/100),y-25,false)

	draw_text(x,y-30,hp)
}