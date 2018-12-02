swaymsg(1)

# NAME

swaymsg - Send messages to a running instance of sway over the IPC socket.

# SYNOPSIS

_swaymsg_ [options...] [message]

# OPTIONS

*-h, --help*
	Show help message and quit.

*-m, --monitor*
	Monitor for responses until killed instead of exiting after the first
	response. This can only be used with the IPC message type _subscribe_. If
	there is a malformed response or an invalid event type was requested,
	swaymsg will stop monitoring and exit.

*-q, --quiet*
	Sends the IPC message but does not print the response from sway.

*-r, --raw*
	Use raw output even if using a tty.

*-s, --socket* <path>
	Use the specified socket path. Otherwise, swaymsg will ask sway where the
	socket is (which is the value of $SWAYSOCK, then of $I3SOCK).

*-t, --type* <type>
	Specify the type of IPC message. See below.

*-v, --version*
	Print the version (of swaymsg) and quit.

# IPC MESSAGE TYPES

*<command>*
	The message is a sway command (the same commands you can bind to keybindings
	in your sway config file). It will be executed immediately.

	See **sway**(5) for a list of commands.

*get\_workspaces*
	Gets a JSON-encoded list of workspaces and their status.

*get\_inputs*
	Gets a JSON-encoded list of current inputs.

*get\_outputs*
	Gets a JSON-encoded list of current outputs.

*get\_tree*
	Gets a JSON-encoded layout tree of all open windows, containers, outputs,
	workspaces, and so on.

*get\_seats*
	Gets a JSON-encoded list of all seats,
	its properties and all assigned devices.

*get\_marks*
	Get a JSON-encoded list of marks.

*get\_bar\_config*
	Get a JSON-encoded configuration for swaybar.

*get\_version*
	Get JSON-encoded version information for the running instance of sway.

*get\_binding\_modes*
	Gets a JSON-encoded list of currently configured binding modes.

*get\_config*
	Gets a JSON-encoded copy of the current configuration.

*send\_tick*
	Sends a tick event to all subscribed clients.

*subscribe*
	Subscribe to a list of event types. The argument for this type should be
	provided in the form of a valid JSON array. If any of the types are invalid
	or if an valid JSON array is not provided, this will result in an failure.