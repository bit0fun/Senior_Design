# University of Rochester Senior Design Project: Low Power Server
## About the Project
We have designed and assessed the feasibility of a low power server that can display a website page within minimal latency (1-10 seconds) of a standard web server. Due to the complexity and time constraints, we have created designs for the motherboard, toolchain for the custom processor, and simulated programs of necessary drivers. The motherboard is ready to be sent for first prototypes, and the assembler and linker function flawlessly. The simulator runs Fusion-Core executable ELF files, with a proper memory view and register dump of the running program.

### The motherboard



### Fusion-Core ISA

### Fusion-Core Simulator

### Server Side Software

## Use Case
For low to mid range performance applications, we propose this to be a better solution than commercial servers. As the power consumption will be far lower, we take the trade off of performance as web applications are not CPU intensive. Outside of server farms and high performance computing, having systems that are underutilized yet draw a large amount of power, is a waste in terms of energy and space.

We do wish to clarify that this solution will not work for all use cases and we do not recommend use for a high number of accesses to the server, nor high compute power applications. In these use cases the benefits of a lower power server will not energy efficient compared to a commercial system due to the amount of time the program will run. While the Fusion-Core ISA does allow for custom instructions allowing for hardware acceleration, that part of the specification is still under development at the time of finishing this project. Due to this fact, we focused strictly on the main core instructions.

## Differences between Existing Solutions
The internet connection bandwidth and data transfer speed between the processor and Ethernet controller is the main bottleneck for these applications, so by reducing the performance of the processor we can maintain similar speeds or continue to lower performance to further reduce power consumption while still maintaining functionality as the rate users are used to.

Another important point is that the program to be run on the server is meant to be 'bare-metal' or run without an operating system. By reducing the program size, we not only can gain a small performance benefit, but also reduce the amount of execution time vs running in idle, and further reduce power consumption.

## FAQ
- [ Why not use a Raspberry Pi or old computer instead? ](#why-not-use-a-raspberry-pi-or-old-computer-instead)
- [ Why not use an existing ISA? ](#why-not-use-an-existing-isa)

### Why not use a Rapsberry Pi or old computer instead?
There are two main reasons to our decision of not using existing hardware. The larger of the two, would be fine control over the power draw of the system. Since the entire purpose of the design is to provide an overall lower power system, being able to choose and design an efficient power supply and high efficiency components is a requirement.

The second reason focuses on more of the software capability, as we are running the applications bare-metal. Without an operating system, again we get fine tuned control over what is going on, and can optimize for lower power as less excess code will be running. An added benefit of course is a bit more performance, as again no extra code would be running. With an existing system, we would need to have a complete understanding of how to create the drivers for that system. Due to most computers (if not all) not having freely available documentation, especially the Raspberry Pi with large binary blobs for certain drivers, we would not have been able to design a solution in the way we intended.


### Why not use an existing ISA?
While using an existing ISA may have reduced development time, using a custom ISA provides us with full understanding of the implementation. Instead of spending time sifting through existing  ISAs' (usually poor) documentation and learning what design decisions the creators have made, we can instead put time into developing our own system and then take less time in writing software as we developed the system from the ground up.

The reason why we chose to use the Fusion-Core ISA specifically, is the added bonus of expandability to the ISA. The Fusion-Core ISA allows for custom instruction additions, which are called Co-Processors in the specification, with the added bonus of forwards and backwards binary compatibility. In designs that require high reliability that will be implemented for long periods of time, this amount of customization and compatibility is certainly advantageous.  
