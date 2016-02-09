#! /usr/bin/env bash

#which state has highest population

datasets="/Users/loganlangholz/documents/class_files/graduate/spring_2016/genome_analysis/projects/data-sets"

states="$datasets/misc/states.tab.gz"

example_answer_1=$(gzcat $states \
    | grep -v '^#'\
    | cut -f1,2 \
    | sort -k2n \
    | tail -n1 \
    | cut -f1 \
    | sed 's/"//g')
   # tr '"' '')
    # sed: substitutes this for that
#unzips file, reverse greps line that starts with #, cuts first 2 columns, sorts based on pop ascending,
#takes the bottom 1 entry, cuts the state name
echo "example_answer: $example_answer_1"
# >answers.yml for first answer, >> answers.yml for second (append)

#------------------------------
#q1: murder rate is in column 6
answer_1=$(gzcat $states \
    | grep -v '^#'\
    | cut -f1,6 \
    | sort -k2n \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g') \

echo "answer-1: $answer_1" > answers.yml    
echo "answer-1: $answer_1"    
#-----------------------------
#q2: sequence records start with >
sample="$datasets/fasta/sample.fa"
answer_2=$(cat $sample \
    | grep '^>' \
    | wc -l)

echo "answer-2: $answer_2" >> answers.yml
echo "answer-2: $answer_2"
#------------------------------
#q3: ID's are in 4th column
cpg="$datasets/bed/cpg.bed.gz"
answer_3=$(gzcat $cpg \
    | cut -f4 \
    | sort \
    | uniq \
    | wc -l)

echo "answer-3: $answer_3" >> answers.yml
echo "answer-3: $answer_3"
#-----------------------------
#q4: # of records = # of lines that start with '@cluster'
SP1="$datasets/fastq/SP1.fq"
answer_4=$(cat $SP1 \
    | grep '^@cluster' \
    | wc -l)

echo "answer-4: $answer_4" >> answers.yml
echo "answer-4: $answer_4"

#-----------------------------
#q5: count total words on lines that contain 'bloody'
hamlet="$datasets/misc/hamlet.txt"
answer_5=$(cat $hamlet \
    | grep 'bloody' -i \
    | wc -w)

echo "answer-5: $answer_5" >> answers.yml
echo "answer-5: $answer_5"

#---------------------------
#q6: sequences are lines that don't start with ">"
answer_6=$(cat  $sample \
    | grep -v '^>' \
    | head -n1 \
    | tr -d '\n\r' \
    | wc -c)

echo "answer-6: $answer_6" >> answers.yml
echo "answer-6: $answer_6"

#----------------------------
#q7: name of longest gene (column 3-2, name in column 3)
gene="$datasets/bed/genes.hg19.bed.gz"
answer_7=$(gzcat $gene \
    |awk '{print $4, $3-$2}' \
    |sort -k2nr \
    |head -n1 \
    |cut -f1 -d' ')

echo "answer-7: $answer_7"
echo "answer-7: $answer_7" >> answers.yml

#---------------------------
#q8: unique chromosomes (column 1)
answer_8=$(gzcat $gene \
    | cut -f1 \
    | sort \
    | uniq \
    | wc -l)


echo "answer-8: $answer_8"
echo "answer-8: $answer_8" >> answers.yml

#----------------------------
#q9: intervals associated with CTCF
peaks="$datasets/bed/peaks.chr22.bed.gz"
answer_9=$(gzcat $peaks \
    | grep 'CTCF$' \
    | wc -l)
echo "answer-9: $answer_9"
echo "answer-9: $answer_9" >> answers.yml

#---------------------------
#q10: on which chromosome is the largest interval?
lamina="$datasets/bed/lamina.bed"
answer_10=$(cat $lamina \
    | awk '{print $1, $3-$2}' \
    | sort -k2nr \
    | head -n1 \
    | cut -f1 -d' ')

echo "answer-10: $answer_10"
echo "answer-10: $answer_10" >> answers.yml
#-------------------------







