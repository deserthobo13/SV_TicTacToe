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
vlog RArb9.sv RArb27.sv RArb36.sv Empty.sv priorityarbiter.sv Select3.sv Select4.sv playing_adjacent_edge.sv TwoInRow.sv TwoInArray.sv tictactoe.sv tb.sv

# start and run simulation
vsim -voptargs=+acc work.tb

view list
view wave

-- display input and output signals as hexidecimal values
# Diplays All Signals recursively
# add wave -hex -r /tb/*
add wave -noupdate -divider -height 32 "Top TicTacToe Module"
add wave -binary /tb/dut/xin
add wave -binary /tb/dut/oin
add wave -binary /tb/dut/move
add wave -binary /tb/dut/next_move
add wave -noupdate -divider -height 32 "Select4"
add wave -hex /tb/dut/comb/*
add wave -noupdate -divider -height 32 "Select4 RA"
add wave -hex /tb/dut/comb/ra/*
add wave -noupdate -divider -height 32 "TwoInArray blockx"
add wave -hex /tb/dut/blockx/*
add wave -noupdate -divider -height 32 "TwoInArray winx"
add wave -hex /tb/dut/winx/*
add wave -noupdate -divider -height 32 "Emptyx"
add wave -hex /tb/dut/emptyx/*
add wave -noupdate -divider -height 32 "Emptyx arbiter"
add wave -hex /tb/dut/emptyx/ra/*




add list -hex -r /tb/*
add log -r /*

-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 300 ns


