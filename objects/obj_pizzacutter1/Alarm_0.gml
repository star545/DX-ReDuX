if !place_meeting(x, y, obj_pizzacutter2) {
with instance_create(x, y, obj_pizzacutter2) image_angle = other.image_angle
create_particle(x, y, particle.genericpoofeffect)
}