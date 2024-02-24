# CADDRISCV - Computer Architecture and Digital Design

Repository to track my self-study journey of learning computer architecture by reading the book *Computer Architecture and Digital Design: RISCV Edition* by Sarah L. Harris and David Harris. It contains my solutions to many of the end-of-chapter exercises:

* All exercises can be found in each chapter's PDF. There is a corresponding TeX file,
since I use TeX to typeset my work.

* Some exercises required creating HDL modules, so you will find ones I have written.

* There are many images. Some I've drawn, others I have snipped from logisim, the companion
website, or other tools for drawing circuits or plotting figures.

Not all of my answers may be right, but I've worked out enough exercises to feel confident to move on to the next Chapter I wish to work on.

## Writing HDL with Quartus II

For the HDL exercises, I have used Intel's Quartus II, as recommended in the preface of the book.
You can download the free [Intel Quartus II Web Edition at Intel's Website](https://www.intel.com/content/www/us/en/software-kit/666221/intel-quartus-ii-web-edition-design-software-version-13-1-for-windows.html).
As you are going through the installation, be sure that the option for ModelSim is checked, which is
the tool for simulating circuits.

### Creating a Quartus Project

Open QUARTUS II and click the `New Project Wizard` from the main page. Alternatively, go to
`File -> New -> New Quartus II Project`. Click `Next`, and you will asked for a working directory
for the project. Find the directory of interest, or create a new one. For example, I use a path like:

```
C:/Users/gserg/Documents/SelfStudy/ComputerArchitecture/RISCV-Harris/04-Hardware-Description-Languages/exercises/hdl/03-04-xor4
```

For the project name, I use the same as the working directory name, or `03-04-xor4` in the example above.
For the name of the top-level design entity, I might use a different name. For example, since I plan to
have a `xor4.vhd` with VHDL code describing my hardware for an 4-input XOR gate with a component name of
`xor4`, I set the to-level entity to `xor4`. Then, I click name, leaving all settings unchanged. In
page 4, I have the option to change the `Format`, which is where you specify if you to use `SystemVerilog`
or `VHDL`. After clicking `Next` one last time, you click `Finish`.

Now, you can create your HDL module by clicking `File -> New -> Design Files -> VHDL File` (or `SystemVerilog HDL File` if that's what you use). A text editor is opened where you can place your HDL code. After writing your
code, save it and give it a name (i.e., `xor4.vhd`). At this point, you can compile it, which will
synthesize the gates.

### Synthesis and Compilation

You must find the option to `Start Compilation`. One way to find it is by going to `Processing -> Start Compilation`, or the keyboard combination `CTRL+L` on Windows. The log messages will be displayed on the bottom, indicating any errors that occurred. If any do occur, address them and try again. When successful,
a message like `Full Compilation was successful` will be displayed. To see the gates that were synthesized, go to `Tools -> Netlist Viewers -> RTL Viewer`. 

### Testbench

You can write HDL code to run a simulation. Click `File -> New -> Design Files -> VHDL File` (or `SystemVerilog HDL File`). Chapter 4 shows three testbench examples, namely, HDL Examples 4.37, 4.38,
and 4.39. They are also available for download in the [Book Companion Resources](https://www.elsevier.com/books-and-journals/book-companion/9780128200643) by selecting the `HDL` asset. Choose one of them and
modify it, or create your own from scratch. Save the file as before, such as `tb_xor4.vhd` (`tb` is short for testbench).

If you are using a text file with vectors, as in HDL Example 4.39, create it by clicking `File -> New -> Other Files -> Text File`. Save the file with the name you want, such as `testvectors.txt`. Note that
in the case of the VHDL example, youn cannot use the relative file as `testvectors.txt` in:

```vhdl
-- mode code
FILE_OPEN(tv, "testvectors.txt", READ_MODE);
-- mode code
```

Since it's using ModelSim for simulation, it creates a temporary folder relative to your VHDL files,
at `./simulation/modelsim/`, and this is where the simulation will run; see [this StackExchange post](https://stackoverflow.com/questions/40359416/where-to-put-a-txt-file-if-i-want-to-read-it-out-from-the-integrated-simulator). Hence, the file path is relative
to this folder, and we just have to go two directories up to refer to the text file. Hence,
the correct path is `../../testvectors.txt`:

```vhdl
-- mode code
FILE_OPEN(tv, "../../testvectors.txt", READ_MODE);
-- mode code
```

Next, click `Assignments -> `EDA Tool Settings -> `Simulation`. Under `NativeLink settings`, click the
radio option that says `Compile test bench`, and click the now enabled `Test Benches...` button. On
the dialog that comes up, click `New...`. Another dialog comes up. Under `Test bench and simulation files`, click `...` which opens up a file browser. Find your testbench HDL file, in my case, `tb_xor4.vhd`. Click `Add`. On the `Test bench name` input, type a name for your testbench, which I will name
after my file, namely, `tb_xor4`. Click `OK` on the two dialogs that popped. Back on the settings dialog,
go to `Analysis & Synthesis Settings`, `VHDL Input`, and select the correct version. In my case, I am
using `VHDL 2008`, so I click that radio option. Finally, click `OK`.

To run the simulation, go to `Tools -> Run Simulation Tool -> RTL Simulation`. This will cause a
ModelSim ALTERA window to come up, with an overwhelming number of windows and options. The `Transcript`
window may show messages about the success or failure of the simulation. The `Wave` window shows the
waveform of the simulation. To toggle which windos are visible, go to `View` and toggle on/off the
window of interest.