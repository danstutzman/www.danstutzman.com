#!/bin/bash
bundle exec serve export . output
bundle exec bitballoon deploy output
