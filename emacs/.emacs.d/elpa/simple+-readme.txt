   Extensions to standard library `simple.el'.

 See also library `icicles.el' for extensions to `simple.el' that
 concern input completion in the minibuffer.  Those extensions used
 to be in this library, but they are used by `icicles.el', so they
 have been moved there.


 Variables defined here:

   `set-any-variable-value-history'.

 Functions defined here:

   `read-var-and-value', `set-any-variable'.


 ***** NOTE: The following user options defined in `simple.el' have
             been REDEFINED HERE:

   `next-error-highlight', `next-error-highlight-no-select'
                           - New value: `until-move' (persistent).


 ***** NOTE: The following functions defined in `simple.el' have
             been REDEFINED HERE:

   `edit-and-eval-command' - Bug fix for < Emacs 21: Adds COMMAND
                             as a command to `command-history', not
                             as a string.

   `kill-new'              - Bug fix for < Emacs 21: be sure
                             `kill-ring' is non-empty before trying
                             to replace kill.

   `next-error'            - `C-u C-u' just deletes highlighting

 ***** NOTE: This EMACS PRIMITIVE has been REDEFINED HERE:

   `set-variable' - Uses `read-var-and-value' to get args.
