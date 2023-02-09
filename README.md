# mpifileutils

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

Following sbatch samples can be used as a reference to trigger job runs from slurm.

**dwalk.sbatch** - Scan the source file system and dump output to a file.

**dcp.sbatch** - Copy all files/folder to another file system.

**dsync.sbatch** - Sync the source and destination file system.

    - For large directory trees, the --batch-files option offers a type of checkpoint. It moves files in batches, and if interrupted, a restart picks up from the last completed batch.:


**For detailed documentation, please refer** [ https://mpifileutils.readthedocs.io/en/v0.11.1/index.html ]
