# Overview
Now that I work for an audio company, I should really learn more about the various technology that goes into making things sound great. I've decided to spend some time designing my own audio setup (outside of making my own speaker). This project is intended as a learning exercise, not as a product to sell. As such, the commits here may take interesting twists and turns.

# Repository
This repository contains the design files for the PCBs I intend to make. The idea is to eventually design the following stages:

1. [USB](#USB)
2. [DAC](#DAC)
3. [Amplifier](#Amplifier)

I intend to design these as discrete boards that can be chained together. This modular design should allow me to more easily iterate in things I care about. I imagine that I will make mistakes along the way, and will have to re-spin boards.

## USB
This stage is intended to be the interface between a digital audio source (e.g. computer) and the rest of the audio system. USB seemed to be a reasonable medium to use for this.

## DAC
This stage is responsible for receiving a stream of digital signals and converting it to an analog output that can be converted to sound by a speaker.

## Amplifier
This stage is responsible for taking the output of the DAC and amplifying it so that the speaker(s) output the desired level of sound.
