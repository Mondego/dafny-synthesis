for FILE in [0-9]*/*.dfy
do
echo "$FILE"
dafny resolve "$FILE"
done
