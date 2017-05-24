# Diamond_simple
A simple workflow to run Diamond (blastx) given a diamond database.

To generate a diamond database:
    $ diamond makedb --in nr.faa -d nr

Before Start:

A file named 'list' needs to be created in the directory containing your Fasta/q files. The program will read 'list' in order to know what files need to be analyzed. Below is an example of how 'list' could be created:

Instructions:

Edit the VARIABLE DECLARATION section at the top of submit.sh to include the paths for the FASTA_DIR (location of fasta files and 'list') and DIAMOND_DIR (location of Diamond executable). Other variables can be edited as needed such as THREADS (# of CPUs). PRESETS only need to be changed if you are not using the default Swiss-Prot database.

Edit PBS ALLOCATIONS section at the top of diamondx.sh (found in script directory). Here is an example of a complete PBS ALLOCATIONS:

#---- PBS ALLOCATIONS ----

#PBS -W group_list=bhurwitz #PBS -q standard #PBS -l select=1:ncpus=4:mem=15gb #PBS -l pvmem=12gb #PBS -l place=pack:shared #PBS -l walltime=24:00:00 #PBS -l cput=24:00:00 #PBS -M jamesthornton@email.arizona.edu #PBS -m bea

Note that group_list, -q standard, and -M email, should be edited to include your group name, queue type, and email respectively.

Execute submit.sh

$ ./submit.sh 
