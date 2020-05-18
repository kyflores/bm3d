#!/bin/bash
build/bm3d \
	robin.png \
	30 \
 	robin_dn.png \
	-tau_2d_hard dct \
	-useSD_hard \
	-tau_2d_wien dct \
	-useSD_wien \
	-color_space opp \
	-patch_size 0 \
	-divide_num 16 \
	-active_cores 16 \
	-verbose 


