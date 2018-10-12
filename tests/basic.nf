#!/usr/bin/env nextflow
/*
 * Copyright (c) 2013-2018, Centre for Genomic Regulation (CRG).
 * Copyright (c) 2013-2018, Paolo Di Tommaso and the respective authors.
 *
 *   This file is part of 'Nextflow'.
 *
 *   Nextflow is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   Nextflow is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Nextflow.  If not, see <http://www.gnu.org/licenses/>.
 */
 
 
/* 
 * Command line input parameter 
 */
params.in = "$baseDir/data/sample.fa"

/* 
 * Define the input file 
 */
sequences = file(params.in)


/* 
 * split a fasta file in multiple files 
 */
process splitSequences {

    input:
    file 'input.fa' from sequences

    output:
    file 'seq_*' into records

    """
    awk '/^>/{f="seq_"++d} {print > f}' < input.fa
    """

}

/* 
 * Simple reverse the sequences 
 */
process reverse {

    input:
    file x from records
    
    output:
    stdout result

    """
    cat $x | rev
    """
}

/* 
 * print the channel content 
 */
result.subscribe { println it }