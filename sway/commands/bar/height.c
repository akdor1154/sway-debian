#include <stdlib.h>
#include <string.h>
#include "sway/commands.h"
#include "log.h"

struct cmd_results *bar_cmd_height(int argc, char **argv) {
	struct cmd_results *error = NULL;
	if ((error = checkarg(argc, "height", EXPECTED_EQUAL_TO, 1))) {
		return error;
	}
	int height = atoi(argv[0]);
	if (height < 0) {
		return cmd_results_new(CMD_INVALID, "height",
				"Invalid height value: %s", argv[0]);
	}
	config->current_bar->height = height;
	wlr_log(WLR_DEBUG, "Setting bar height to %d on bar: %s",
			height, config->current_bar->id);
	return cmd_results_new(CMD_SUCCESS, NULL, NULL);
}
