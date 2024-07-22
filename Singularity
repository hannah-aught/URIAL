Bootstrap: docker
From: continuumio/miniconda3

%files
	env.yml

%post
	/opt/conda/bin/conda env create -f env.yml

%runscript
	exec /usr/bin/sh "$@"
