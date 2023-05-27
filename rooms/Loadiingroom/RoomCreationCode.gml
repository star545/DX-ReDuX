pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER WESTERN BUILD V3" // <--- NO IT FUCK ING ISNT YOU LIAR WTF!!
global.parallaxbg_surface = noone;
global.ParallaxMap = ds_map_create();

scr_default_parallax();
/*
scr_addParallaxLayer("Backgrounds_1", defaultParallax, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_2", defaultParallax, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_3", defaultParallax, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_4", defaultParallax, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_5", defaultParallax, [0.005, 0.005]);

scr_addParallaxLayer("Backgrounds_1Ground", defaultParallaxGround, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_2Ground", defaultParallaxGround, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_3Ground", defaultParallaxGround, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_4Ground", defaultParallaxGround, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_5Ground", defaultParallaxGround, [0.005, 0.005]);

scr_addParallaxLayer("Backgrounds_1H", defaultParallaxH, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_2H", defaultParallaxH, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_3H", defaultParallaxH, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_4H", defaultParallaxH, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_5H", defaultParallaxH, [0.005, 0.005]);

scr_addParallaxLayer("Backgrounds_1V", defaultParallaxV, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_2V", defaultParallaxV, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_3V", defaultParallaxV, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_4V", defaultParallaxV, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_5V", defaultParallaxV, [0.005, 0.005]);

scr_addParallaxLayer("Backgrounds_1Far", defaultParallaxFar, [0.35, 0.35]);
scr_addParallaxLayer("Backgrounds_2Far", defaultParallaxFar, [0.25, 0.25]);
scr_addParallaxLayer("Backgrounds_3Far", defaultParallaxFar, [0.15, 0.15]);
scr_addParallaxLayer("Backgrounds_4Far", defaultParallaxFar, [0.05, 0.05]);
scr_addParallaxLayer("Backgrounds_5Far", defaultParallaxFar, [0.005, 0.005]);

// Foregrounds.

scr_addParallaxLayer("Foregrounds_1", defaultParallax, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_2", defaultParallax, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_3", defaultParallax, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_4", defaultParallax, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_5", defaultParallax, [-0.005, -0.005]);

scr_addParallaxLayer("Foregrounds_1Ground", defaultParallaxGround, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_2Ground", defaultParallaxGround, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_3Ground", defaultParallaxGround, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_4Ground", defaultParallaxGround, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_5Ground", defaultParallaxGround, [-0.005, -0.005]);

scr_addParallaxLayer("Foregrounds_1H", defaultParallaxH, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_2H", defaultParallaxH, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_3H", defaultParallaxH, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_4H", defaultParallaxH, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_5H", defaultParallaxH, [-0.005, -0.005]);

scr_addParallaxLayer("Foregrounds_1V", defaultParallaxV, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_2V", defaultParallaxV, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_3V", defaultParallaxV, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_4V", defaultParallaxV, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_5V", defaultParallaxV, [-0.005, -0.005]);

scr_addParallaxLayer("Foregrounds_1Far", defaultParallaxFar, [-0.35, -0.35]);
scr_addParallaxLayer("Foregrounds_2Far", defaultParallaxFar, [-0.25, -0.25]);
scr_addParallaxLayer("Foregrounds_3Far", defaultParallaxFar, [-0.15, -0.15]);
scr_addParallaxLayer("Foregrounds_4Far", defaultParallaxFar, [-0.05, -0.05]);
scr_addParallaxLayer("Foregrounds_5Far", defaultParallaxFar, [-0.005, -0.005]);