#!/bin/bash

cd /easyswoole \
	&& composer install
	&& php easyswoole start
