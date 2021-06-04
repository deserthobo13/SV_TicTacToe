# Copyright 1991-2016 Mentor Graphics Corporation
# 
# Modification by Oklahoma State University
# Use with Testbench 
# James Stine, 2008
# Go Cowboys!!!!!!
#
# All Rights Reserved.
#
# THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION
# OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.

# Use this run.do file to run this example.
# Either bring up ModelSim and type the following at the "ModelSim>" prompt:
#     do run.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run.do -c
# (omit the "-c" to see the GUI while running from the shell)

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog FSM.sv Status.sv RArb9.sv RArb36.sv Empty.sv priorityarbiter.sv Select4.sv playing_adjacent_edge.sv TwoInRow.sv TwoInArray.sv tictactoe.sv flopenr.sv flopr.sv mux2.sv top.sv tb.sv

# start and run simulation
vsim -voptargs=+acc work.tb

view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /tb/*
add wave -noupdate -dividEr -height 32 "Top game Module"
add wave -binary /tb/dut/clock
add wave -binary /tb/dut/reset
add wave -binary /tb/dut/xin
add wave -binary /tb/dut/next_move
add wave -binary /tb/dut/xin_star
add wave -binary /tb/dut/oin_star
add wave -binary /tb/dut/Go
add wave -noupdate -dividEr -height 32 "Top game Status"
add wave -binary /tb/dut/bad_move
add wave -binary /tb/dut/win_game
add wave -binary /tb/dut/draw_game
add wave -binary /tb/dut/lose_game
add wave -binary /tb/dut/playing_game
add wave -noupdate -divider -height 32 "Select4"
add wave -hex /tb/dut/game/comb/*
add wave -noupdate -divider -height 32 "Select4 RA"
add wave -hex /tb/dut/game/comb/ra/*
add wave -noupdate -divider -height 32 "TwoInArray blockx"
add wave -hex /tb/dut/game/blockx/*
add wave -noupdate -divider -height 32 "TwoInArray winx"
add wave -hex /tb/dut/game/winx/*
add wave -noupdate -divider -height 32 "Emptyx"
add wave -hex /tb/dut/game/emptyx/*
add wave -noupdate -divider -height 32 "Emptyx arbiter"
add wave -hex /tb/dut/game/emptyx/ra/*




add list -hex -r /tb/*
add log -r /*

-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 250
configure wave -valuecolwidth 200
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 1500 ns


