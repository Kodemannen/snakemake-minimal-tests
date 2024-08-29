
rm logs -rf
#snakemake --cores=1 --forcerun makefiles
snakemake --cores=1 

#
# echo "---------------------------"
# echo "  OUTPUT FROM LOG FILE:"
# echo "---------------------------"
# cat logs/*log.log
# echo " "
# echo "---------------------------"
# echo "  OUTPUT FROM ERROR FILE:"
# echo "---------------------------"
# cat logs/*log.err
# echo " "
