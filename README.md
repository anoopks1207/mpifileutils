# mpifileutils

File utilities designed for scalability and performance

High-performance computing users generate large datasets using parallel applications that can run with thousands of processes. However, users are often stuck managing those datasets using traditional single-process tools like cp and rm. This mismatch in scale makes it impractical for users to work with their data.

The mpiFileUtils suite solves this problem by offering MPI-based tools for basic tasks like copy, remove, and compare for such datasets, delivering orders of magnitude in performance speedup over their single-process counterparts. Furthermore, the libmfu library packages common functionality to simplify the creation of new tools, and it can even be invoked directly from within HPC applications.

## Utilities

The tools in mpiFileUtils are MPI applications. They must be launched as MPI applications, e.g., within a compute allocation on a cluster using mpirun. The tools do not currently checkpoint, so one must be careful that an invocation of the tool has sufficient time to complete before it is killed.

dbcast - Broadcast a file to each compute node.

dbz2 - Compress and decompress a file with bz2.

dchmod - Change owner, group, and permissions on files.

dcmp - Compare contents between directories or files.

dcp - Copy files.

ddup - Find duplicate files.

dfind - Filter files.

dreln - Update symlinks to point to a new path.

drm - Remove files.

dstripe - Restripe files (Lustre).

dsync - Synchronize source and destination directories or files.

dtar - Create and extract tape archive files.

dwalk - List, sort, and profile files.

## Installation

Run **install.sh** with out any arguments. This will compile and install mpifileutils with all required dependencies.

### Following sbatch samples can be used as a reference to trigger job runs from slurm.

```
dwalk.sbatch - Scan the source file system and dump output to a file.
```
  The default file format is a binary file intended for use in other tools, not humans, but one can ask for a text-based output:

  **dwalk --text --output list.txt /path/to/walk**

  The text-based output is lossy, and it cannot be read back in to a tool. If you want both, save to binary format first, then read the binary file to convert it to text.

  **dwalk --output list.mfu /path/to/walk
  dwalk --input list.mfu --text --output list.txt**

```
dcp.sbatch - Copy all files/folder to another file system.

```
--bufsize SIZE : Set the I/O buffer to be SIZE bytes. Units like "MB" and "GB" may immediately follow the number without spaces (e.g. 8MB). The default bufsize is 4MB.

--chunksize SIZE : Multiple processes copy a large file in parallel by dividing it into chunks. Set chunk to be at minimum SIZE bytes. Units like "MB" and "GB" can immediately follow the number without spaces (e.g. 64MB). The default chunksize is 4MB.
  
  Parameters to consider while deciding chunk space:
   - Number of cores available
   - Memory available per core
 
 *To get the advantage of parallelization, you need the number of chunks to at least equal the number of worker cores available (or better, the number of worker cores times 2). Otherwise, some workers will stay idle.*

```
dsync.sbatch - Sync the source and destination file system.
```

 For large directory trees, the --batch-files option offers a type of checkpoint.
    It moves files in batches, and if interrupted, a restart picks up from the last completed batch.:


**For detailed documentation, please refer** [ https://mpifileutils.readthedocs.io/en/v0.11.1/index.html ]

## KNOWN BUGS

The maximum supported file name length for any file transferred is approximately 4068 characters
