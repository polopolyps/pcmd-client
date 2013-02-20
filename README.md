The pcmd-client has been moved into the pcmd module instead due to the strong dependency between the two. This means that the pcmd-client source module should no longer be used and that it will not be maintained further!

pcmd-client
===========
The pcmd-client artifact is a "maven free" zip containing scripts and the required libraries to run pcmd on a polopoly environment. The source code of this project contains the pcmd scripts for linux/unix and windows environments and an assembly configuration that uses the maven dependency mechanisms to pull down all required dependencies into the resulting zip file.

