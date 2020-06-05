#! /bin/bash
# Links all IntelliJ Idea projects to the code directory
for T in ~/IdeaProjects/*
do
	F=$(basename $T)
	ln -s $T ~/code/$F
done
