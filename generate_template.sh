# This is a shell script to transform the PRODUCTNAME directory into a cookie-cutter template

# Copy the tree over
LOOKUP="PRODUCTNAME"
EXPANDED="{{ cookiecutter.project_name }}"

# Make the tree
for FILE in `find ./PRODUCTNAME -type d` ; do
    NEWFILE=`echo $FILE | sed -e "s/${LOOKUP}/${EXPANDED}/g"`
    echo "mkdir -p \"$NEWFILE\""
done

# Copy the files over
for FILE in `find ./PRODUCTNAME -type f` ; do
    NEWFILE=`echo $FILE | sed -e "s/${LOOKUP}/${EXPANDED}/g"`
    echo "cp \"$FILE\" \"$NEWFILE\""
done

# Do replacements

function replace {
    for FILE in `find ./PRODUCTNAME -type f` ; do
    NEWFILE=`echo $FILE | sed -e "s/${LOOKUP}/${EXPANDED}/g"`
        # Copy over incase the sed fails due to encoding
        echo "sed -e \"s/$1/$2/g\" \"$NEWFILE\" > t1 && mv t1 \"$NEWFILE\""
    done
}

replace "PRODUCTNAME" "{{ cookiecutter.project_name }}"
replace "ORGANIZATION" "{{ cookiecutter.company_name }}"
replace "Brian King" "{{ cookiecutter.lead_dev }}"
replace "brian.king@raizlabs.com" "{{ cookiecutter.lead_email }}"
replace "com.raizlabs.PRODUCTNAME" "{{ cookiecutter.bundle_identifier }}"