##############
DFHack Scripts
##############

Lua or ruby scripts placed in the ``hack/scripts/`` directory are considered for
execution as if they were native DFHack commands. They are listed at the end
of the ``ls`` command output.

Note: scripts in subdirectories of hack/scripts/ can still be called, but will
only be listed by ls if called as ``ls -a``. This is intended as a way to hide
scripts that are obscure, developer-oriented, or should be used as keybindings
or from the init file.

``kill-lua`` stops any currently-running Lua scripts. By default, scripts can
only be interrupted every 256 instructions. Use ``kill-lua force`` to interrupt
the next instruction.

.. contents::

==============
Subdirectories
==============

.. toctree::

   3rdparty/README
   devel/README
   fix/README
   gui/README
   modtools/README

=======
Scripts
=======
These scripts are not stored in any subdirectory, and can be invoked directly.

.. toctree::
   :hidden:
   
   include-all

.. include:: include-all.rst

