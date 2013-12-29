#!/bin/bash
serve export . output
rsync -rv output/ dstutzman_danstutzman@ssh.phx.nearlyfreespeech.net:/home/public
